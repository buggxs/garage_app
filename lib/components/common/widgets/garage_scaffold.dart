import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class GarageScaffold extends StatelessWidget {
  const GarageScaffold(
      {Key? key,
      required this.child,
      this.floatingActionButton,
      this.title,
      this.elevation})
      : super(key: key);

  final Widget child;
  final String? title;
  final Widget? floatingActionButton;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: elevation,
        title: AutoSizeText(
          title ?? 'MyGarage App',
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          overflowReplacement: AutoSizeText(
            title ?? 'MyGarage App',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey[900],
      body: child,
      floatingActionButton: floatingActionButton,
    );
  }
}
