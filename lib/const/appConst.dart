import 'package:flutter/material.dart';

Color mainColor = Colors.red;
final Color slaveColor = Colors.grey.shade200;
const Color assistColor = Colors.grey;
const Color blackColor = Colors.black;
const Color whiteColor = Colors.white;
Color facebookColor = Color(0xFF4267B2);
Color googleColor = Color(0xFFEA4335);
Color appleColor = Color(0xFF4267B2);
Color backColor = slaveColor; //Colors.amber;

var lightThemeData = ThemeData(
  fontFamily: "Poppins",
  textTheme: TextTheme(
    // headline3: TextStyle(
    //     fontSize: 25, fontWeight: FontWeight.w700, color: Colors.black),

    //headline2: TextStyle(fontSize: 16, color: mainColor),
    // headline1: TextStyle(
    //     fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),

    /// Gategory title inactive ///////////////////

    subtitle1: TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),

    /// Gategory title  Active ///////////////////
    subtitle2: TextStyle(
      fontSize: 22,
      color: blackColor,
      fontWeight: FontWeight.w700,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(primary: Colors.grey[200], elevation: 0),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      //backgroundColor: MaterialStateProperty.all(mainColor),
      foregroundColor: MaterialStateProperty.all(mainColor),
      shadowColor: MaterialStateProperty.all(mainColor),
      overlayColor: MaterialStateProperty.all(slaveColor),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      //backgroundColor: MaterialStateProperty.all(mainColor),
      foregroundColor: MaterialStateProperty.all(mainColor),
      shadowColor: MaterialStateProperty.all(mainColor),
      overlayColor: MaterialStateProperty.all(slaveColor),
    ),
  ),
);
