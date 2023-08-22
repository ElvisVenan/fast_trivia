import 'package:equatable/equatable.dart';

class ChangeQuestionEntity extends Equatable {
  final int? id;
  final List<int>? selectedQuestions;

  const ChangeQuestionEntity ({
    this.id,
    this.selectedQuestions,
  });

  @override
  List<Object?> get props => [
    id,
    selectedQuestions,
  ];
}
