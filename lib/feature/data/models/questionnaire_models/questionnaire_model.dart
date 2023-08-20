import 'dart:convert';

import 'package:fast_trivia/feature/data/models/questionnaire_models/questions_model.dart';

import '../../../domain/entities/questionnaires_entities/questionnaire_entity.dart';

class QuestionnaireModel extends QuestionnaireEntity {
  final int id;
  final String title;
  final List<QuestionsModel> questions;

  QuestionnaireModel({
    required this.id,
    required this.title,
    required this.questions,
  }) : super(
    id: id,
    title: title,
    questions: questions,
  );

  Map<String, dynamic> toMap() {
    return {

    };
  }

  factory QuestionnaireModel.fromMap(Map<String, dynamic> map) {
    return QuestionnaireModel(
      id: map['id'] as int,
      title: map['title'] as String,
      questions: (map['questions'] as List<dynamic>)
          .map((e) => QuestionsModel.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionnaireModel.fromJson(String source) =>
      QuestionnaireModel.fromMap(json.decode(source));

  static List<QuestionnaireModel> fromListMap(List list) =>
      list.map((e) => QuestionnaireModel.fromMap(e)).toList();

  static List<QuestionnaireModel> fromJsonList(String source) =>
      (json.decode(source) as List).map((e) => QuestionnaireModel.fromMap(e)).toList();
}
