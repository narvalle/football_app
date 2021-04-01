import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'team.dart';

class Table extends Equatable {
  final int position;
  final Team team;
  final int playedGames;
  final int won;
  final int draw;
  final int lost;
  final int points;
  final int goalsFor;
  final int goalsAgainst;
  final int goalDifference;

  Table({
    @required this.position,
    @required this.team,
    @required this.playedGames,
    @required this.won,
    @required this.draw,
    @required this.lost,
    @required this.points,
    @required this.goalsFor,
    @required this.goalsAgainst,
    @required this.goalDifference,
  });

  @override
  List<Object> get props => [
        position,
        team,
        playedGames,
        won,
        draw,
        lost,
        points,
        goalsFor,
        goalsAgainst,
        goalDifference,
      ];
}
