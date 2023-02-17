import 'package:flutter/material.dart';

class GarageSlotMiddleDivider extends StatelessWidget {
  const GarageSlotMiddleDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(
            height: 10,
            color: Colors.white,
            child: const Text(''),
          ),
        ),
        Container(
          height: 30,
          width: 10,
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          color: Colors.white,
          child: const Text(''),
        ),
      ],
    );
  }
}
