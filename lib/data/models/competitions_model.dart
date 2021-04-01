import 'package:meta/meta.dart';

import '../../domain/entities/season.dart';
import '../../domain/entities/competitions.dart';
import 'season_model.dart';

class CompetitionsModel extends Competitions {
  CompetitionsModel({
    @required int id,
    @required String name,
    @required Season season,
    @required String area,
  }) : super(
          id: id,
          name: name,
          season: season,
          area: area,
        );

  CompetitionsModel.fromJsonMap(Map<String, dynamic> map) : super(
    id: map['id'],
    name: map['name'],
    season: SeasonModel.fromJsonMap(map['season']),
    area: map['area'],
  );
}
