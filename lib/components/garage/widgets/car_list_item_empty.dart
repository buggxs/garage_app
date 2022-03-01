import 'package:flutter/material.dart';
import 'package:garage_app/components/garage/widgets/car_list_item_divider.dart';

class CarListItemEmpty extends StatelessWidget {
  const CarListItemEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 115,
          width: double.infinity,
          child: garageParkingPWidget()
        ),
        const CarListItemDivider(),
      ],
    );
  }

  Widget garageParkingPWidget() {
    return const Center(
      child: RotatedBox(
        quarterTurns: 3,
        child: Text("P", style: TextStyle(
            color: Colors.white,
            fontSize: 98,
            fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}
