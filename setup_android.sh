#!/bin/bash

# setup-android.sh
# Usage: ./setup-android.sh [optional: --with-keystore]

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ANDROID_DIR="$PROJECT_ROOT/android"
KEY_PROPERTIES="$ANDROID_DIR/key.properties"
BUILD_GRADLE="$ANDROID_DIR/app/build.gradle"

echo "🔧 Setting up Android environment for Flutter project..."

# --- Step 1: Opsional — generate key.properties + keystore ---
if [[ "$1" == "--with-keystore" ]]; then
  if [ ! -f "$KEY_PROPERTIES" ]; then
    echo "🔐 Generating upload keystore and key.properties..."
    read -p "Keystore password: " STORE_PASS
    read -p "Key password (can be same): " KEY_PASS
    read -p "Key alias (default: upload): " KEY_ALIAS
    KEY_ALIAS=${KEY_ALIAS:-upload}

    KEYSTORE_PATH="$ANDROID_DIR/app/upload-keystore.jks"

    # Generate keystore (Windows-compatible via keytool)
    keytool -genkey -v \
      -keystore "$KEYSTORE_PATH" \
      -storetype JKS \
      -keyalg RSA \
      -keysize 2048 \
      -validity 10000 \
      -alias "$KEY_ALIAS" \
      -storepass "$STORE_PASS" \
      -keypass "$KEY_PASS" \
      -dname "CN=Debug,O=MyVault,C=ID"

    # Create key.properties
    cat > "$KEY_PROPERTIES" <<EOF
storePassword=$STORE_PASS
keyPassword=$KEY_PASS
keyAlias=$KEY_ALIAS
storeFile=upload-keystore.jks
EOF

    echo "✅ Keystore created at: $KEYSTORE_PATH"
    echo "✅ key.properties created at: $KEY_PROPERTIES"
  else
    echo "⚠️  key.properties already exists. Skipping keystore generation."
  fi
else
  echo "ℹ️  Skipping keystore setup (for debug only)."
  echo "   To generate keystore later, run: ./setup-android.sh --with-keystore"
fi

# --- Step 2: Perbaiki build.gradle agar aman ---
echo "🛠️  Patching build.gradle for safe debug builds..."

# Backup original
cp "$BUILD_GRADLE" "$BUILD_GRADLE.bak"

# Gunakan sed untuk memperbaiki signing config
# Hanya gunakan custom signing jika key.properties ada
cat > "$BUILD_GRADLE" <<EOF
plugins {
    id "com.android.application"
    id "kotlin-android"
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id "dev.flutter.flutter-gradle-plugin"
}

def localProperties = new Properties()
def localPropertiesFile = rootProject.file("local.properties")
if (localPropertiesFile.exists()) {
    localPropertiesFile.withReader("UTF-8") { reader ->
        localProperties.load(reader)
    }
}

def flutterVersionCode = localProperties.getProperty("flutter.versionCode")
if (flutterVersionCode == null) {
    flutterVersionCode = "1"
}

def flutterVersionName = localProperties.getProperty("flutter.versionName")
if (flutterVersionName == null) {
    flutterVersionName = "1.0"
}

def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "com.template.my_template"
    compileSdk = 36
    ndkVersion = flutter.ndkVersion

    kotlinOptions {
        jvmTarget = "17"
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    signingConfigs {
        release {
            if (System.getenv()["CI"]) {
                storeFile file(System.getenv()["CM_KEYSTORE_PATH"])
                storePassword System.getenv()["CM_KEYSTORE_PASSWORD"]
                keyAlias System.getenv()["CM_KEY_ALIAS"]
                keyPassword System.getenv()["CM_KEY_PASSWORD"]
            } else if (keystorePropertiesFile.exists()) {
                keyAlias keystoreProperties['keyAlias']
                keyPassword keystoreProperties['keyPassword']
                storeFile file(keystoreProperties['storeFile'])
                storePassword keystoreProperties['storePassword']
            } else {
                // Fallback to debug signing if no keystore
                keyAlias "androiddebugkey"
                keyPassword "android"
                storeFile file(System.getProperty("user.home") + "/.android/debug.keystore")
                storePassword "android"
            }
        }
        debug {
            // Gunakan debug signing default (tidak perlu key.properties)
        }
    }

    defaultConfig {
        applicationId = "com.template.my_template"
        minSdkVersion = flutter.minSdkVersion
        targetSdk = 36
        versionCode = flutterVersionCode.toInteger()
        versionName = flutterVersionName
    }

    buildTypes {
        release {
            signingConfig signingConfigs.release
            minifyEnabled true
            shrinkResources true
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
        debug {
            signingConfig signingConfigs.debug  // ✅ Default debug signing
            minifyEnabled false                 // ❌ Disable minify in debug
            shrinkResources false
            debuggable true
        }
    }

    flavorDimensions "app"
    productFlavors {
        dev {
            dimension "app"
            resValue "string", "app_names", "Flutter Template Dev"
            applicationId "com.template.my_template.dev"
        }
        staging {
            dimension "app"
            resValue "string", "app_names", "Flutter Template"
            applicationId "com.template.my_template.staging"
        }
        prod {
            dimension "app"
            resValue "string", "app_names", "Flutter Template"
            applicationId "com.template.my_template"
        }
    }
}

flutter {
    source = "../.."
}
EOF

echo "✅ Android setup completed!"
echo "   - Debug builds now use default signing (no key.properties needed)."
echo "   - Release builds use keystore only if key.properties exists."
echo "   - Minify disabled in debug for faster builds."

# --- Step 3: Beri izin eksekusi (opsional) ---
chmod +x "$0"