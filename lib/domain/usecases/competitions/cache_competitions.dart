import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/competitions.dart';
import '../../repositories/competitions_repository.dart';

class CacheCompetitions implements UseCase<List<Competitions>, NoParams> {
  final CompetitionsRepository repository;

  CacheCompetitions(this.repository);

  @override
  Future<Either<Failure, List<Competitions>>> call(NoParams params) async =>
      await repository.cacheCompetitions();
}
