import 'package:equatable/equatable.dart';

class LastTimeItem extends Equatable {
  final int id;
  final String tasks;
  final int cycleDays;
  bool isComplete;
  final DateTime? lastSubmit;

  LastTimeItem(
      {required this.id,
      required this.tasks,
      required this.cycleDays,
      this.isComplete = false,
      this.lastSubmit});

  @override
  List<Object?> get props => [];
}
