// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyThemes {
  static ThemeData lighttheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.lato().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamcolor,
      primaryColor: darkcolor,
      backgroundColor: darkbluish,
      buttonTheme: ButtonThemeData(buttonColor: darkbluish),
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black)));

  static ThemeData darktheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.lato().fontFamily,
      primaryColor: creamcolor,
      backgroundColor: lightbluish,
      cardColor: Colors.black,
      canvasColor: darkcolor,
      buttonTheme: ButtonThemeData(buttonColor: lightbluish),
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white)));

  static Color creamcolor = Color(0xfff5f5f5);
  static Color darkcolor = Vx.gray900;
  static Color darkbluish = Vx.purple700;
  static Color lightbluish = Vx.purple400;
}
