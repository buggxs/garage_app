import 'package:flutter/material.dart';
import 'package:garage_app/components/common/widgets/garage_scaffold.dart';
import 'package:garage_app/components/garage/widgets/car_list_item_empty.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'Logout'];
  final List<int> colorCodes = <int>[600, 500, 100, 600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return GarageScaffold(
      title: 'Deine Settings',
      child: Container(
        child: ListView.separated(
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            if (entries[index].isEmpty) {
              return CarListItemEmpty();
            }
            return Container(
                padding: const EdgeInsets.all(10.0),
                color: Colors.white,
                child: Text(
                  entries[index],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ));
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
            color: Colors.black,
            height: 3,
            thickness: 3,
          ),
        ),
      ),
    );
  }
}
