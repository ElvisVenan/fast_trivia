import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/usecase/usecase.dart';

import '../../../../feature/domain/usecases/questions_usecases/get_questions_usecase.dart';

part 'questions_controller.g.dart';

class QuestionsController = _QuestionsController with _$QuestionsController;

abstract class _QuestionsController with Store {

  @observable
  String question = '';

  @action
  Future getQuestions() async {
    final getQuestions = Modular.get<GetQuestionsUsecase>();

    final result = await getQuestions
        .call(NoParams());

    result.fold((error) => error.friendlyMessage, (success) async {
      question = success.question;
      return success;
    });

  }

}
