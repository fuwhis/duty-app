import 'package:mobile/db/todo_table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TodoDb {
  static const String DB_NAME = 'todo.db';
  static const DB_VERSION = 1;

  static Database _db;

  // create instance follow singleton method
  // named constructor
  TodoDb._internal();

  static final TodoDb instance = TodoDb._internal();

  Database get database => _db;

  static const initScript = [TodoTable.CREATE_TABLE_QUERY];
  static const migrationScripts = [TodoTable.CREATE_TABLE_QUERY];

  init() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), DB_NAME),
      onCreate: (db, version) {
        initScript.forEach((script) async => await db.execute(script));
      },
      onUpgrade: (db, oldVersion, newVersion) {
        migrationScripts.forEach((script) async => await db.execute(script));
      },
      version: DB_VERSION,
    );
  }
}
