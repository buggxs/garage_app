import 'package:flutter/material.dart';
import 'package:garage_app/common/widgets/garage_scaffold.dart';

class SelectCarScreen extends StatelessWidget {
  const SelectCarScreen({Key? key}) : super(key: key);

  static const String route = '/select-car';

  @override
  Widget build(BuildContext context) {
    return const GarageScaffold(
      child: Center(
        child: Text('choose'),
      ),
    );
  }
}
