import 'package:flutter/material.dart';
import 'package:garage_app/components/garage/widgets/car_data_input.dart';

class AddDocumentDialog extends StatelessWidget {
  AddDocumentDialog({
    Key? key,
    this.onSubmit,
  }) : super(key: key);

  final void Function(String?)? onSubmit;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> documentData = <String, dynamic>{
    'name': null,
    'type': null,
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CarDataInput(
                  onSave: (String value) {
                    documentData['name'] = value;
                  },
                  maxLines: 1,
                  inputDecoration: const InputDecoration(
                    alignLabelWithHint: true,
                    label: Text('Document name'),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 8,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: CarDocumentDropDown(
                      onChange: (String value) {
                        documentData['type'] = value;
                      },
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Navigator.pop(context, documentData);
                      }
                    },
                    child: const Text('Aktualisieren'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class CarDocumentDropDown extends StatefulWidget {
  const CarDocumentDropDown({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  final ValueChanged<String> onChange;

  @override
  State<CarDocumentDropDown> createState() => _CarDocumentDropDownState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _CarDocumentDropDownState extends State<CarDocumentDropDown> {
  String dropdownValue = 'General documents';

  @override
  Widget build(BuildContext context) {
    if (dropdownValue.isNotEmpty) {
      widget.onChange(dropdownValue);
    }
    return Listener(
      onPointerDown: (_) => FocusScope.of(context).unfocus(),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const SizedBox(),
        iconSize: 24,
        elevation: 16,
        onChanged: (String? newValue) {
          if (newValue?.isNotEmpty ?? false) {
            setState(() {
              dropdownValue = newValue!;
            });
          }
        },
        items: <String>['General documents', 'Invoices', 'Other documents']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
