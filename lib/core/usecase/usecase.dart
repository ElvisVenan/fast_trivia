import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/application_error.dart';

abstract class Usecase<Output, Input> {
  Future<Either<ApplicationError, Output>> call(Input params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];

}