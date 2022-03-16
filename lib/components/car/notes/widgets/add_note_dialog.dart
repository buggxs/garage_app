import 'package:flutter/material.dart';
import 'package:garage_app/components/garage/widgets/car_data_input.dart';

class AddNoteDialog extends StatelessWidget {
  AddNoteDialog({
    Key? key,
    this.onSubmit,
  }) : super(key: key);

  void Function(String?)? onSubmit;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                CarDataInput(
                  onSave: onSubmit,
                  maxLines: 5,
                  inputDecoration: InputDecoration(
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
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Aktualisieren"),
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
