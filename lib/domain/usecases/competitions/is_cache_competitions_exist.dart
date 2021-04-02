import 'package:dartz/dartz.dart';
import 'package:football_app/core/error/failures.dart';
import 'package:football_app/core/usecases/usecase.dart';
import 'package:football_app/domain/repositories/competitions_repository.dart';

class IsCacheCompetitionsExist implements UseCase<bool, NoParams> {
  final CompetitionsRepository repository;

  IsCacheCompetitionsExist(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async =>
      await repository.isCacheCompetitionsExist();
}
