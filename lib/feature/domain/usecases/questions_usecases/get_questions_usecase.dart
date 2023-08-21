import 'package:dartz/dartz.dart';

import '../../../../core/errors/application_error.dart';
import '../../../../core/usecase/usecase.dart';

import 'package:fast_trivia/feature/domain/entities/questionnaires_entities/question_answer_entity.dart';

abstract class GetQuestionsUsecase implements Usecase<QuestionAnswerEntity, NoParams> {
  @override
  Future<Either<ApplicationError, QuestionAnswerEntity>> call(NoParams noParams);
}
