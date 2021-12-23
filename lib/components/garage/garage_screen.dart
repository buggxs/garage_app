import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/components/authentication/session/session_cubit.dart';
import 'package:garage_app/components/car/widget/car_list_item.dart';
import 'package:garage_app/components/car/widget/car_list_item_divider.dart';
import 'package:garage_app/components/car/widget/car_list_item_empty.dart';
import 'package:garage_app/components/widgets/garage_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:garage_app/core/app_navigator/app_cubit.dart';


class GarageScreen extends StatelessWidget {
  GarageScreen({Key? key}) : super(key: key);

  final List<String> entries = <String>['A', 'B', '', 'D', 'E', 'F'];
  final List<int> colorCodes = <int>[600, 500, 100, 600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return GarageScaffold(
      title: 'Deine Garage',
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 16.0, 16.0, 16.0),
        child: ListView.separated(
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            if (entries[index].isEmpty) {
              return CarListItemEmpty();
            }
            return CarListItem(car: "Auto",);
          },
          separatorBuilder: (BuildContext context, int index) => const CarListItemDivider(),
        ),
      ),
    );
  }
}
