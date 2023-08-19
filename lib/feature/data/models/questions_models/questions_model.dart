import 'dart:convert';

import '../../../domain/entities/questions_entities/questions_entity.dart';

class QuestionsModel extends QuestionsEntity {
  final String question;

  QuestionsModel({
    required this.question,
  }) : super(
    question: question,
  );

  Map<String, dynamic> toMap() {
    return {
      'question': question,
    };
  }

  factory QuestionsModel.fromMap(Map<String, dynamic> map) {
    return QuestionsModel(
      question: map['question'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionsModel.fromJson(String source) =>
      QuestionsModel.fromMap(json.decode(source));

  static List<QuestionsModel> fromListMap(List list) =>
      list.map((e) => QuestionsModel.fromMap(e)).toList();

  static List<QuestionsModel> fromJsonList(String source) =>
      (json.decode(source) as List).map((e) => QuestionsModel.fromMap(e)).toList();
}
