import 'package:fast_trivia/feature/domain/entities/questionnaires_entities/questions_enitity.dart';

class QuestionnaireEntity {

  final int id;
  final String title;
  final List<QuestionsEntity> questions;

  QuestionnaireEntity({
    required this.id,
    required this.title,
    required this.questions,
  });

}
