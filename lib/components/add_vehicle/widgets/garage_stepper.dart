import 'dart:developer';
import 'dart:io';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garage_app/api/api.dart';
import 'package:garage_app/common/i18n/common_i18n.dart';
import 'package:garage_app/common/i18n/common_text.dart';
import 'package:garage_app/components/add_vehicle/I18n/add_vehicle_i18n.dart';
import 'package:garage_app/components/add_vehicle/I18n/add_vehicle_text.dart';
import 'package:garage_app/components/add_vehicle/widgets/garage_checkbox.dart';
import 'package:garage_app/components/car/i18n/car_i18n.dart';
import 'package:garage_app/components/car/i18n/car_text.dart';
import 'package:garage_app/components/car/properties/widgets/image_slider.dart';
import 'package:garage_app/components/garage/widgets/car_data_input.dart';
import 'package:garage_app/misc/color_constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

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
  final CarouselController carouselController = CarouselController();
  int _index = 0;
  Car newCar = const Car();
  List<File> images = <File>[];
  int imageIndex = 0;

  Map<int, Map<String, dynamic>> stepInfo = <int, Map<String, dynamic>>{
    0: <String, bool>{
      'error': false,
      'completed': false,
    },
    1: <String, bool>{
      'error': false,
      'completed': false,
    },
    2: <String, bool>{
      'error': false,
      'completed': false,
    },
  };

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: ColorConstants.shieldBlue,
        colorScheme: ColorScheme.light(
          secondary: Colors.green.shade600,
          background: Colors.grey.shade500,
          brightness: Brightness.dark,
        ),
        textTheme: Theme.of(context).textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Colors.white,
              ),
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
        vertical: 12,
        horizontal: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          if (controlsBuilder.currentStep == 0)
            const SizedBox()
          else
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  ColorConstants.myGarageDangerRed,
                ),
                shadowColor: MaterialStateProperty.all<Color>(Colors.black),
                elevation: MaterialStateProperty.all<double>(4),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    side: BorderSide(width: 2),
                  ),
                ),
              ),
              onPressed: () {
                if (_index >= 0) {
                  setState(() {
                    _index -= 1;
                  });
                }
              },
              child: Text(CommonText.back()),
            ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                ColorConstants.myGarageSuccessGreen,
              ),
              shadowColor: MaterialStateProperty.all<Color>(Colors.black),
              elevation: MaterialStateProperty.all<double>(4),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  side: BorderSide(width: 2),
                ),
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
                ? Text(CommonText.next())
                : Text(CommonText.save()),
          ),
        ],
      ),
    );
  }

  Step _stepOne() {
    return Step(
      title: Text(AddVehicleText.carInformationShort()),
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
          children: <Widget>[
            Row(
              children: <Widget>[
                CarDataInput(
                  inputDecoration: InputDecoration(
                    labelText: AddVehicleText.vehicleName(),
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
                      return AddVehicleText.nameMissingError();
                    }
                    stepInfo[0]!['completed'] = true;
                    return null;
                  },
                ),
              ],
            ),
            Row(
              children: <Widget>[
                CarDataInput(
                  textInputType: TextInputType.datetime,
                  inputDecoration: InputDecoration(
                    labelText: AddVehicleText.tuev(),
                  ),
                  textStyle: _carInputTextStyle(),
                  onSave: (String value) {
                    final List<String> dateValues = value.split('.');
                    final String parsableDate =
                        '${dateValues[2]}-${dateValues[1]}-${dateValues[0]}';
                    final DateTime? date = DateTime.tryParse(parsableDate);
                    newCar = newCar.copyWith(
                      date: date,
                    );
                  },
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      stepInfo[0]!['error'] = true;
                      return AddVehicleText.tuevMissingError();
                    }
                    stepInfo[0]!['completed'] = true;
                    return null;
                  },
                ),
              ],
            ),
            Row(
              children: <Widget>[
                CarDataInput(
                  inputDecoration: InputDecoration(
                    labelText: CarText.mileage(),
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
                  inputDecoration: InputDecoration(
                    labelText: CarText.vintage(),
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
                      return AddVehicleText.vintageMissingError();
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
      title: Text(AddVehicleText.carData()),
      state: _index > 1 ? StepState.complete : StepState.indexed,
      isActive: _index >= 1,
      content: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CarDataInput(
                  inputDecoration: InputDecoration(
                    labelText: CarText.brand(),
                  ),
                  textStyle: _carInputTextStyle(),
                  onSave: (String value) {
                    newCar = newCar.copyWith(
                      brand: value,
                    );
                  },
                ),
              ],
            ),
            Row(
              children: <Widget>[
                CarDataInput(
                  inputDecoration: InputDecoration(
                    labelText: CarText.model(),
                  ),
                  textStyle: _carInputTextStyle(),
                  onSave: (String value) {
                    newCar = newCar.copyWith(
                      model: value,
                    );
                  },
                ),
                CarDataInput(
                  inputDecoration: InputDecoration(
                    labelText: CarText.type(),
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
              children: <Widget>[
                CarDataInput(
                  inputDecoration: InputDecoration(
                    labelText: CarText.hsn(),
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
                  inputDecoration: InputDecoration(
                    labelText: CarText.tsn(),
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
            Row(
              children: <Widget>[
                CarDataInput(
                  inputDecoration: InputDecoration(
                    labelText: AddVehicleText.vehicleTax(),
                  ),
                  textInputType: TextInputType.number,
                  textStyle: _carInputTextStyle(),
                  onSave: (String value) {
                    newCar = newCar.copyWith(
                      technicalData: newCar.technicalData?.copyWith(
                            vehicleTax: double.tryParse(value),
                          ) ??
                          TechnicalData(hsn: value),
                    );
                  },
                ),
                CarDataInput(
                  inputDecoration: InputDecoration(
                    labelText: AddVehicleText.purchasePrice(),
                  ),
                  textInputType: TextInputType.number,
                  textStyle: _carInputTextStyle(),
                  onSave: (String value) {
                    newCar = newCar.copyWith(
                      technicalData: newCar.technicalData?.copyWith(
                            purchasePrice: double.tryParse(value),
                          ) ??
                          TechnicalData(tsn: value),
                    );
                  },
                ),
              ],
            ),
            Row(
              children: <Widget>[
                GarageCheckbox(
                  title: Text(
                    'Diesel',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                  ),
                  onChange: (bool value) {
                    if (value) {
                      newCar.technicalData?.fuelType.add(FuelType.petrol);
                    } else {
                      newCar.technicalData?.fuelType.remove(FuelType.petrol);
                    }
                  },
                ),
                GarageCheckbox(
                  title: Text(
                    'Benzin',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                  ),
                  onChange: (bool value) {
                    if (value) {
                      newCar.technicalData?.fuelType.add(FuelType.petrol);
                    } else {
                      newCar.technicalData?.fuelType.remove(FuelType.petrol);
                    }
                  },
                ),
                GarageCheckbox(
                  title: Text(
                    'Elektro',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                  ),
                  onChange: (bool value) {
                    if (value) {
                      newCar.technicalData?.fuelType.add(FuelType.electric);
                    } else {
                      newCar.technicalData?.fuelType.remove(FuelType.electric);
                    }
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
      title: Text(AddVehicleText.carImages()),
      isActive: _index == 2,
      content: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          children: <Widget>[
            if (images.isNotEmpty)
              ImageSlider(
                withIndicator: true,
                activeIndex: imageIndex,
                carouselController: carouselController,
                urlList: images.map((File e) => e.path).toList(),
                onDotClicked: (int? index) {
                  if (index != null) {
                    setState(() {
                      imageIndex = index;
                    });
                    carouselController.animateToPage(index);
                  }
                },
                carouselOptions: CarouselOptions(
                  aspectRatio: 16 / 9,
                  initialPage: imageIndex,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  enableInfiniteScroll: true,
                  onPageChanged: (int index, _) {
                    setState(() {
                      imageIndex = index;
                    });
                  },
                ),
              )
            else
              const SizedBox(),
            const SizedBox(height: 16),
            Row(
              children: <Widget>[
                if (images.isNotEmpty)
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.redAccent.shade700,
                        ),
                      ),
                      onPressed: () {
                        // TODO: remove image from list method
                        log('remove image..');
                      },
                      child: const Text('Bild entfernen'),
                    ),
                  )
                else
                  const SizedBox(),
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        ColorConstants.myGarageBlue,
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 8,
                        ),
                      ),
                      shadowColor: MaterialStateProperty.all<Color>(
                        Colors.black,
                      ),
                      elevation: MaterialStateProperty.all<double>(4),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          side: BorderSide(
                            width: 2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    onPressed: _pickImage,
                    child: Row(
                      children: <Widget>[
                        const ImageIcon(
                          AssetImage('assets/icons/file.png'),
                          size: 28,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                CommonText.selectImage(),
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    // TODO: For IOS use need to add permissions
    try {
      final File? image =
          await ImagePicker.pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }

      final File? croppedImage = await ImageCropper().cropImage(
        sourcePath: image.path,
        aspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),
        compressQuality: 100,
        compressFormat: ImageCompressFormat.png,
        androidUiSettings: AndroidUiSettings(
          toolbarColor: Colors.deepOrange,
          toolbarTitle: 'Garage Cropper',
          statusBarColor: Colors.deepOrange.shade700,
          backgroundColor: Colors.black,
        ),
      );

      if (croppedImage == null) {
        return;
      }

      // final imageTemp = File(image.path);
      // final imagePermanent = await saveImagePermanently(croppedImage.path);
      setState(() {
        images = <File>[croppedImage, ...images];
        newCar = newCar.copyWith(localeImages: images);
      });
    } on PlatformException catch (e) {
      log('Failed to pick image: $e');
    }
  }

  TextStyle _carInputTextStyle() {
    return const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 17,
      color: Colors.white,
    );
  }
}
