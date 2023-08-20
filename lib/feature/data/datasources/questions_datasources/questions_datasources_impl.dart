import 'package:fast_trivia/feature/data/models/questionnaire_models/question_answer_model.dart';
import 'package:flutter/services.dart';

import '../../../../core/usecase/usecase.dart';

import '../../../../feature/data/datasources/questions_datasources/questions_datasources.dart';

class QuestionsDatasourcesImpl implements QuestionsDataSources{
  @override
  Future<QuestionAnswerModel> getQuestions(NoParams noParams) async {

    final jsonString = await rootBundle.loadString('assets/jsons/questions.json');

    final post = QuestionAnswerModel.fromJson(jsonString);

    return post;

  }
}