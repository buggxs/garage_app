import 'package:flutter/material.dart';

class AddVehicleScreen extends StatelessWidget {
  const AddVehicleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Hello'),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Hello'),
            ),
          ),
        ],
      ),
    );
  }
}
