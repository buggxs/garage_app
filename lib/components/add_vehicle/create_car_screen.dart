import 'package:flutter/material.dart';
import 'package:garage_app/components/common/widgets/garage_scaffold.dart';

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
              child: const Text('Content for Step 1')),
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
}
