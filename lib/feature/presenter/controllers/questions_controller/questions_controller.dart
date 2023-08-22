import 'package:fast_trivia/feature/domain/entities/questionnaires_entities/questionnaire_entity.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/usecase/usecase.dart';

import '../../../../feature/domain/entities/questionnaires_entities/options_entity.dart';
import '../../../../feature/domain/entities/questionnaires_entities/questions_enitity.dart';

import '../../../../feature/domain/usecases/questions_usecases/get_questions_usecase.dart';

part 'questions_controller.g.dart';

class QuestionsController = _QuestionsController with _$QuestionsController;

abstract class _QuestionsController with Store {

  @observable
  int idx = 0;

  @observable
  String incorrectAnswers = "";

  @observable
  int selectedIndex = - 1;

  @observable
  int changeQuestionInt = 0;

  @observable
  List<int> changeQuestionList = [];

  @observable
  int userResponse = 1;

  @observable
  int correctAnswers = 0;

  @observable
  int id = 0;

  @observable
  String title = '';

  @observable
  List<QuestionsEntity> questions = [QuestionsEntity(id: 0, title: "", question: "", answer: 0, options: [])];

  @observable
  List<OptionsEntity> options = [];

  @observable
  QuestionnaireEntity? questionnaire;

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
      questionnaire = success.questionnaire;
      return success;
    });

  }

  @action
  int getSelectedIndex (int index) {
    return selectedIndex = index;
  }

  @action
   changeQuestion () {

    if(questions.length - 1 > changeQuestionInt){
      changeQuestionInt ++;
    } else{
      changeQuestionInt = 1;
    }
  }

  @action
  calculateCorrectAnswers () {

    if(questions[idx].answer - 1 == userResponse){
      correctAnswers ++;
    }
    idx ++;
    print(" resposta $correctAnswers");
    print("index $idx");
  }

}
