import 'package:flutter/material.dart';
import 'package:garage_app/api/api.dart';
import 'package:garage_app/components/car/i18n/car_i18n.dart';
import 'package:garage_app/components/car/i18n/car_text.dart';
import 'package:garage_app/components/car/properties/property_tab.dart';
import 'package:garage_app/components/car/properties/util/card_content.dart';
import 'package:garage_app/components/common/theme/theme_constants.dart';
import 'package:garage_app/components/common/widgets/bottom_modal_container.dart';
import 'package:garage_app/components/garage/widgets/car_data_input.dart';
import 'package:garage_app/misc/logger.dart';

typedef UpdateCarData = Function({
  dynamic carProperty,
  String? lastChangeMileageString,
  String? lastChangeDateString,
});

class ModalService with LoggerMixin {
  /// property = 'oil'
  void showPropertyUpdateModal({
    required BuildContext context,
    required String type,
    required dynamic data,
    required UpdateCarData onUpdate,
  }) {
    final _formKey = GlobalKey<FormState>();
    CarProperty carProperty = Car.getCarProperty(data);
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BottomModalContainer(
          decoration: BoxDecoration(
            gradient: getCardColor(type)!['body'],
          ),
          title: getCardContent(context, carProperty)!['card_heading'],
          icon: getCardContent(context, carProperty)!['card_icon'],
          children: [
            Row(
              children: [
                Form(
                  key: _formKey,
                  child: Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CarDataInput(
                              inputDecoration: defaultInputDecorationBlack(
                                label: Text(CarText.mileage()),
                              ),
                              textInputType: TextInputType.number,
                              onSave: (String? value) {
                                onUpdate(
                                  carProperty: carProperty,
                                  lastChangeMileageString: value!,
                                );
                              },
                            ),
                            CarDataInput(
                              inputDecoration: defaultInputDecorationBlack(
                                label: Text(CarText.changedOn()),
                              ),
                              textInputType: TextInputType.datetime,
                              readOnly: true,
                              onSave: (String? value) => onUpdate(
                                carProperty: carProperty,
                                lastChangeDateString: value!,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blueGrey.shade900),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                log.info('Form was validated');
                                Navigator.pop(context);
                              }
                            },
                            child: Text(CarText.update()),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  showUpdateModal({
    required BuildContext context,
    required UpdateCarData onUpdate,
  }) {
    final _formKey = GlobalKey<FormState>();
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Mein cooles Auto dot com",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: Icon(Icons.close),
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CarDataInput(
                                inputDecoration: const InputDecoration(
                                  label: Text('Kilometerstand'),
                                ),
                                textInputType: TextInputType.number,
                                onSave: (String value) => onUpdate(
                                  lastChangeMileageString: value,
                                ),
                              ),
                              CarDataInput(
                                inputDecoration: const InputDecoration(
                                  label: Text('TÜV'),
                                ),
                                textInputType: TextInputType.datetime,
                                readOnly: true,
                                onSave: (String value) => onUpdate(
                                  lastChangeDateString: value,
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blueGrey.shade900),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                Navigator.pop(context);
                              }
                            },
                            child: const Text("Aktualisieren"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
