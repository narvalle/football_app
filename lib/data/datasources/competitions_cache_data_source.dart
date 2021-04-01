import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../core/error/exceptions.dart';
import '../models/competitions_model.dart';
import '../../domain/entities/competitions.dart';

abstract class CompetitionsCacheDataSource {
  Future<List<Competitions>> getCacheCompetitions();

  Future<bool> cacheCompetition(List<Competitions> competitions);

  Future<bool> isCacheCompetitionsExist();
}

const _CACHE_COMPETITIONS_KEY = 'competitions';

class CompetitionsCacheDataSourceImpl implements CompetitionsCacheDataSource {
  final SharedPreferences sharedPreferences;

  CompetitionsCacheDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<bool> cacheCompetition(List<Competitions> competitions) =>
      sharedPreferences.setString(
        _CACHE_COMPETITIONS_KEY,
        json.encode(
          competitions
              .map<Map<String, dynamic>>(
                (i) => (i as CompetitionsModel).toJsonMap(),
              )
              .toList(),
        ),
      );

  @override
  Future<List<Competitions>> getCacheCompetitions() {
    final cache = sharedPreferences.getString(_CACHE_COMPETITIONS_KEY);
    if (cache != null) {
      return Future<List<Competitions>>.value(
        (json.decode(cache) as List)
            .map<Competitions>(
              (i) => CompetitionsModel.fromJsonMap(i),
            )
            .toList(),
      );
    } else {
      throw CacheException();
    }
  }

  @override
  Future<bool> isCacheCompetitionsExist() => Future<bool>.value(
        sharedPreferences.containsKey(_CACHE_COMPETITIONS_KEY),
      );
}
