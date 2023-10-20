import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/user.dart';

class DatabaseHelper {
  static final _databaseName = 'app_database.db';
  static final _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute("DROP TABLE IF EXISTS users");

    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT,
        password TEXT,
        emailId TEXT
      )
    ''');
  }

  /*Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 1) {
      // Perform schema changes for version 2 (and subsequent versions, if needed).
      await db.execute('ALTER TABLE users ADD COLUMN new_column TEXT;');
    }
    // Add more conditions for other version upgrades if necessary.
  }*/

  Future<int> insertUser(User user) async {
    Database db = await instance.database;
    return await db.insert('users', user.toMap());
  }

  Future<User?> getUserByUsernameAndPassword(String username, String password) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> results = await db.query('users', where: 'username = ? and password = ?', whereArgs: [username, password]);
    if (results.isEmpty) return null;
    return User(
      id: results[0]['id'],
      username: results[0]['username'],
      password: results[0]['password'],
      emailId: results[0]['emailId']
    );
  }

  Future<List<Map<String, dynamic>>> getPagedData(String dateOfBirth, int page, int pageSize) async {
    Database db = await instance.database;
    int offset = (page - 1) * pageSize;

    // SQLite query to retrieve paged data based on date and name
    String query = '''
      SELECT * FROM data
      WHERE dateOfBirth = ? 
      ORDER BY id DESC
      LIMIT $pageSize OFFSET $offset
    ''';

    // Replace date_column and name_column with actual column names in your 'data' table
    // Pass date and name as arguments to the query
    List<Map<String, dynamic>> result = await db.rawQuery(query, [dateOfBirth]);

    return result;
  }

  Future<List<User>> getAllUsers() async {
    Database db = await instance.database;

    // Assuming your User class has properties: id, username, canRead, and canWrite
    List<Map<String, dynamic>> result = await db.query('users');

    // Convert the List<Map<String, dynamic>> to List<User>
    List<User> users = [];
    for (Map<String, dynamic> row in result) {
      users.add(User(
        id: row['id'],
        username: row['username'],
        password: row['password'],
        emailId: row['emailId']
      ));
    }

    return users;
  }
}
