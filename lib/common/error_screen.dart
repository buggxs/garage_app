import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const <Text>[
          Text('Error Screen'),
          Text('subtext'),
        ],
      ),
    );
  }
}
