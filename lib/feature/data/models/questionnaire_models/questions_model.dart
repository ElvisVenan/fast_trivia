import 'dart:convert';

import 'package:fast_trivia/feature/domain/entities/questionnaires_entities/questions_enitity.dart';

import 'options_model.dart';

class QuestionsModel extends QuestionsEntity {
  final int id;
  final String title;
  final String question;
  final int answer;
  final List<OptionsModel> options;

  QuestionsModel({
    required this.id,
    required this.title,
    required this.question,
    required this.answer,
    required this.options,
  }) : super(
    id: id,
    title: title,
    question: question,
    answer: answer,
    options: options,
  );

  Map<String, dynamic> toMap() {
    return {

    };
  }

  factory QuestionsModel.fromMap(Map<String, dynamic> map) {
    return QuestionsModel(
      id: map['id'] as int,
      title: map['title'] as String,
      question: map['question'] as String,
      answer: map['answer'] as int,
      options: (map['options'] as List<dynamic>)
          .map((e) => OptionsModel.fromMap(e as Map<String, dynamic>))
          .toList(),
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
