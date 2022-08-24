import 'package:flutter/material.dart';

class PopupService {
  Future<String> selectDate({
    required BuildContext context,
    TextEditingController? controller,
  }) async {
    final DateTime selectedDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    if (picked != null && picked != selectedDate) {
      final String date =
          '''${picked.day}.${picked.month.toString().length == 1 ? '0${picked.month}' : picked.month}.${picked.year}''';

      if (controller != null) {
        controller.text = date;
        return date;
      }
      return date;
    }
    return '''${selectedDate.day}
    .${selectedDate.month.toString().length == 1 ? '0${selectedDate.month}' : selectedDate.month}
    .${selectedDate.year}''';
  }

  Future<dynamic> showPopUp(
    BuildContext context,
    Widget? title,
    Widget buildPopupDialog,
  ) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: title,
        content: buildPopupDialog,
        contentPadding: const EdgeInsets.all(8),
        titlePadding: const EdgeInsets.all(8),
      ),
    );
  }
}
