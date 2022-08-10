import 'dart:developer';

import 'package:sqflite/sqflite.dart';

import 'package:task_management/data/model.dart';
import 'package:path/path.dart';
import 'package:task_management/data/workmodel.dart';

class DbHelper {
  static DbHelper dbHelper = DbHelper();
  DbHelper() {
    initDatabase();
  }

  static const String tableName = 'table2';
  static const String tableName2 = 'work2';

  static const String experinceIdColumName = 'id';
  static const String workidcoulum = 'id';
  static const String experinceNameColumName = 'experinceName';
  static const String workname = 'workname';

  static const String experinceprogress = 'progress';
  static const String workdate = 'date';

  static const String experincenumbe = 'number';
  static const String image = 'image';

  static const String experincestartDateColum = 'startDate';
  static const String url = 'url';

  static const String experincendDateColum = 'endDate';

  Database? database;
  initDatabase() async {
    database = await createConnectionWithDatabase();
  }

  Future<Database> createConnectionWithDatabase() async {
    String databasePath = await getDatabasesPath();
    String databaseName = 'project8.db';
    String fullPath = join(databasePath, databaseName);
    Database database =
        await openDatabase(fullPath, version: 1, onCreate: (db, i) {
      log('hello, the database has been created');

      db.execute('''
 CREATE TABLE $tableName (
  $experinceIdColumName INTEGER PRIMARY KEY AUTOINCREMENT,
   $experinceNameColumName TEXT,
    $experinceprogress TEXT,
    $experincestartDateColum TEXT,
    $experincendDateColum TEXT,
    $experincenumbe TEXT
    

    )
''');
      db.execute('''
 CREATE TABLE $tableName2 (
  $workidcoulum INTEGER PRIMARY KEY AUTOINCREMENT,
   $workname TEXT,
    $workdate TEXT,
    $image BLOB,
    $url TEXT
    )
''');
    }, onOpen: (db) async {
      final tables =
          await db.rawQuery('SELECT name FROM sqlite_master ORDER BY name;');
      log(tables.toString());
    });
    return database;
  }

  insertNewexperince(Experince experince) async {
    int rowIndex = await database!.insert(tableName, experince.toMap());
    log(rowIndex.toString());
  }

  Future<List<Experince>> selectAllexperinces() async {
    List<Map<String, Object?>> rowsAsMaps = await database!.query(tableName);
    List<Experince> experinces =
        rowsAsMaps.map((e) => Experince.fromMap(e)).toList();
    return experinces;
  }

  deleteOneExperince(int id) {
    database!
        .delete(tableName, where: '$experinceIdColumName=?', whereArgs: [id]);
    selectAllexperinces();
  }

  insertNewWork(WorkModel work) async {
    int rowIndex = await database!.insert(tableName2, work.toMap());
    log(rowIndex.toString());
  }

  Future<List<WorkModel>> selectAllwork() async {
    List<Map<String, Object?>> rowsAsMaps = await database!.query(tableName2);
    List<WorkModel> work = rowsAsMaps.map((e) => WorkModel.fromMap(e)).toList();
    return work;
  }

  deleteoneWork(int id) {
    database!
        .delete(tableName2, where: '$experinceIdColumName=?', whereArgs: [id]);
  }
}
