import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../datasources/loca_configurations_data_source.dart';
import '../../domain/repositories/local_configurations_repository.dart';

class LocalConfigurationsRepositoryImpl
    implements LocalConfigurationsRepository {
  final LocalConfigurationsDataSource localDataSource;

  LocalConfigurationsRepositoryImpl({@required this.localDataSource});

  @override
  Either<Failure, String> getBaseUrl() {
    try {
      return Right(localDataSource.getBaseUrl());
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Either<Failure, String> getToken() {
    try {
      return Right(localDataSource.getToken());
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Either<Failure, String> getTokenName() {
    try {
      return Right(localDataSource.getTokenName());
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
