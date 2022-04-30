import 'package:flutter/material.dart';
import 'package:garage_app/components/common/widgets/garage_scaffold.dart';
import 'package:garage_app/components/garage/widgets/car_data_input.dart';

class CreateCarScreen extends StatelessWidget {
  const CreateCarScreen({Key? key}) : super(key: key);

  static const String route = '/create-car';

  @override
  Widget build(BuildContext context) {
    return GarageScaffold(
      child: Column(
        children: [
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

  @override
  Widget build(BuildContext context) {
    return Stepper(
      controlsBuilder: (context, {onStepContinue, onStepCancel}) {
        return const SizedBox();
      },
      type: StepperType.horizontal,
      currentStep: _index,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (_index <= 0) {
          setState(() {
            _index += 1;
          });
        }
      },
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
                _inputTextField('Fahrzeug Name'),
                Row(
                  children: [
                    CarDataInput(
                      inputDecoration: _formFieldDecoration('Kilometerstand'),
                      textStyle: _carInputTextStyle(),
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
        const Step(
          title: Text('T'),
          content: Text('Content for Step 2'),
        ),
        const Step(
          title: Text('V'),
          content: Text('Content for Step 2'),
        ),
      ],
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
