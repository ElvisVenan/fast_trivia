import 'package:dartz/dartz.dart';

import '../../../../core/errors/application_error.dart';
import '../../../../core/usecase/usecase.dart';

import '../../../../feature/domain/entities/questions_entities/questions_entity.dart';

abstract class QuestionsRepositories {

  Future<Either<ApplicationError, QuestionsEntity>> getQuestions(NoParams noParams);

}