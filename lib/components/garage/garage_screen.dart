import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/components/authentication/session/session_cubit.dart';
import 'package:garage_app/components/garage/widgets/car_list_item.dart';
import 'package:garage_app/components/garage/widgets/car_list_item_divider.dart';
import 'package:garage_app/components/garage/widgets/car_list_item_empty.dart';
import 'package:garage_app/common/widgets/garage_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:garage_app/core/app_navigator/app_cubit.dart';


class GarageScreen extends StatelessWidget {
  GarageScreen({Key? key}) : super(key: key);

  final List<String> entries = <String>['A', ''];

  @override
  Widget build(BuildContext context) {
    return GarageScaffold(
      title: 'Deine Garage',
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 16.0, 16.0, 16.0),
        child: ListView.builder(
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int itemIndex) {
            if (entries[itemIndex].isEmpty) {
              return const CarListItemEmpty();
            }
            return CarListItem(car: "Auto", index: itemIndex,);
          },
        ),
      ),
      floatingActionButton: floatingParkingButton(),
    );
  }

  Widget floatingParkingButton() {
    return InkWell(
      onTap: () { print("Hello"); },
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          border: Border.all(
              color: Colors.blueAccent,
              width: 2.0
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              border: Border.all(
                  color: Colors.white,
                  width: 5.0
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.0))
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.0),
            child: Text(
              "P",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }

}
