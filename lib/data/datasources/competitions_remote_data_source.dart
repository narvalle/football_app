import 'package:football_app/data/models/competitions_model.dart';
import 'package:meta/meta.dart';

import '../../core/utils/http_manager.dart';
import '../../domain/entities/competitions.dart';

abstract class CompetitionsRemoteDataSource {
  /// Calls the {base_url}/competitions/{id} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<Competitions> getCompetitionFromId(int id);
}

const String _PATH = 'competitions';

class CompetitionsRemoteDataSourceImpl extends CompetitionsRemoteDataSource {
  final HttpManager httpManager;

  CompetitionsRemoteDataSourceImpl({@required this.httpManager});

  @override
  Future<Competitions> getCompetitionFromId(int id) async =>
      CompetitionsModel.fromJsonMap(
        await httpManager.get(
          path: '$_PATH/$id',
        ),
      );
}
