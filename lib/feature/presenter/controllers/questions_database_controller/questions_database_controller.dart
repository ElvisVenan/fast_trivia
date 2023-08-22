import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/database_helper/database_helper.dart';

import '../../../../feature/domain/entities/questionnaires_entities/options_entity.dart';
import '../../../../feature/domain/entities/questionnaires_entities/questions_enitity.dart';
import '../../../domain/entities/questionnaires_entities/questionnaire_entity.dart';
import '../../../domain/params/args_params/change_question_entity.dart';

part 'questions_database_controller.g.dart';

class QuestionsDatabaseController = _QuestionsDatabaseController with _$QuestionsDatabaseController;

abstract class _QuestionsDatabaseController with Store {

  @observable
  int idx = 0;

  @observable
  int changeQuestionInt = 0;

  @observable
  int userResponse = 1;

  @observable
  int correctAnswers = 0;


  @observable
  List<QuestionsEntity>? questionnaires;

  @observable
  List<QuestionnaireEntity>? questionnaire;

  @observable
  List<OptionsEntity>? optionsDatabase;

  @observable
  List<ChangeQuestionEntity>? selectedQuestions;

  @action
  changeQuestion () {
    if(questionnaires!.length - 1 > changeQuestionInt){
      changeQuestionInt ++;
    } else{
      changeQuestionInt = 0;
    }
  }

  Future<void> saveQuestions(QuestionnaireEntity questionnaire) async {
    final databaseHelper = Modular.get<DatabaseHelper>();
    await databaseHelper.initializeDatabase();
    await databaseHelper.insertQuestionnaire(questionnaire);

    final savedQuestionnaires = await databaseHelper.getQuestionnaires();

    for (final savedQuestionnaire in savedQuestionnaires) {
      print('Saved Questionnaire:');
      print('ID: ${savedQuestionnaire.id}');
      print('Title: ${savedQuestionnaire.title}');
      for (final question in savedQuestionnaire.questions) {
        print('Question:');
        print('ID: ${question.id}');
        print('Title: ${question.title}');
        print('Question: ${question.question}');
        print('Answer: ${question.answer}');
        for (final option in question.options) {
          print('Option:');
          print('ID: ${option.id}');
          print('Title: ${option.title}');
        }
      }
    }

  }

  Future<void> getQuestionsFromDatabase() async {
    final databaseHelper = Modular.get<DatabaseHelper>();
    await databaseHelper.initializeDatabase();
    questionnaires = await databaseHelper.getQuestions(1);
  }

  Future<void> getQuestionnairesFromDatabase() async {
    final databaseHelper = Modular.get<DatabaseHelper>();
    await databaseHelper.initializeDatabase();
    questionnaire = await databaseHelper.getQuestionnaires();
  }

  Future<void> getOptionsFromDatabase() async {
    final  databaseHelper = Modular.get<DatabaseHelper>();
    await databaseHelper.initializeDatabase();
    await  databaseHelper.getOptions(1);
  }

  Future<void> saveSelectedQuestions(ChangeQuestionEntity selectedQuestions) async {
    final  databaseHelper = Modular.get<DatabaseHelper>();
    await databaseHelper.initializeDatabase();
    await  databaseHelper.saveChangeQuestionEntity(selectedQuestions);
  }

  Future<void> getSelectedQuestions() async {
    final  databaseHelper = Modular.get<DatabaseHelper>();
    await databaseHelper.initializeDatabase();
    selectedQuestions = await databaseHelper.getAllChangeQuestionEntities();
  }

}
