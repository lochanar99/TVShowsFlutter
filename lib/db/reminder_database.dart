import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tvshow/model/reminders.dart';
import 'package:tvshow/model/user.dart';

import 'dart:developer';

class ReminderDatabase {
  static ReminderDatabase instance = ReminderDatabase._init();

  static Database? _database;

  ReminderDatabase._init();

  factory ReminderDatabase() {
    print("initDB executed");
    if (instance == null) {
      instance = ReminderDatabase._init();
    }
    return instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('reminder.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    await deleteDatabase(path);

    return await openDatabase(path, version: 2, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    print("initDB created");

    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    String id = "id";

    await db.execute('''
    CREATE TABLE $tableReminders(
    ${RemindersFields.id} $idType,
    ${RemindersFields.channel} $textType,
    ${RemindersFields.show} $textType,
    ${RemindersFields.timer} $textType)
    ''');

    await db.execute('''
    CREATE TABLE $usersTable(
    ${UserFields.id} $idType,
    ${UserFields.email} $textType,
    ${UserFields.name} $textType,
    ${UserFields.password} $textType)
    ''');
  }

  Future<Reminders> create(Reminders reminder) async {
    final db = await instance.database;

    final id = await db.insert(tableReminders, reminder.toJson());
    return reminder.copy(id: id);
  }

  Future<Users> createUser(Users user) async {
    final db = await instance.database;

    final id = await db.insert(usersTable, user.toJson());
    return user.copy(id: id);
  }

  Future<Users> getLogin(String user, String password) async {
    final db = await instance.database;
    final res = await db.rawQuery(
        "SELECT * FROM user WHERE email = '$user' and password = '$password'");

    if (res.isNotEmpty) {
      return Users.fromJson(res.first);
    } else {
      throw Exception('ID $user not found');
    }
  }

  Future<Reminders> read(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableReminders,
      columns: RemindersFields.values,
      where: '${RemindersFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Reminders.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Reminders>> readAll() async {
    final db = await instance.database;

    final result = await db.query(tableReminders);

    return result.map((json) => Reminders.fromJson(json)).toList();
  }

  Future<int> update(Reminders reminder) async {
    final db = await instance.database;

    return db.update(
      tableReminders,
      reminder.toJson(),
      where: '${RemindersFields.id} = ?',
      whereArgs: [reminder.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableReminders,
      where: '${RemindersFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}

/*class ReminderDatabase {


  static ReminderDatabase instance = ReminderDatabase._init();

  static Database? _database;

  ReminderDatabase._init();

  factory ReminderDatabase(){
    if(instance == null){
      instance = ReminderDatabase._init();
    }
    return instance;
  }


  Future<Database> get database async{
    if(_database !=null) return _database!;

    _database = await _initDB('reminder.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    String id = "id";

    await db.execute('''
    CREATE TABLE $tableReminders(
    ${RemindersFields.id} $idType,
    ${RemindersFields.channel} $textType,
    ${RemindersFields.show} $textType,
    ${RemindersFields.timer} $textType)
    ''');

    await db.execute('''
    CREATE TABLE $usersTable(
    ${UserFields.id} $idType,
    ${UserFields.email} $textType,
    ${UserFields.name} $textType,
    ${UserFields.password} $textType,
    ''');
  }

  Future<Reminders> create(Reminders reminder) async{
    final db =  await instance.database;

    final id = await db.insert(tableReminders, reminder.toJson());
    return reminder.copy(id: id);
  }

  Future<Users?> createUser(Users user) async {
    final db = await instance.database;

    final id = await db.insert(usersTable, user.toJson());
    return user.copy(id: id);
  }
  Future<Reminders> read(int id) async{
    final db = await instance.database;

    final maps = await db.query(tableReminders,
      columns: RemindersFields.values,
      where: '${RemindersFields.id} = ?',
      whereArgs: [id],


    );

    if(maps.isNotEmpty) {
      return Reminders.fromJson(maps.first);
    }
    else{
      throw Exception('ID $id not found');
    }
  }


Future <List<Reminders>> readAll()async{
    final db = await instance.database;

    final result = await db.query(tableReminders);

    return result.map((json) => Reminders.fromJson(json)).toList();

}

Future<int> update(Reminders reminder) async {
    final db = await instance.database;

    return db.update(tableReminders, reminder.toJson(),
      where: '${RemindersFields.id} = ?',
      whereArgs: [reminder.id],

    );
}

Future<int> delete (int id) async{
    final db = await instance.database;

    return await db.delete(tableReminders,
      where: '${RemindersFields.id} = ?',
      whereArgs: [id],


    );
}


  Future close() async {
    final db = await instance.database;

    db.close();
  }
}*/
