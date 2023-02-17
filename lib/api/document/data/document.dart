import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'document.g.dart';

@JsonSerializable(includeIfNull: false)
class Document extends Equatable {
  const Document({
    required this.id,
    this.name,
    this.path,
  });

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);

  final int id;
  final String? name;
  final String? path;

  Map<String, dynamic> toJson() => _$DocumentToJson(this);

  Document copyWith({
    int? id,
    String? name,
    String? path,
  }) {
    return Document(
      id: id ?? this.id,
      name: name ?? this.name,
      path: path ?? this.path,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        path,
      ];
}
