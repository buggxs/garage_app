import 'package:flutter/material.dart';
import 'package:garage_app/components/garage/widgets/parking_slot_p.dart';

class CarListItemEmpty extends StatelessWidget {
  const CarListItemEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        SizedBox(
          height: 120,
          width: double.infinity,
          child: GarageParkingPWidget(),
        ),
      ],
    );
  }
}
