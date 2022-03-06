import 'package:flutter/material.dart';
import 'package:garage_app/api/note/data/note.dart';
import 'package:garage_app/components/common/widgets/labled_text.dart';
import 'package:garage_app/core/utils/text_formatter.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    Key? key,
    this.note,
  }) : super(key: key);

  final Note? note;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabeledText(
            caption: TextFormatter.formatGermanDate(note?.dateTime),
            text: note!.note,
            multiLineText: true,
          )
        ],
      ),
    );
  }
}
