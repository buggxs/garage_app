import 'package:flutter/material.dart';

class CustomLightTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.amber[800],
      backgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 8.0,
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.blueGrey.shade900),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: .9,
            ),
          ),
        ),
      ),
    );
  }
}
