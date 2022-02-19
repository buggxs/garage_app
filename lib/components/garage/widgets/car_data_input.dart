import 'package:flutter/material.dart';
import 'package:garage_app/common/service/app_service.dart';
import 'package:garage_app/common/service/popup_service.dart';

typedef Validate = String? Function(String? value);

class CarDataInput extends StatefulWidget {
  const CarDataInput({
    Key? key,
    this.hintText,
    this.textInputType = TextInputType.text,
    this.readOnly = false,
    this.onSave,
    this.validate,
  }) : super(key: key);

  final String? hintText;
  final TextInputType textInputType;
  final bool? readOnly;
  final ValueChanged<String>? onSave;
  final Validate? validate;

  @override
  _CarDataInputState createState() => _CarDataInputState();
}

class _CarDataInputState extends State<CarDataInput> {
  final TextEditingController _textEditingController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: _textEditingController,
          decoration: widget.hintText != null
              ? InputDecoration(label: Text(widget.hintText!))
              : null,
          keyboardType: widget.textInputType,
          readOnly:
              widget.readOnly ?? widget.textInputType == TextInputType.datetime,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          onTap: widget.textInputType == TextInputType.datetime
              ? () => app.get<PopupService>().selectDate(
                  context: context, controller: _textEditingController)
              : null,
          validator: widget.validate,
          onSaved: (String? value) =>
              widget.onSave != null ? widget.onSave!(value!) : print(value!),
        ),
      ),
    );
  }
}
