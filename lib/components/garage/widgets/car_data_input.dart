import 'package:flutter/material.dart';
import 'package:garage_app/common/service/app_service.dart';
import 'package:garage_app/common/service/popup_service.dart';

class CarDataInput extends StatefulWidget {
  CarDataInput({
    Key? key,
    this.hintText,
    this.buttonText,
    this.textInputType,
    this.readOnly = false,
  }) : super(key: key);

  String? hintText;
  String? buttonText;
  TextInputType? textInputType;
  bool readOnly;

  @override
  _CarDataInputState createState() => _CarDataInputState();
}

class _CarDataInputState extends State<CarDataInput> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController =
    TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _textEditingController,
                decoration: widget.hintText != null ? InputDecoration(
                  label: Text(widget.hintText!)
                ) : null,
                keyboardType: widget.textInputType,
                readOnly: widget.readOnly,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18
                ),
                onTap: widget.textInputType == TextInputType.datetime ? () =>
                    app.get<PopupService>().selectDate(
                      context: context,
                      controller: _textEditingController) : null,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
