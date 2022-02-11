import 'package:flutter/material.dart';
import 'package:garage_app/components/garage/widgets/car_data_input.dart';

class ModalService {
  void showPropertyUpdateModal(
      BuildContext context,
      Map<String, Map<String, dynamic>> content,
      Map<String, Map<String, dynamic>> colorType,
      String type,
      String property) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              gradient: colorType[type]!['body'],
            ),
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
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: content[property]!['card_icon'],
                          ),
                          Text(
                            content[property]!['card_heading'],
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
                        child: Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CarDataInput(
                                    hintText: 'Kilometerstand',
                                    buttonText: 'Speichern',
                                    textInputType: TextInputType.number,
                                  ),
                                  CarDataInput(
                                    hintText: 'TÜV',
                                    buttonText: 'Aktualisieren',
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
                ],
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
                                buttonText: 'Speichern',
                                textInputType: TextInputType.number,
                              ),
                              CarDataInput(
                                hintText: 'TÜV',
                                buttonText: 'Aktualisieren',
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
