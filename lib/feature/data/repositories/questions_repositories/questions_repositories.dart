import 'package:dartz/dartz.dart';

import '../../../../core/errors/application_error.dart';
import '../../../../core/errors/generic_error.dart';
import '../../../../core/usecase/usecase.dart';

import '../../../../feature/domain/entities/questions_entities/questions_entity.dart';
import '../../../../feature/data/datasources/questions_datasources/questions_datasources.dart';
import '../../../../feature/domain/repositories/questions_repositories/questions_repositories.dart';

class QuestionsRepositoriesImpl implements QuestionsRepositories {
  final QuestionsDataSources datasource;

  QuestionsRepositoriesImpl(this.datasource);

  @override
  Future<Either<ApplicationError, QuestionsEntity>> getQuestions(NoParams noParams) async {
    try {
      final result = await datasource.getQuestions(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
        fingerprint: '$QuestionsRepositoriesImpl.getQuestions',
        additionalInfo: stacktrace.toString(),
      ));
    }
  }

}
