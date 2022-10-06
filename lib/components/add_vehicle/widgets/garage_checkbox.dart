import 'package:flutter/material.dart';

class GarageCheckbox extends StatefulWidget {
  const GarageCheckbox({
    Key? key,
    this.title,
    this.onChange,
  }) : super(key: key);

  final Widget? title;
  final ValueChanged<bool>? onChange;

  @override
  State<GarageCheckbox> createState() => _GarageCheckboxState();
}

class _GarageCheckboxState extends State<GarageCheckbox> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        widget.title ?? const SizedBox(),
        InkWell(
          onTap: () => setState(() {
            _value = !_value;
            widget.onChange?.call(_value);
          }),
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.white,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: _value
                ? const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 24,
                  )
                : null,
          ),
        )
      ],
    );
  }
}
