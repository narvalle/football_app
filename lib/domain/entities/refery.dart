import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Refery extends Equatable {
  final int id;
  final String name;
  final String nationality;

  Refery({
    @required this.id,
    @required this.name,
    @required this.nationality,
  });

  @override
  List<Object> get props => [
    id,
    name,
    name,
  ];
}