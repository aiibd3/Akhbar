import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData light = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,

      textTheme: TextTheme(
          titleMedium: GoogleFonts.aBeeZee(
              textStyle: const TextStyle(fontSize: 30, color: Colors.white))),
      appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff42505C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50),
            ),
          ),
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 30, color: Colors.white)));
}

