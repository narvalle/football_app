import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'time_match.dart';

class Score extends Equatable {
  final String winner;
  final String duration;
  final TimeMatch fullTime;
  final TimeMatch halfTime;
  final TimeMatch extraTime;
  final TimeMatch penalties;

  Score({
    @required this.winner,
    @required this.duration,
    @required this.fullTime,
    @required this.halfTime,
    @required this.extraTime,
    @required this.penalties,
  });

  @override
  List<Object> get props => [
    winner,
    duration,
    fullTime,
    halfTime,
    extraTime,
    penalties,
  ];
}