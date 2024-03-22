/*
@entity
It will represent a database table as well as the scaffold of your business object. @entity
marks the class as a persistent class. It's required to add a primary key to your table. You 
can do so by adding the @primaryKey annotation to an int property. There is no
restriction on where you put the file containing the entity.
 */

import 'package:floor/floor.dart';
@entity
class Task{
// if you are using the autoGenerate property for id use  the PrimaryKey() method with parameter  in Capital camel case
//or @primaryKey
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String name;
  final bool isCompleted;
  Task(this.id,this.name,this.isCompleted);

  factory Task.optional({
    int? id,

    String? name,
    bool? isCompleted,

  }) =>
      Task(
        id,
        name!,
        isCompleted!,

      );

}