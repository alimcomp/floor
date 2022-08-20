import 'dart:async';

import 'package:example/task.dart';
import 'package:example/task_dao.dart';
import 'package:example/type_converter.dart';

import 'package:floor_common/floor_common.dart';
import 'package:sqflite/sqlite_api.dart' as sqflite;

part 'database.g.dart';

late sqflite.DatabaseFactory sqfliteDatabaseFactory;

@Database(version: 1, entities: [Task])
@TypeConverters([DateTimeConverter])
abstract class FlutterDatabase extends FloorDatabase {
  TaskDao get taskDao;
}
