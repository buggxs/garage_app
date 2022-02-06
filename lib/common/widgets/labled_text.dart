import 'package:flutter/material.dart';

class LabeledText extends StatelessWidget {
  const LabeledText({
    Key? key,
    required this.caption,
    required this.text,
    this.multiLineText,
    this.captionStyle,
    this.textStyle,
    this.padding,
  }) : super(key: key);

  final String caption;
  final String text;
  final String? multiLineText;
  final TextStyle? captionStyle;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            caption,
            style: captionStyle ?? Theme.of(context).textTheme.caption,
          ),
          Text(
            text,
            style: textStyle ??
                const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
          ),
          multiLineText == null
              ? const SizedBox()
              : Text(
                  multiLineText!,
                  style: textStyle ??
                      const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                ),
        ],
      ),
    );
  }
}
