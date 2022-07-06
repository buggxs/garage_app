import 'package:flutter/material.dart';

InputDecoration defaultInputDecorationBlack({Widget? label}) {
  return InputDecoration(
    label: label,
    labelStyle: const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 17,
      color: Colors.black,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(
        color: Colors.black,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(
        color: Colors.black,
        width: 1.0,
      ),
    ),
  );
}
