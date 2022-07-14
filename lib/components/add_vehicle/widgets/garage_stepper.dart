import 'package:flutter/material.dart';
import 'package:garage_app/api/api.dart';
import 'package:garage_app/components/garage/widgets/car_data_input.dart';

class GarageStepper extends StatefulWidget {
  const GarageStepper({
    Key? key,
    this.controlsBuilder,
    this.steps,
    this.currentStep,
    this.onCarCreated,
    this.onFormSave,
  }) : super(key: key);

  final Widget Function(BuildContext context, ControlsDetails controlsBuilder)?
      controlsBuilder;

  final VoidCallback? onFormSave;
  final Function({required Car car})? onCarCreated;

  final List<Step>? steps;
  final int? currentStep;

  @override
  State<GarageStepper> createState() => _GarageStepper();
}

class _GarageStepper extends State<GarageStepper> {
  int _index = 0;
  Car newCar = const Car();
  Map<int, Map<String, dynamic>> stepInfo = {
    0: {
      'error': false,
      'completed': false,
    },
    1: {
      'error': false,
      'completed': false,
    },
    2: {
      'error': false,
      'completed': false,
    },
  };

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: const ColorScheme.light(
          primary: Colors.green,
        ),
      ),
      child: Stepper(
        controlsBuilder: widget.controlsBuilder ?? _defaultControlWidget,
        type: StepperType.horizontal,
        currentStep: widget.currentStep ?? _index,
        onStepTapped: (int index) {
          setState(() {
            _index = index;
          });
        },
        onStepContinue: () {
          setState(() {
            stepInfo[_index]!['completed'] = true;
            stepInfo[_index]!['error'] = false;
          });
        },
        steps: widget.steps ??
            <Step>[
              _stepOne(),
              _stepTwo(),
              _stepThree(),
            ],
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
                    if (_index >= 0) {
                      setState(() {
                        _index -= 1;
                      });
                    }
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
                    setState(() {
                      _index += 1;
                    });
                    break;
                  case 2:
                    widget.onFormSave?.call();
                    widget.onCarCreated?.call(car: newCar);
                    break;
                  default:
                    setState(() {
                      _index = 0;
                    });
                    break;
                }
              });
            },
            child: controlsBuilder.currentStep < 2
                ? const Text('Next')
                : const Text('Speichern'),
          ),
        ],
      ),
    );
  }

  Step _stepOne() {
    return Step(
      title: const Text('Auto Infos'),
      state: stepInfo[0]!['error']
          ? _index > 0
              ? StepState.error
              : StepState.indexed
          : _index > 0
              ? StepState.complete
              : StepState.indexed,
      isActive: _index >= 0,
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
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      stepInfo[0]!['error'] = true;
                      return 'Es muss ein Name vergeben werden';
                    }
                    stepInfo[0]!['completed'] = true;
                    return null;
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
                  textInputType: TextInputType.number,
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
                  textInputType: TextInputType.number,
                  textStyle: _carInputTextStyle(),
                  onSave: (String value) {
                    newCar = newCar.copyWith(
                      vintage: int.tryParse(value),
                    );
                  },
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      stepInfo[0]!['error'] = true;
                      return 'Das Baujahr fehlt.';
                    }
                    stepInfo[0]!['completed'] = true;
                    return null;
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
      state: _index > 1 ? StepState.complete : StepState.indexed,
      isActive: _index >= 1,
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
                  onSave: (String value) {
                    newCar = newCar.copyWith(
                      technicalData: newCar.technicalData?.copyWith(
                            brand: value,
                          ) ??
                          TechnicalData(brand: value),
                    );
                  },
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
                  onSave: (String value) {
                    newCar = newCar.copyWith(
                      technicalData: newCar.technicalData?.copyWith(
                            model: value,
                          ) ??
                          TechnicalData(model: value),
                    );
                  },
                ),
                CarDataInput(
                  inputDecoration: const InputDecoration(
                    labelText: 'Typ',
                  ),
                  onSave: (String value) {
                    newCar = newCar.copyWith(
                      technicalData: newCar.technicalData?.copyWith(
                            type: value,
                          ) ??
                          TechnicalData(type: value),
                    );
                  },
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
                  onSave: (String value) {
                    newCar = newCar.copyWith(
                      technicalData: newCar.technicalData?.copyWith(
                            hsn: value,
                          ) ??
                          TechnicalData(hsn: value),
                    );
                  },
                ),
                CarDataInput(
                  inputDecoration: const InputDecoration(
                    labelText: 'TSN',
                  ),
                  textStyle: _carInputTextStyle(),
                  onSave: (String value) {
                    newCar = newCar.copyWith(
                      technicalData: newCar.technicalData?.copyWith(
                            tsn: value,
                          ) ??
                          TechnicalData(tsn: value),
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

  Step _stepThree() {
    return Step(
      title: const Text('Auto Bilder'),
      isActive: _index == 2,
      content: Container(
        alignment: Alignment.centerLeft,
        child: const Center(
          child: Text('Bilder'),
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
