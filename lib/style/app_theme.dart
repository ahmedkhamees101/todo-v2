import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:todo/style/app_colors.dart';
class MyTheme {
  static ThemeData lightTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white
      )
    ),
    textTheme:  TextTheme(
       bodyLarge: GoogleFonts.poppins(
         color: Colors.white,fontSize: 20,
         fontWeight: FontWeight.bold,
       ),
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
