import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/app_colors.dart';
class MyThemeData{

  static ThemeData lightTheme=ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: ligthGreen,
    accentColor: Colors.black,
    appBarTheme:AppBarTheme(
    iconTheme: IconThemeData(color:primaryColor),
    titleTextStyle:GoogleFonts.elMessiri(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.white),
   ), textTheme: TextTheme(
      bodyLarge: GoogleFonts.quicksand(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Color(0xFF242424),),
      bodyMedium:GoogleFonts.elMessiri(
          fontSize: 25,
          color: Color(0xFF242424),
          fontWeight: FontWeight.w600
      ),
      bodySmall: GoogleFonts.elMessiri(
          fontSize: 20,
          color: Color(0xFF242424),
          fontWeight: FontWeight.normal
      )
  ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: GoogleFonts.aBeeZee(
        color: blackColor
      ),
     showSelectedLabels: false,
     showUnselectedLabels: false,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey
    ),
  );
  static ThemeData darkTheme=ThemeData(
  accentColor: yellow,
  appBarTheme:AppBarTheme(
  centerTitle: true,
  iconTheme: IconThemeData(
  color:yellow
  ),
titleTextStyle:GoogleFonts.elMessiri(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  ),
  textTheme: TextTheme(
  bodyLarge: GoogleFonts.quicksand(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: Color(0xFF242424),),
  bodyMedium:GoogleFonts.elMessiri(
  fontSize: 25,
  color: Color(0xFF242424),
  fontWeight: FontWeight.w600
  ),
  bodySmall: GoogleFonts.elMessiri(
  fontSize: 20,
  color: Color(0xFF242424),
  fontWeight: FontWeight.normal
  ),
  ),),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
  type: BottomNavigationBarType.fixed,
  selectedLabelStyle: GoogleFonts.aBeeZee(
  color: blackColor
  ),
  showSelectedLabels: false,
  showUnselectedLabels: false,
  selectedItemColor: yellow,
  unselectedItemColor: Colors.white
  ),


  );
}