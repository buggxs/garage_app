import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/components/add_vehicle/cubit/add_vehicle_cubit.dart';
import 'package:garage_app/components/add_vehicle/widgets/garage_stepper.dart';
import 'package:garage_app/components/common/widgets/garage_scaffold.dart';
import 'package:garage_app/components/garage/garage_screen.dart';
import 'package:garage_app/components/garage/widgets/car_data_input.dart';

class CreateCarManualScreen extends StatelessWidget {
  const CreateCarManualScreen({Key? key}) : super(key: key);

  static const String route = '/create-manual-car';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddVehicleCubit(),
      child: const CreateCarManualScreenContent(),
    );
  }
}

class CreateCarManualScreenContent extends StatefulWidget {
  const CreateCarManualScreenContent({Key? key}) : super(key: key);

  @override
  State<CreateCarManualScreenContent> createState() =>
      _CreateCarManualScreenContentState();
}

class _CreateCarManualScreenContentState
    extends State<CreateCarManualScreenContent> {
  Car newCar = const Car();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AddVehicleCubit cubit = context.watch<AddVehicleCubit>();

    return GarageScaffold(
      child: Form(
        key: _formKey,
        child: GarageStepper(
          steps: <Step>[
            _stepOne(),
            _stepTwo(),
          ],
          onCarCreated: () {
            if (_formKey.currentState?.validate() ?? false) {
              _formKey.currentState?.save();
            }
            cubit.saveVehicle(car: newCar);
            Navigator.of(context).pushReplacementNamed(
              GarageScreen.route,
            );
          },
        ),
      ),
    );
  }

  Step _stepOne() {
    return Step(
      title: const Text('Auto Infos'),
      content: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Row(
              children: [
                CarDataInput(
                  inputDecoration: const InputDecoration(
                    labelText: 'Fahrzeug Name',
                  ),
                  textStyle: _carInputTextStyle(),
                  onSave: (String value) {
                    newCar = newCar.copyWith(
                      name: value,
                    );
                  },
                ),
              ],
            ),
            Row(
              children: [
                CarDataInput(
                  inputDecoration: const InputDecoration(
                    labelText: 'Kilometerstand',
                  ),
                  textStyle: _carInputTextStyle(),
                  onSave: (String value) {
                    newCar = newCar.copyWith(
                      mileage: double.tryParse(value),
                    );
                  },
                ),
                CarDataInput(
                  inputDecoration: const InputDecoration(
                    labelText: 'Baujahr',
                  ),
                  textStyle: _carInputTextStyle(),
                  onSave: (String value) {
                    newCar = newCar.copyWith(
                      vintage: int.tryParse(value),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Step _stepTwo() {
    return Step(
      title: const Text('Auto Daten'),
      content: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Row(
              children: [
                CarDataInput(
                  inputDecoration: const InputDecoration(
                    labelText: 'Marke',
                  ),
                  textStyle: _carInputTextStyle(),
                ),
              ],
            ),
            Row(
              children: [
                CarDataInput(
                  inputDecoration: const InputDecoration(
                    labelText: 'Model',
                  ),
                  textStyle: _carInputTextStyle(),
                ),
                CarDataInput(
                  inputDecoration: const InputDecoration(
                    labelText: 'Typ',
                  ),
                  textStyle: _carInputTextStyle(),
                ),
              ],
            ),
            Row(
              children: [
                CarDataInput(
                  inputDecoration: const InputDecoration(
                    labelText: 'HSN',
                  ),
                  textStyle: _carInputTextStyle(),
                ),
                CarDataInput(
                  inputDecoration: const InputDecoration(
                    labelText: 'TSN',
                  ),
                  textStyle: _carInputTextStyle(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _carInputTextStyle() {
    return const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 17,
      color: Colors.white,
    );
  }
}
