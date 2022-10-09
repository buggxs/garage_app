import 'package:flutter/material.dart';
import 'package:garage_app/common/widgets/popup_service.dart';
import 'package:garage_app/core/app_service_locator.dart';

typedef Validate = String? Function(String? value);

class CarDataInput extends StatefulWidget {
  const CarDataInput({
    Key? key,
    this.inputDecoration,
    this.textInputType = TextInputType.text,
    this.readOnly = false,
    this.onSave,
    this.validate,
    this.maxLines,
    this.textStyle,
    this.onChanged,
  }) : super(key: key);

  final InputDecoration? inputDecoration;
  final TextInputType textInputType;
  final bool? readOnly;
  final ValueChanged<String>? onSave;
  final Validate? validate;
  final int? maxLines;
  final TextStyle? textStyle;
  final void Function(String? value)? onChanged;

  @override
  _CarDataInputState createState() => _CarDataInputState();
}

class _CarDataInputState extends State<CarDataInput> {
  final TextEditingController _textEditingController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: TextFormField(
          controller: _textEditingController,
          decoration: widget.inputDecoration,
          keyboardType: widget.textInputType,
          onChanged: widget.onChanged,
          readOnly:
              widget.readOnly ?? widget.textInputType == TextInputType.datetime,
          style: widget.textStyle ??
              const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
          onTap: widget.textInputType == TextInputType.datetime
              ? () => app.get<PopupService>().selectDate(
                  context: context, controller: _textEditingController)
              : null,
          validator: widget.validate,
          onSaved: (String? value) =>
              widget.onSave != null ? widget.onSave!(value!) : print(value!),
          maxLines: widget.maxLines,
        ),
      ),
    );
  }
}
