import 'package:equatable/equatable.dart';

class LastTimeItem extends Equatable {
  int id;
  String tasks;
  int cycleDays;
  bool isComplete;
  DateTime? lastSubmit;
  DateTime? dueDate;

  LastTimeItem({
    required this.id,
    required this.tasks,
    required this.cycleDays,
    this.isComplete = false,
    this.lastSubmit,
  }) {
    dueDate = lastSubmit?.add(Duration(days: cycleDays));
  }

  void markAsSubmitted() {
    isComplete = true;
    lastSubmit = DateTime.now();
    dueDate = lastSubmit?.add(Duration(days: cycleDays));
  }

  bool get isLate => dueDate != null && DateTime.now().isAfter(dueDate!);

  @override
  List<Object?> get props => [id, tasks, cycleDays, isComplete, lastSubmit, dueDate];
}
