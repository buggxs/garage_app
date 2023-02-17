import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  const IconText({
    Key? key,
    required this.text,
    this.textStyle,
    this.assetImage,
    this.iconData,
    this.size,
    this.iconColor,
  }) : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final AssetImage? assetImage;
  final IconData? iconData;
  final double? size;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: iconData != null
              ? Icon(
                  iconData,
                  color: iconColor,
                  size: size,
                )
              : ImageIcon(
                  assetImage,
                  color: iconColor,
                  size: size,
                ),
        ),
        if (textStyle != null)
          Text(text)
        else
          Text(
            text,
            style: textStyle,
          )
      ],
    );
  }
}
