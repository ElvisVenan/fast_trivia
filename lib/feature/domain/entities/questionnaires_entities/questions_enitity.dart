import 'options_entity.dart';

class QuestionsEntity {

  final int id;
  final String title;
  final String question;
  final int answer;
  final List<OptionsEntity> options;

  QuestionsEntity({
    required this.id,
    required this.title,
    required this.question,
    required this.answer,
    required this.options,
  });

}
