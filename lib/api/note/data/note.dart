import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

@JsonSerializable()
class Note {
  int id;
  String note;
  DateTime? dateTime;

  Note({
    required this.id,
    required this.note,
    DateTime? dateTime,
  }) {
    this.dateTime = dateTime ?? DateTime.now();
  }

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  Map<String, dynamic> toJson() => _$NoteToJson(this);
}
