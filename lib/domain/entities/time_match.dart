import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class TimeMatch extends Equatable {
  final int homeTeam;
  final int awayTeam;

  TimeMatch({
    @required this.homeTeam,
    @required this.awayTeam,
  });

  @override
  List<Object> get props => [
    homeTeam,
    awayTeam,
  ];
}