import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/common/widgets/garage_scaffold.dart';
import 'package:garage_app/components/add_vehicle/I18n/add_vehicle_i18n.dart';
import 'package:garage_app/components/add_vehicle/I18n/add_vehicle_text.dart';
import 'package:garage_app/components/add_vehicle/create_car_automated_screen.dart';
import 'package:garage_app/components/add_vehicle/create_car_manual_screen.dart';
import 'package:garage_app/components/add_vehicle/cubit/add_vehicle_cubit.dart';
import 'package:garage_app/components/add_vehicle/widgets/add_vehicle_meta_panel.dart';
import 'package:garage_app/components/add_vehicle/widgets/shield_button.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  static const String route = '/add';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddVehicleCubit>(
      create: (_) => AddVehicleCubit(),
      child: const AddScreenContent(),
    );
  }
}

class AddScreenContent extends StatelessWidget {
  const AddScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GarageScaffold(
      title: AddVehicleText.parkNewCar(),
      child: Column(
        children: <Widget>[
          const AddVehicleMetaPanel(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <ShieldButton>[
                      ShieldButton(
                        text: AddVehicleText.addCarManually(),
                        onTap: () => Navigator.of(context)
                            .pushNamed(CreateCarManualScreen.route),
                      ),
                      ShieldButton(
                        text: AddVehicleText.selectCar(),
                        onTap: () => Navigator.of(context)
                            .pushNamed(SelectCarScreen.route),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
