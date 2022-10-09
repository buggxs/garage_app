import 'package:flutter/material.dart';
import 'package:garage_app/misc/misc.dart';

class CustomLightTheme {
  static Color get myGarageBlue => ColorConstants.myGarageBlue;

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.amber[800],
      backgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            ColorConstants.myGarageBlue,
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 8,
            ),
          ),
          shadowColor: MaterialStateProperty.all<Color>(
            Colors.black,
          ),
          elevation: MaterialStateProperty.all<double>(4),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(7)),
              side: BorderSide(
                width: 2,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      textTheme: ThemeData.light().textTheme.copyWith(
            headline1: const TextStyle(
              fontSize: 24,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            headline2: const TextStyle(
              fontSize: 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
      inputDecorationTheme: ThemeData.light().inputDecorationTheme.copyWith(
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: Colors.white,
            ),
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 3.0,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                width: 2,
                color: Colors.red,
              ),
            ),
            errorStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.redAccent,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                width: 2,
                color: Colors.red,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 1.0,
              ),
            ),
          ),
    );
  }
}
