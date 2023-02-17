import 'package:flutter/material.dart';

class GarageSlotBottomDivider extends StatelessWidget {
  const GarageSlotBottomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: Container(
            height: 10,
            color: Colors.white,
            child: const Text(''),
          ),
        ),
        Container(
          height: 25,
          width: 10,
          color: Colors.white,
          child: const Text(''),
        ),
      ],
    );
  }
}
