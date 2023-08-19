import 'package:dartz/dartz.dart';

import '../../../../core/errors/application_error.dart';
import '../../../../core/usecase/usecase.dart';

import '../../../../feature/domain/entities/questions_entities/questions_entity.dart';

abstract class GetQuestionsUsecase implements Usecase<QuestionsEntity, NoParams> {
  @override
  Future<Either<ApplicationError, QuestionsEntity>> call(NoParams noParams);
}
