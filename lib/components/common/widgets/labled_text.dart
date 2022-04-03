import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class LabeledText extends StatelessWidget {
  const LabeledText({
    Key? key,
    this.caption,
    required this.text,
    this.multiLineText = false,
    this.captionStyle,
    this.textStyle,
    this.padding,
  }) : super(key: key);

  final String? caption;
  final String text;
  final bool multiLineText;
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
          caption != null
              ? Text(
                  caption!,
                  style: captionStyle ?? Theme.of(context).textTheme.caption,
                )
              : const SizedBox(),
          multiLineText
              ? AutoSizeText(
                  text,
                  textAlign: TextAlign.start,
                  style: textStyle ??
                      const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                  maxLines: 20,
                )
              : AutoSizeText(
                  text,
                  style: textStyle ??
                      const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                  maxLines: 1,
                  overflowReplacement: AutoSizeText(
                    text,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                    maxLines: 1,
                    overflowReplacement: AutoSizeText(
                      text,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
