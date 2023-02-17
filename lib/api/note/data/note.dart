import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

@JsonSerializable(includeIfNull: false)
class Note extends Equatable {
  const Note({
    required this.id,
    required this.note,
    this.dateTime,
  });

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  final int id;
  final String note;
  final DateTime? dateTime;

  String get getNote => note.trim().replaceAll('\t', '');

  Map<String, dynamic> toJson() => _$NoteToJson(this);

  Note copyWith({
    int? id,
    String? note,
    DateTime? dateTime,
  }) {
    return Note(
      id: id ?? this.id,
      note: note ?? this.note,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        id,
        note,
        dateTime,
      ];
}
