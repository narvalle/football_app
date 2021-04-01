import 'package:meta/meta.dart';

import '../../domain/entities/season.dart';

class SeasonModel extends Season {
  SeasonModel({
    @required int id,
    @required String startDate,
    @required String endDate,
    @required int currentMatchDay,
  }) : super(
          id: id,
          startDate: startDate,
          endDate: endDate,
          currentMatchDay: currentMatchDay,
        );

  SeasonModel.fromJsonMap(Map<String, dynamic> map)
      : super(
          id: map['id'],
          startDate: map['startDate'],
          endDate: map['endDate'],
          currentMatchDay: map['currentMatchDay'],
        );
}
