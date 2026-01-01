import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'my_template.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Create tables here
    // Example:
    // await db.execute('''
    //   CREATE TABLE users (
    //     id INTEGER PRIMARY KEY AUTOINCREMENT,
    //     username TEXT
    //   )
    // ''');

    // For now, we might just need a simple check if vault exists,
    // maybe we don't strictly *need* a table for "Auth" if we use SecureStorage for the PIN,
    // but the user asked to use SQLite.
    // Let's create a 'vault_metadata' table to store vault name, etc.
    await db.execute('''
      CREATE TABLE vault_metadata (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        vault_name TEXT NOT NULL,
        created_at TEXT NOT NULL
      )
    ''');
  }

  // Example helper methods
  Future<int> insertVaultMetadata(String name) async {
    final db = await database;
    return await db.insert('vault_metadata', {
      'vault_name': name,
      'created_at': DateTime.now().toIso8601String(),
    });
  }

  Future<Map<String, dynamic>?> getVaultMetadata() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('vault_metadata', limit: 1);
    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }
}
