import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'competitions.dart';
import 'refery.dart';
import 'team.dart';
import 'score.dart';

class Match extends Equatable {
  final int id;
  final String utcDate;
  final String status;
  final String statage;
  final String group;
  final String lastUpdated;
  final Team homeTeam;
  final Team awayTeam;
  final Competitions competition;
  final String venue;
  final Score score;
  final List<Refery> referees;

  Match({
    @required this.id,
    @required this.utcDate,
    @required this.status,
    @required this.statage,
    @required this.group,
    @required this.lastUpdated,
    @required this.homeTeam,
    @required this.awayTeam,
    @required this.competition,
    @required this.venue,
    @required this.score,
    @required this.referees,
  });

  @override
  List<Object> get props => [
        id,
        utcDate,
        status,
        statage,
        group,
        lastUpdated,
        homeTeam,
        awayTeam,
        competition,
        venue,
        score,
        referees,
      ];
}
