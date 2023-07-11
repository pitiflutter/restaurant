import 'package:flutter/material.dart';

class Constants {
  static String url = "http://10.0.2.2:8080";

  static String appName = "Restaurant App UI KIT";

  //Colors for theme
//  Color(0xfffcfcff);
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Colors.red;
  static Color darkAccent = Colors.red;
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Colors.black;
  static Color ratingBG = Colors.yellow;

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    hintColor: lightAccent,
     scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(

//      iconTheme: IconThemeData(
//        color: lightAccent,
//      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    hintColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    buttonTheme: ButtonThemeData(focusColor: darkAccent),
    appBarTheme: AppBarTheme(
      titleTextStyle:TextStyle(
          color: lightBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),

//      iconTheme: IconThemeData(
//        color: darkAccent,
//      ),
    ),
  );
}
