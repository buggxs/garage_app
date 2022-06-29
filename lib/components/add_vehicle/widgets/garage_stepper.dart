import 'package:flutter/material.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/components/garage/garage_screen.dart';

class GarageStepper extends StatefulWidget {
  const GarageStepper({
    Key? key,
    this.controlsBuilder,
    this.steps,
    this.currentStep,
    this.onCarCreated,
  }) : super(key: key);

  final Widget Function(BuildContext context, ControlsDetails controlsBuilder)?
      controlsBuilder;

  final Future<void> Function(Car car)? onCarCreated;

  final List<Step>? steps;
  final int? currentStep;

  @override
  State<GarageStepper> createState() => _GarageStepper();
}

class _GarageStepper extends State<GarageStepper> {
  int _index = 0;
  Car newCar = const Car();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Stepper(
        controlsBuilder: widget.controlsBuilder ?? _defaultControlWidget,
        type: StepperType.horizontal,
        currentStep: widget.currentStep ?? _index,
        onStepTapped: (int index) {
          setState(() {
            _index = index;
          });
        },
        steps: widget.steps ?? const <Step>[],
      ),
    );
  }

  Widget _defaultControlWidget(
    BuildContext context,
    ControlsDetails controlsBuilder,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          controlsBuilder.currentStep == 0
              ? const SizedBox()
              : ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.redAccent,
                    ),
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
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.green,
              ),
            ),
            onPressed: () {
              setState(() {
                switch (controlsBuilder.currentStep) {
                  case 0:
                    setState(() {
                      _index += 1;
                    });
                    break;
                  case 1:
                    widget.onCarCreated?.call(newCar);
                    Navigator.of(context).popAndPushNamed(
                      GarageScreen.route,
                      arguments: {'car', newCar},
                    );
                    break;
                }
              });
            },
            child: controlsBuilder.currentStep == 0
                ? const Text('Next')
                : const Text('Speichern'),
          ),
        ],
      ),
    );
  }
}
