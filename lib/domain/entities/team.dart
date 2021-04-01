import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Team extends Equatable {
  final int id;
  final String name;
  final String shortName;
  final String tla;
  final String clubColors;
  final String crestUrl;

  Team({
    @required this.id,
    @required this.name,
    @required this.shortName,
    @required this.tla,
    @required this.clubColors,
    @required this.crestUrl,
  });

  @override
  List<Object> get props => [
    id,
    name,
    shortName,
    tla,
    clubColors,
    crestUrl,
  ];
}
