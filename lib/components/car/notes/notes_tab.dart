import 'package:flutter/material.dart';

class NotesTab extends StatelessWidget {
  const NotesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Text(
          "Notizen",
          style: TextStyle(color: Colors.white),
        )));
  }
}
