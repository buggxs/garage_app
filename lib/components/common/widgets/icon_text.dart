import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  IconText({
    required this.text,
    this.textStyle,
    this.assetImage,
    this.iconData,
    this.size,
    this.iconColor,
  });

  String text;
  TextStyle? textStyle;
  AssetImage? assetImage;
  IconData? iconData;
  double? size;
  Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: iconData != null ?
          Icon(
            iconData,
            color: iconColor,
            size: size,
          )
          :
          ImageIcon(
            assetImage,
            color: iconColor,
            size: size,
          ),
        ),
        textStyle != null ? Text(text) : Text(text, style: textStyle,)
      ],
    );
  }
}
