import 'dart:io';

import 'package:example/database.dart';
import 'package:floor_ffi/floor_ffi.dart' as ffi;
import 'package:sqlite3/open.dart';
import 'package:sqlite3/sqlite3.dart';
import 'dart:ffi' show DynamicLibrary;

Future<void> main() async {
  open.overrideFor(OperatingSystem.windows, _openSqliteUnderWindows);
  sqfliteDatabaseFactory = ffi.sqfliteDatabaseFactory;

  final database = await $FloorFlutterDatabase
      .databaseBuilder('flutter_database.db')
      .build();
  final dao = database.taskDao;
  final items = await dao.findAllTasks();
  print(items);
}

DynamicLibrary _openSqliteUnderWindows() {
  var path = "";
  try {
    final libraryNextToScript = File('sqlite3.dll');
    path = libraryNextToScript.path;

    return DynamicLibrary.open(path);
  } catch (error) {
    rethrow;
  }
}
