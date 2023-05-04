import 'package:flutter/material.dart';

class MyThemeData{
  static Color primaryLight = Color(0xff5D9CEC);
  static Color primaryDark = Color(0xff060E1E);
  static Color greenLight = Color(0xffDFECDB);
  static Color whiteColor = Color(0xffffffff);
  static Color blackColor = Color(0xff383838);
  static Color redColor = Color(0xffEC4B4B);
  static Color greenColor = Color(0xff61E757);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLight,
    scaffoldBackgroundColor: greenLight,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryLight,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
     backgroundColor: Colors.transparent,
      elevation: 0,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: primaryLight,
      unselectedItemColor: Colors.grey
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryLight,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: whiteColor,
          width: 4
        ),
        borderRadius: BorderRadius.circular(30)
      )
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: whiteColor
      ),
      subtitle1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: blackColor
      ),
      bodyText1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: primaryLight
      ),
    )
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryDark,
    scaffoldBackgroundColor:primaryDark,
  );

}