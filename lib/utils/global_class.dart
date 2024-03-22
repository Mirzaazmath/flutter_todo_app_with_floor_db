// import 'package:flutter_floor_db_sample/floorDB/dao.dart';
// import 'package:flutter_floor_db_sample/floorDB/database.dart';
//
//  class GlobalClass{
// // Created a TaskDoa variable / Object to access the DAO in our entire app without passing in parameters
//    TaskDoa? doa;
//
//
//   // This Method Create the local Database in our app
//   Future generateDB()async{
//     // You Can use any name you want for the database:my_database.db
//     final database= await $FloorAppDataBase.databaseBuilder("my_database.db").build();
//     // assigning the value to the variable that we created above
//     doa=database.taskDoa;
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter_floor_db_sample/floorDB/dao.dart';

import '../floorDB/database.dart';

class DataBaseProvider with ChangeNotifier {
  TaskDoa? _doa;
  get doa => _doa;
  Future generateDB() async {
    // You Can use any name you want for the database:my_database.db
    final database =
        await $FloorAppDataBase.databaseBuilder("my_database.db").build();
    // assigning the value to the variable that we created above
    _doa = database.taskDoa;
    notifyListeners();
  }
}
