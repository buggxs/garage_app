import 'package:flutter/material.dart';
import 'package:garage_app/components/widgets/garage_scaffold.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GarageScaffold(
      title: 'Deine Settings',
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 16.0, 16.0, 16.0),
        child: const Center(
          child: Text("Hello Settings"),
        ),
      ),
    );
  }
}
