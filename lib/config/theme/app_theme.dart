import 'package:flutter/material.dart';

class AppTheme {

  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w300,  
    color: Colors.white,
    fontFamily: 'Plus Jakarta Sans',
    letterSpacing: 5,
  );
  static const TextStyle title2TextStyle = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.w300,  
    color: Colors.white,
    fontFamily: 'Plus Jakarta Sans',
    letterSpacing: 15,
  );
  static const Color primaryColor = Colors.black;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
      iconTheme: IconThemeData(color: Colors.black),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.black54, fontSize: 14),
      displaySmall: titleTextStyle.copyWith(color: Colors.black),
      displayLarge: title2TextStyle.copyWith(color: Colors.black),
    ),
  );
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.white, fontSize: 14),
      displayLarge: title2TextStyle,
      displaySmall: titleTextStyle,
    ),
  );
}
