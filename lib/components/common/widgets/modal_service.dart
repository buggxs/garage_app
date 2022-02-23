import 'package:flutter/material.dart';
import 'package:garage_app/api/api.dart';
import 'package:garage_app/components/car/properties/property_tab.dart';
import 'package:garage_app/components/car/properties/util/card_content.dart';
import 'package:garage_app/components/garage/widgets/car_data_input.dart';

typedef UpdateCarData = Function({
  required dynamic carProperty,
  String? lastChangeMileageString,
  String? lastChangeDateString,
});

class ModalService {
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
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              decoration: BoxDecoration(
                gradient: getCardColor(type)!['body'],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: getCardContent(
                                  context, carProperty)!['card_icon'],
                            ),
                            Text(
                              getCardContent(
                                  context, carProperty)!['card_heading'],
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
                                      hintText: 'Kilometerstand',
                                      textInputType: TextInputType.number,
                                      onSave: (String? value) {
                                        onUpdate(
                                          carProperty: carProperty,
                                          lastChangeMileageString: value!,
                                        );
                                      },
                                    ),
                                    CarDataInput(
                                      hintText: 'TÜV',
                                      textInputType: TextInputType.datetime,
                                      readOnly: true,
                                      onSave: (String? value) => onUpdate(
                                        carProperty: carProperty,
                                        lastChangeDateString: value!,
                                      ),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.blueGrey.shade900),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        print('Form was validated');
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: const Text("Aktualisieren"))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  showUpdateModal(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 350,
            child: Padding(
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
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CarDataInput(
                                hintText: 'Kilometerstand',
                                textInputType: TextInputType.number,
                              ),
                              CarDataInput(
                                hintText: 'TÜV',
                                textInputType: TextInputType.datetime,
                                readOnly: true,
                              ),
                            ],
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blueGrey.shade900),
                              ),
                              onPressed: () => {},
                              child: const Text("Aktualisieren"))
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
