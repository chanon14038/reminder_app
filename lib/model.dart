import 'package:equatable/equatable.dart';

class LastTimeItem extends Equatable {
  final int id;
  final String tasks;
  final int cycleDays;
  final DateTime? lastAction;

  const LastTimeItem(this.id, this.tasks, this.cycleDays, this.lastAction);

  @override
  List<Object?> get props => [id, lastAction];
}
