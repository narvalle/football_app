import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:football_app/core/error/failures.dart';
import 'package:football_app/core/usecases/usecase.dart';
import 'package:football_app/domain/entities/competitions.dart';
import 'package:football_app/domain/repositories/competitions_repository.dart';
import 'package:meta/meta.dart';

class SetCacheCompetitions implements UseCase<bool, Params> {
  final CompetitionsRepository repository;

  SetCacheCompetitions(this.repository);

  @override
  Future<Either<Failure, bool>> call(Params params) async =>
      await repository.setCacheCompetitions(params.competitions);
}

class Params extends Equatable {
  final List<Competitions> competitions;

  Params({@required this.competitions});

  @override
  List<Object> get props => [competitions];
}
