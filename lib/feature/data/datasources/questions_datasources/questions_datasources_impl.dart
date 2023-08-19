import 'package:flutter/services.dart';

import '../../../../core/usecase/usecase.dart';

import '../../../../feature/data/datasources/questions_datasources/questions_datasources.dart';
import '../../../../feature/domain/entities/questions_entities/questions_entity.dart';
import '../../../../feature/data/models/questions_models/questions_model.dart';

class QuestionsDatasourcesImpl implements QuestionsDataSources{
  @override
  Future<QuestionsEntity> getQuestions(NoParams noParams) async {

    final jsonString = await rootBundle.loadString('assets/jsons/teste.json');

    final post = QuestionsModel.fromJson(jsonString);

    return post;

  }
}