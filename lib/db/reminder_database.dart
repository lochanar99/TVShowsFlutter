
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tvshow/model/reminders.dart';
import 'package:tvshow/pages/reminder.dart';

class ReminderDatabase {
  static final ReminderDatabase instance = ReminderDatabase._init();

  static Database? _database;

  ReminderDatabase._init();

  Future<Database> get database async{
    if(_database !=null) return _database!;

    _database = await _initDB('reminder.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath)async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async{

    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE $tableReminders(
    ${RemindersFields.id} $idType,
    ${RemindersFields.channel} $textType,
    ${RemindersFields.show} $textType,
    ${RemindersFields.timer} $textType)
    ''');

  }

  Future<Reminders?> create(Reminders reminder) async{
    final db =  await instance.database;

    final id = await db.insert(tableReminders, reminder.toJson());
    return reminder.copy(id: id);

  }


  Future close()async {
    final db = await instance.database;

    db.close();
  }
}