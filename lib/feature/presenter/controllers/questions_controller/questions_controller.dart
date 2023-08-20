import 'package:fast_trivia/feature/domain/entities/questionnaires_entities/options_entity.dart';
import 'package:fast_trivia/feature/domain/entities/questionnaires_entities/questions_enitity.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/usecase/usecase.dart';

import '../../../../feature/domain/usecases/questions_usecases/get_questions_usecase.dart';

part 'questions_controller.g.dart';

class QuestionsController = _QuestionsController with _$QuestionsController;

abstract class _QuestionsController with Store {

  @observable
  int id = 0;

  @observable
  String title = '';

  @observable
  List<QuestionsEntity> questions = [];

  @observable
  List<OptionsEntity> options = [];


  @action
  Future getQuestions() async {
    final getQuestions = Modular.get<GetQuestionsUsecase>();

    final result = await getQuestions
        .call(NoParams());

    result.fold((error) => error.friendlyMessage, (success) async {
      id = success.questionnaire.id;
      title = success.questionnaire.title;
      questions = success.questionnaire.questions;
      options = success.questionnaire.questions[0].options;
      return success;
    });

  }

}
