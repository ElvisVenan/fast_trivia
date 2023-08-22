import 'package:equatable/equatable.dart';

import '../../entities/questionnaires_entities/questions_enitity.dart';

class ArgsParams extends Equatable {
  final int? correctAnswersCount;
  final List<int>? selectedQuestions;
  final List<QuestionsEntity>? correctQuestions;
  final int? id;

  const ArgsParams({
    this.correctAnswersCount,
    this.selectedQuestions,
    this.correctQuestions,
    this.id,
  });

  @override
  List<Object?> get props => [
    correctAnswersCount,
    selectedQuestions,
    correctQuestions,
  ];
}
