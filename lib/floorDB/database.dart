/*
* It has to be an abstract class which extends FloorDatabase. Furthermore, it's required to
* add @Database() to the signature of the class. Make sure to add the created entity to the
* entities attribute of the @Database annotation. In order to make the generated code
* work, it's required to also add the listed imports.
*
* Make sure to add part 'database.g.dart'; beneath the imports of this file. It's important
* to note that 'database' has to get exchanged with the filename of the database definition.
* In this case, the file is named database.dart.
*
* */

// These are the required imports
import 'dart:async';

import 'package:async/async.dart';
import 'package:floor/floor.dart';
import 'package:flutter_floor_db_sample/floorDB/dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'entity.dart';

part "database.g.dart";// the generated code will be there

// Here we are Setting Up the DataBase
@Database(version: 1, entities: [Task])
abstract class AppDataBase extends FloorDatabase{
  TaskDoa get taskDoa;
}
// Note :
// After Completion of SetUp
// Run this Command
// flutter packages pub run build_runner build
//whenever a file changes, use flutter packages pub run build_runner watch.