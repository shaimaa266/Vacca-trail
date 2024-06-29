
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDb();
      return _db;
    } else {
      return _db;
    }
  }

  DatabaseHelper.internal();

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'movies2.db');
    var theDb = await openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return theDb;
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {}

  void _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY,
        firstName TEXT,
        lastName TEXT,
        email TEXT,
        password TEXT,
        confirmPassword Text
      )
    ''');
    batch.execute('''
      CREATE TABLE favourites (
        id INTEGER PRIMARY KEY,
        image TEXT,
        title TEXT,
        rating TEXT,
        year TEXT,
        sorting Text,
        isFavourite Text,
        email Text
      )
    ''');
    batch.commit();
  }

  Future<void> insert({
    required String table,
    required Map<String, Object?> values,
  }) async {
    final db = await DatabaseHelper().db;
    await db!.insert(
      table,
      values,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }



  deleteMyDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'movies2.db');
    await deleteDatabase(path);
  }
}