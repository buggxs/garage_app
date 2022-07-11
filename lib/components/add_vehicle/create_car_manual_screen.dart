import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/components/add_vehicle/cubit/add_vehicle_cubit.dart';
import 'package:garage_app/components/add_vehicle/widgets/garage_stepper.dart';
import 'package:garage_app/components/common/widgets/garage_scaffold.dart';
import 'package:garage_app/components/garage/garage_screen.dart';

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
}
