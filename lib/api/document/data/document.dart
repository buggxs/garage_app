import 'package:json_annotation/json_annotation.dart';

part 'document.g.dart';

@JsonSerializable()
class Document {

  int id;
  String name;
  String? path;
  dynamic file;

  Document({
    required this.id,
    required this.name,
    this.path,
    this.file
  });

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentToJson(this);

}