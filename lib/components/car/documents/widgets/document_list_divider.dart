import 'package:flutter/material.dart';

class DocumentListDivider extends StatelessWidget {
  const DocumentListDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        height: 3,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
      ),
    );
  }
}
