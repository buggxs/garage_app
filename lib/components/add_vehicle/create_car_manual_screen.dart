import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/common/widgets/garage_scaffold.dart';
import 'package:garage_app/components/add_vehicle/cubit/add_vehicle_cubit.dart';
import 'package:garage_app/components/add_vehicle/widgets/garage_stepper.dart';
import 'package:garage_app/components/garage/garage_screen.dart';

class CreateCarManualScreen extends StatelessWidget {
  const CreateCarManualScreen({Key? key}) : super(key: key);

  static const String route = '/create-manual-car';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddVehicleCubit>(
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AddVehicleCubit cubit = context.watch<AddVehicleCubit>();

    return GarageScaffold(
      child: Form(
        key: _formKey,
        child: GarageStepper(
          onCarCreated: ({
            required Car car,
          }) async {
            if (_formKey.currentState!.validate()) {
              await cubit.saveVehicle(car: car);
              Navigator.of(context).pushNamedAndRemoveUntil(
                GarageScreen.route,
                (Route<dynamic> route) => false,
              );
            }
          },
          onFormSave: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
            }
          },
        ),
      ),
    );
  }
}
