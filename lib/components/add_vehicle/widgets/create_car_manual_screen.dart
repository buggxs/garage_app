import 'package:flutter/material.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/components/add_vehicle/widgets/garage_stepper.dart';
import 'package:garage_app/components/garage/widgets/car_data_input.dart';

class CreateCarManualScreen extends StatefulWidget {
  const CreateCarManualScreen({Key? key}) : super(key: key);

  static const String route = '/create-manual-car';

  @override
  State<CreateCarManualScreen> createState() => _CreateCarManualScreenState();
}

class _CreateCarManualScreenState extends State<CreateCarManualScreen> {
  Car newCar = const Car();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: GarageStepper(
        steps: <Step>[
          _stepOne(),
          _stepTwo(),
        ],
        onCarCreated: (Car car) {
          // TODO: create car add function in cubit
          return Future.value(null);
        },
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
                  inputDecoration: _formFieldDecoration('Fahrzeug Name'),
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
                  inputDecoration: _formFieldDecoration('Kilometerstand'),
                  textStyle: _carInputTextStyle(),
                  onSave: (String value) {
                    newCar = newCar.copyWith(
                      name: value,
                    );
                  },
                ),
                CarDataInput(
                  inputDecoration: _formFieldDecoration('Baujahr'),
                  textStyle: _carInputTextStyle(),
                ),
              ],
            ),
            _inputTextField('Test'),
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
            _inputTextField('Marke'),
            Row(
              children: [
                CarDataInput(
                  inputDecoration: _formFieldDecoration('Model'),
                  textStyle: _carInputTextStyle(),
                ),
                CarDataInput(
                  inputDecoration: _formFieldDecoration('Typ'),
                  textStyle: _carInputTextStyle(),
                ),
              ],
            ),
            Row(
              children: [
                CarDataInput(
                  inputDecoration: _formFieldDecoration('HSN'),
                  textStyle: _carInputTextStyle(),
                ),
                CarDataInput(
                  inputDecoration: _formFieldDecoration('TSN'),
                  textStyle: _carInputTextStyle(),
                ),
              ],
            ),
            _inputTextField('Test'),
          ],
        ),
      ),
    );
  }

  Widget _inputTextField(String labelText) {
    return Row(
      children: [
        CarDataInput(
          inputDecoration: _formFieldDecoration(labelText),
          textStyle: _carInputTextStyle(),
        ),
      ],
    );
  }

  TextStyle _carInputTextStyle() {
    return const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 17,
      color: Colors.white,
    );
  }

  InputDecoration _formFieldDecoration(String? labelText) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.white),
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 3.0,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const BorderSide(
          color: Colors.white,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1.0,
        ),
      ),
    );
  }
}
