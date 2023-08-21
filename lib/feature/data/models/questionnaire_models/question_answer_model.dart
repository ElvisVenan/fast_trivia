import 'dart:convert';

import 'package:fast_trivia/feature/data/models/questionnaire_models/questionnaire_model.dart';
import 'package:fast_trivia/feature/domain/entities/questionnaires_entities/question_answer_entity.dart';

class QuestionAnswerModel extends QuestionAnswerEntity {
  final QuestionnaireModel questionnaire;
  
  QuestionAnswerModel({
    required this.questionnaire,
  }) : super(
    questionnaire: questionnaire,
  );

  Map<String, dynamic> toMap() {
    return {

    };
  }

  factory QuestionAnswerModel.fromMap(Map<String, dynamic> map) {
    return QuestionAnswerModel(
      questionnaire: QuestionnaireModel.fromMap(map['questionnaire'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionAnswerModel.fromJson(String source) =>
      QuestionAnswerModel.fromMap(json.decode(source));

  static List<QuestionAnswerModel> fromListMap(List list) =>
      list.map((e) => QuestionAnswerModel.fromMap(e)).toList();

  static List<QuestionAnswerModel> fromJsonList(String source) =>
      (json.decode(source) as List).map((e) => QuestionAnswerModel.fromMap(e)).toList();
}
