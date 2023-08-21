import 'package:equatable/equatable.dart';

class ArgsParams extends Equatable {
  final dynamic firstArgs;
  final dynamic secondArgs;
  final dynamic thirdArgs;

  const ArgsParams({
    this.firstArgs,
    this.secondArgs,
    this.thirdArgs,
  });

  @override
  List<Object?> get props => [
    firstArgs,
    secondArgs,
    thirdArgs,
  ];
}
