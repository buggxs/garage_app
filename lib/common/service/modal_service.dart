
import 'package:flutter/material.dart';
import 'package:garage_app/components/garage/widgets/car_data_input.dart';

class ModalService {


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
                      children: const[
                        Text(
                          "Mein cooles Auto dot com",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),
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
                        CarDataInput(
                          hintText: 'Aktueller Kilometerstand',
                          buttonText: 'Speichern',
                          textInputType: TextInputType.number,
                        ),
                        CarDataInput(
                          hintText: 'TÜV',
                          buttonText: 'Aktualisieren',
                          textInputType: TextInputType.datetime,
                          readOnly: true,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(
                                Colors.blueGrey.shade900
                            ),
                          ),
                          onPressed: () => {},
                          child: const Text("Aktualisieren")
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}