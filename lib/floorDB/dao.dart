/*
This component is responsible for managing access to the underlying SQLite database.
The abstract class contains the method signatures for querying the database which have
to return a Future or Stream.

You can define queries by adding the @Query annotation to a method. The SQL
statement has to get added in parenthesis. The method must return a Future or
Stream of the Entity you're querying for.

@insert marks a method as an insertion method.
* */


import 'package:floor/floor.dart';
import 'package:flutter_floor_db_sample/floorDB/entity.dart';
@dao
abstract class TaskDoa{
  /// Using this query we are fetching all task from database table
  /// Table Name is Based on Entity Class Name
  @Query("SELECT * FROM Task")
 Stream<List<Task>>getAllTask();

  /// Using this query we are inserting data into database table
  /// We can use return type as int or void
  /// if using int it return the primary id
  @insert
  Future<int>insertTask(Task task);

  /// Using this query we are updating the  data into database table
  /// We can use return type as int or void
  /// if using int it return the primary id
  @update
  Future<int>updateTask(Task task);

  /// Using this query we are deleting the  data into database table
  /// We can use return type as int or void
  /// if using int it return the primary id
  @delete
  Future<int>deleteTask(Task task);


}