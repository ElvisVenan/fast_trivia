import 'package:dartz/dartz.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/errors/application_error.dart';

import '../../../../feature/domain/repositories/questions_repositories/questions_repositories.dart';
import 'package:fast_trivia/feature/domain/entities/questionnaires_entities/question_answer_entity.dart';

import 'get_questions_usecase.dart';

class GetQuestionsUsecaseImpl implements GetQuestionsUsecase{

  final QuestionsRepositories repository;

  const GetQuestionsUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, QuestionAnswerEntity>> call(NoParams noParams) async {
    return await repository.getQuestions(noParams);
  }

}