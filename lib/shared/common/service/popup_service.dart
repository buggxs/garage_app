
import 'package:flutter/material.dart';

class PopupService {

  Future<String> selectDate({
    required BuildContext context,
    TextEditingController? controller
  }) async {
    DateTime selectedDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    if (picked != null && picked != selectedDate) {
      String date = '${picked.day}.${picked.month.toString().length == 1 ?
      '0${picked.month}':picked.month}.${picked.year}';

      if (controller != null) {
        controller.text = date;
        return date;
      }
      return date;
    }
    return '${selectedDate.day}.${selectedDate.month.toString().length == 1 ?
    '0${selectedDate.month}':selectedDate.month}.${selectedDate.year}';
  }




}