import 'package:flutter/material.dart';
import 'package:garage_app/api/car/car_service.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/components/common/widgets/garage_scaffold.dart';
import 'package:garage_app/components/garage/widgets/car_data_input.dart';
import 'package:garage_app/core/app_service_locator.dart';

class CreateCarScreen extends StatelessWidget {
  const CreateCarScreen({Key? key}) : super(key: key);

  static const String route = '/create-car';

  @override
  Widget build(BuildContext context) {
    return GarageScaffold(
      child: Column(
        children: const [
          Expanded(
            child: CreateCarStepper(),
          ),
        ],
      ),
    );
  }
}

class CreateCarStepper extends StatefulWidget {
  const CreateCarStepper({Key? key}) : super(key: key);

  @override
  State<CreateCarStepper> createState() => _CreateCarStepperState();
}

class _CreateCarStepperState extends State<CreateCarStepper> {
  int _index = 0;

  Car newCar = Car(id: 1);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Stepper(
        controlsBuilder: (context, {onStepContinue, onStepCancel}) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _index == 0
                    ? const SizedBox()
                    : ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.redAccent),
                        ),
                        onPressed: () {
                          setState(() {
                            if (_index == 1) {
                              _index -= 1;
                            }
                          });
                        },
                        child: const Text('Zurück'),
                      ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  onPressed: () {
                    setState(() {
                      switch (_index) {
                        case 0:
                          _index += 1;
                          break;
                        case 1:
                          app<CarService>().saveCar(car: newCar);
                          Navigator.of(context).popAndPushNamed('/');
                          break;
                      }
                    });
                  },
                  child: _index == 0
                      ? const Text('Next')
                      : const Text('Speichern'),
                ),
              ],
            ),
          );
        },
        type: StepperType.horizontal,
        currentStep: _index,
        onStepTapped: (int index) {
          setState(() {
            _index = index;
          });
        },
        steps: <Step>[
          Step(
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
          ),
          Step(
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
          ),
        ],
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
