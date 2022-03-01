import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {

  HeadingText({
    Key? key,
    this.text
  }) : super(key: key);

  String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, bottom: 8.0),
      child: Row(
        children: <Widget>[
          Text(text ?? "Fahrzeug Information",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.white
            ),
          )
        ],
      ),
    );
  }
}
