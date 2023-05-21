import 'package:flutter/material.dart';
import 'package:todo/style/constants.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white
      )
    ),
    textTheme: const TextTheme(
       bodyLarge: TextStyle(
         color: Colors.white,fontSize: 20,
         fontWeight: FontWeight.bold,

       ) ,
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w600,color: MyColor.buttonBackGround,
        fontSize: 14,
      ),
       bodySmall: TextStyle(
         color: Color(0xFFF9F9F9),fontSize: 14
       ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor:MyColor.mainBackGround,
        elevation: 5,

      ),
    )
  );
  static ThemeData darkTheme = ThemeData();
}
