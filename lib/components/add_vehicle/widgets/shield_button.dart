import 'package:flutter/material.dart';
import 'package:garage_app/misc/color_constants.dart';

class ShieldButton extends StatelessWidget {
  const ShieldButton(
      {Key? key,
      required this.text,
      required this.onTap,
      this.maxHeight = 130.0,
      this.maxWidth = 180.0})
      : super(key: key);

  final String text;
  final VoidCallback onTap;

  final double maxWidth;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 8,
        ),
        constraints: BoxConstraints(
          maxWidth: maxWidth,
          maxHeight: maxHeight,
        ),
        decoration: BoxDecoration(
          color: ColorConstants.shieldBlue,
          border: Border.all(color: Colors.white, width: 4.0),
          borderRadius: const BorderRadius.all(
            Radius.circular(7.0),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
