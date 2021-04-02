import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/competitions.dart';
import '../../repositories/competitions_repository.dart';

class GetCompetitionFromId implements UseCase<Competitions, Params> {
  final CompetitionsRepository repository;

  GetCompetitionFromId(this.repository);

  @override
  Future<Either<Failure, Competitions>> call(Params params) async =>
      await repository.getCompetitionFromId(params.id);
}

class Params extends Equatable {
  final int id;

  Params({@required this.id});

  @override
  List<Object> get props => [id];
}
