import 'package:flutter/material.dart';

class CarDataInput extends StatefulWidget {
  const CarDataInput({Key? key}) : super(key: key);

  @override
  _CarDataInputState createState() => _CarDataInputState();
}

class _CarDataInputState extends State<CarDataInput> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: 200,
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Aktueller Kilometerstand',
              ),
              keyboardType: TextInputType.number,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                }
              },
              child: const Text('Speichern'),
            ),
          ),
        ],
      ),
    );
  }
}
