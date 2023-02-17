import 'package:flutter/material.dart';
import 'package:garage_app/components/garage/widgets/car_data_input.dart';

class AddNoteDialog extends StatelessWidget {
  AddNoteDialog({
    Key? key,
    this.onSubmit,
  }) : super(key: key);

  final void Function(String?)? onSubmit;

  // TODO: put noteText into cubit state
  String? noteText;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    noteText = value;
                  },
                  maxLines: 5,
                  inputDecoration: const InputDecoration(
                    alignLabelWithHint: true,
                    label: Text('Hello'),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
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
                        Navigator.pop(context, noteText);
                      }
                    },
                    child: const Text('Hinzufügen'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
