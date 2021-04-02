import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/competitions.dart';
import '../../domain/repositories/competitions_repository.dart';
import '../datasources/competitions_cache_data_source.dart';
import '../datasources/competitions_remote_data_source.dart';

class CompetitionsRepositoryImpl implements CompetitionsRepository {
  final CompetitionsCacheDataSource cache;
  final CompetitionsRemoteDataSource remote;

  CompetitionsRepositoryImpl({
    @required this.cache,
    @required this.remote,
  });

  @override
  Future<Either<Failure, List<Competitions>>> cacheCompetitions() async {
    try {
      return Right(
        await cache.getCacheCompetitions(),
      );
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Competitions>> getCompetitionFromId(int id) async {
    try {
      return Right(
        await remote.getCompetitionFromId(id),
      );
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> isCacheCompetitionsExist() async {
    try {
      return Right(
        await cache.isCacheCompetitionsExist(),
      );
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> setCacheCompetitions(
      List<Competitions> competitions) async {
    try {
      return Right(
        await cache.cacheCompetition(competitions),
      );
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
