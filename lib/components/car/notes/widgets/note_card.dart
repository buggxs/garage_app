import 'package:flutter/material.dart';
import 'package:garage_app/api/note/data/note.dart';
import 'package:garage_app/common/widgets/labled_text.dart';
import 'package:garage_app/misc/text_formatter.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    Key? key,
    this.note,
  }) : super(key: key);

  final Note? note;

  @override
  Widget build(BuildContext context) {
    return note != null
        ? Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabeledText(
                  caption: note?.dateTime != null
                      ? TextFormatter.formatGermanDate(note?.dateTime)
                      : null,
                  text: note!.note,
                  multiLineText: true,
                )
              ],
            ),
          )
        : const SizedBox();
  }
}
