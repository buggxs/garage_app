import 'package:flutter/material.dart';

InputDecoration defaultInputDecorationBlack({Widget? label}) {
  return InputDecoration(
    label: label,
    labelStyle: const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 17,
      color: Colors.black,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(
        color: Colors.black,
        width: 1,
      ),
    ),
  );
}
