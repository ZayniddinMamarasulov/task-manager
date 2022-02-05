import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_manager/models/task.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _db;

  DatabaseHelper._instance();

  Future<Database?> get db async {
    return _db ?? await _initDB();
  }

  final String tableTodo = 'todo';
  final String colId = 'id';
  final String colTitle = 'title';
  final String colDescription = 'description';
  final String colDate = 'date';
  final String colStartTime = 'startTime';
  final String colEndTime = 'endTime';

  Future<Database?> _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = documentsDirectory.path + "todobd.db";
    _db = await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE $tableTodo ("
          "$colId INTEGER PRIMARY KEY,"
          "$colTitle TEXT,"
          "$colDescription TEXT,"
          "$colDate TEXT,"
          "$colStartTime TEXT,"
          "$colEndTime TEXT"
          ")");
    });
    return _db;
  }

  Future<Task> insert(Task todo) async {
    final data = await db;
    todo.id = await data?.insert(tableTodo, todo.toMap());
    return todo;
  }

  Future<List<Map<String, Object?>>?> getTaskMapList() async {
    final data = await db;
    final List<Map<String, Object?>>? result = await data?.query(tableTodo);
    return result;
  }

  Future<List<Task>> getTaskList() async {
    final List<Map<String, Object?>>? taskMapList = await getTaskMapList();
    final List<Task> taskList = [];
    taskMapList?.forEach((element) {
      taskList.add(Task.fromMap(element));
      print(element);
    });
    return taskList;
  }

  Future<int?> delete(int id) async {
    final data = await db;
    return await data?.delete(tableTodo, where: '$colId = ?', whereArgs: [id]);
  }

  Future<int?> update(Task todo) async {
    final data = await db;
    return await data?.update(tableTodo, todo.toMap(),
        where: '$colId = ?', whereArgs: [todo.id]);
  }

  Future close() async => await _db?.close();
}
