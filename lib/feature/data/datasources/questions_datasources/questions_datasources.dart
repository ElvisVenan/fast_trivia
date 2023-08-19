import '../../../../../core/usecase/usecase.dart';

import '../../../../../feature/domain/entities/questions_entities/questions_entity.dart';

abstract class QuestionsDataSources{

  Future<QuestionsEntity> getQuestions(NoParams noParams);

}