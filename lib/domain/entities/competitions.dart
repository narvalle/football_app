import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'season.dart';

class Competitions extends Equatable {
  final int id;
  final String name;
  final String area;
  final Season season;

  Competitions({
    @required this.id,
    @required this.name,
    @required this.season,
    @required this.area,
  });

  @override
  List<Object> get props => [
        id,
        name,
        season,
        area,
      ];
}
