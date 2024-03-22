import 'package:flutter/material.dart';
import 'package:flutter_floor_db_sample/utils/global_class.dart';
import 'package:flutter_floor_db_sample/screens/home_screen.dart';
import 'package:flutter_floor_db_sample/utils/theme.dart';
import 'package:provider/provider.dart';
void main(){

  runApp(ChangeNotifierProvider(
      create: (BuildContext context) =>DataBaseProvider(),

      child: const MyApp()));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Using this line of code to ensure the initializing the future methods
    WidgetsFlutterBinding.ensureInitialized();
   // Calling the generateDB function  to create Database
    Provider.of<DataBaseProvider>(context,listen: false).generateDB();
  }
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    return   MaterialApp(
      title: "My Task",
      theme: brightness==Brightness.dark?darkTheme:lightTheme,
      home:const  HomeScreen(),
    );
  }
}