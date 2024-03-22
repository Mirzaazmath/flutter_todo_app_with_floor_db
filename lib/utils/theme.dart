import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor:const  Color(0xfff4f2f2),
  primaryColor: Colors.black,
  primaryColorLight: Colors.white,
  primaryColorDark: const Color(0xffE5A82A),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
  )

);

final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor:const  Color(0xff121212),
    primaryColor: Colors.white,
    primaryColorLight: Colors.grey.shade800,
    primaryColorDark: const Color(0xffAD8343),
    appBarTheme:  AppBarTheme(
      backgroundColor: Colors.grey.shade800,
    )
);