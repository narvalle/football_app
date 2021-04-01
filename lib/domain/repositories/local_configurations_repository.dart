import '../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class LocalConfigurationsRepository {
  Either<Failure, String> getBaseUrl();
  Either<Failure, String> getTokenName();
  Either<Failure, String> getToken();
}
