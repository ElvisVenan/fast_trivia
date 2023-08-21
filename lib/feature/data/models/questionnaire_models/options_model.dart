import 'dart:convert';

import '../../../../feature/domain/entities/questionnaires_entities/options_entity.dart';

class OptionsModel extends OptionsEntity {
  final int id;
  final String title;

  OptionsModel({
    required this.id,
    required this.title,
  }) : super(
    id: id,
    title: title,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  factory OptionsModel.fromMap(Map<String, dynamic> map) {
    return OptionsModel(
      id: map['id'] as int,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OptionsModel.fromJson(String source) =>
      OptionsModel.fromMap(json.decode(source));

  static List<OptionsModel> fromListMap(List list) =>
      list.map((e) => OptionsModel.fromMap(e)).toList();

  static List<OptionsModel> fromJsonList(String source) =>
      (json.decode(source) as List).map((e) => OptionsModel.fromMap(e)).toList();
}
