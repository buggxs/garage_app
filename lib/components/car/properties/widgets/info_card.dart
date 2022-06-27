import 'package:flutter/material.dart';
import 'package:garage_app/components/common/widgets/labled_text.dart';
import 'package:garage_app/misc/misc.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    this.caption,
    this.content,
  }) : super(key: key);

  final String? caption, content;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      color: ColorConstants.shieldBlue,
      child: LabeledText(
        caption: caption,
        text: content ?? '',
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        captionStyle: Theme.of(context).textTheme.caption!.apply(
              color: Colors.white,
            ),
      ),
    );
  }
}
