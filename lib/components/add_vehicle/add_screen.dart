import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/components/add_vehicle/create_car_automated_screen.dart';
import 'package:garage_app/components/add_vehicle/create_car_manual_screen.dart';
import 'package:garage_app/components/add_vehicle/cubit/add_vehicle_cubit.dart';
import 'package:garage_app/components/common/widgets/garage_scaffold.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  static const String route = '/add';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blue,
                          ),
                        ),
                        onPressed: () => Navigator.of(context)
                            .pushNamed(CreateCarManualScreen.route),
                        child: const Text('Auto manuell Eingeben'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blue,
                          ),
                        ),
                        onPressed: () => Navigator.of(context)
                            .pushNamed(SelectCarScreen.route),
                        child: const Text('Auto auswählen'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
