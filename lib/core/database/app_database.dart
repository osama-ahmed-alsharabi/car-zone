import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDatabase {
  static final AppDatabase _instance = AppDatabase._internal();
  factory AppDatabase() => _instance;
  AppDatabase._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'carzone_app.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE user (
            id TEXT PRIMARY KEY,
            fullName TEXT,
            email TEXT,
            phoneNumber TEXT,
            googleId TEXT,
            emailVerifiedAt TEXT,
            createdAt TEXT,
            updatedAt TEXT
          );
        ''');

        await db.execute('''
          CREATE TABLE cars (
            id INTEGER PRIMARY KEY,
            title TEXT,
            description TEXT,
            model TEXT,
            price TEXT,
            condition TEXT,
            engine_cylinders TEXT,
            fuel_type TEXT,
            latitude TEXT,
            longitude TEXT,
            brand_id INTEGER,
            province_id INTEGER,
            user_id INTEGER,
            main_image TEXT,
            sub_image TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE brands (
            id INTEGER PRIMARY KEY,
            name TEXT,
            is_active INTEGER,
            deleted_at TEXT,
            created_at TEXT,
            updated_at TEXT
          )
          ''');
      },
    );
  }
}
