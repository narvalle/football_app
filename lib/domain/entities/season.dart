import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Season extends Equatable {
  final int id;
  final String startDate;
  final String endDate;
  final int currentMatchDay;

  Season({
    @required this.id,
    @required this.startDate,
    @required this.endDate,
    @required this.currentMatchDay,
  });

  @override
  List<Object> get props => [
        id,
        startDate,
        endDate,
        currentMatchDay,
      ];
}
