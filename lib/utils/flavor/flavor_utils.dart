import 'package:flutter/material.dart';
import 'package:my_template/injection/injector.dart';
import 'package:my_template/domain/models/flavor/flavor_model.dart';
import 'package:my_template/gen/assets.gen.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum FlavorType { prod, dev, staging }

final flavor = inject<FlavorUtils>();

class FlavorUtils {
  /// Current index of flavor
  static int? index;

  /// Define list of available flavors
  /// for every company or project
  static List<FlavorModel> flavors = [
    FlavorModel(
      packages: "com.template.my_template.dev",
      type: FlavorType.dev,
      logoPath: Assets.images.logoFull.path,
      name: "Flutter Template Dev",
      primaryColor: const Color(0xff004EBF),
      primaryLightColor: const Color(0xff022f66),
      secondaryColor: const Color(0xffDAB272),
      api: FlavorAPIModel(
        baseURL: "https://dummyjson.com",
      ),
    ),
    FlavorModel(
      packages: "com.template.my_template.staging",
      type: FlavorType.staging,
      logoPath: Assets.images.logoFull.path,
      name: "Flutter Template",
      primaryColor: const Color(0xff004EBF),
      primaryLightColor: const Color(0xff022f66),
      secondaryColor: const Color(0xffDAB272),
      api: FlavorAPIModel(
        baseURL: "https://dummyjson.com",
      ),
    ),
    FlavorModel(
      packages: "com.template.my_template",
      type: FlavorType.prod,
      logoPath: Assets.images.logoFull.path,
      name: "Flutter Template",
      primaryColor: const Color(0xff004EBF),
      primaryLightColor: const Color(0xff022f66),
      secondaryColor: const Color(0xffDAB272),
      api: FlavorAPIModel(
        baseURL: "https://dummyjson.com",
      ),
    ),
  ];

  /// Find current flavor by package name
  Future initType({PackageInfo? package}) async {
    package ??= await PackageInfo.fromPlatform();
    String packageName = package.packageName;
    index = flavors.indexWhere((item) => item.packages == packageName);

    // Initialize dotenv based on flavor
    await _loadEnv();
  }

  Future<void> _loadEnv() async {
    String envFile = "assets/env/.env"; // Default to prod
    switch (current.type) {
      case FlavorType.dev:
        envFile = "assets/env/.env.dev";
        break;
      case FlavorType.staging:
        envFile = "assets/env/.env.staging";
        break;
      case FlavorType.prod:
        envFile = "assets/env/.env";
        break;
    }

    try {
      await dotenv.load(fileName: envFile);
      // Update the base URL from env
      String? baseUrl = dotenv.env['BASE_URL'];
      if (baseUrl != null && baseUrl.isNotEmpty) {
        current.api.baseURL = baseUrl;
      }
    } catch (e) {
      debugPrint("Failed to load env file: $envFile. Error: $e");
    }
  }

  FlavorUtils() {
    PackageInfo.fromPlatform().then((value) {
      initType(package: value);
    });
  }

  /// Get current flavor type
  FlavorType getType() {
    final type = flavors[index!].type;
    return type;
  }

  /// Get current flavor
  FlavorModel get current {
    final type = getType();
    return flavors.firstWhere((item) => item.type == type);
  }
}
