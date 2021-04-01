import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../domain/entities/competitions.dart';

abstract class CompetitionsRepository{
  Future<Either<Failure, Competitions>> getCompetitionFromId(int id);
  Future<Either<Failure, List<Competitions>>> cacheCompetitions();
  Future<Either<Failure, bool>> isCacheCompetitionsExist();
}