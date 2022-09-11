import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDatabase {

  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      return _db = await intialDB();
    } else {
      return _db;
    }
  }

  intialDB() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'todo.db');
    Database todoDatabase = await openDatabase(path, onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return todoDatabase;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE "tasks" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
    "title" TEXT NOT NULL, 
    "isDone" BOOLEAN)
    ''');

    print('database created');
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) {
    print("onUpgrade");
  }

  // getDatabase
  readData() async {
    Database? todoDatabase = await db;
    var response = await todoDatabase?.rawQuery('SELECT * FROM tasks');
    return response;
  }

  // insertToDatabase
  insertToDatabase(String q) async {
    Database? todoDatabase = await db;
    var response = await todoDatabase?.rawQuery(q);
    return response;
  }

  //updateToDatabase
  updateData(String q) async {
    Database? todoDatabase = await db;
    var response = await todoDatabase?.rawUpdate(q);
    return response;
  }

  // deleteData
  deleteData(String q) async {
    Database? todoDatabase = await db;
    var response = await todoDatabase?.rawDelete(q);
    return response;
  }


}