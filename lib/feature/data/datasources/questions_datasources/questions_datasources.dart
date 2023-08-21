import '../../../../../core/usecase/usecase.dart';

import 'package:fast_trivia/feature/data/models/questionnaire_models/question_answer_model.dart';

abstract class QuestionsDataSources{

  Future<QuestionAnswerModel> getQuestions(NoParams noParams);

}