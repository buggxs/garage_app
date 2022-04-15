import 'package:flutter/material.dart';

class GarageParkingPWidget extends StatelessWidget {
  const GarageParkingPWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: RotatedBox(
        quarterTurns: 3,
        child: Text(
          "P",
          style: TextStyle(
            color: Colors.white,
            fontSize: 98,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
