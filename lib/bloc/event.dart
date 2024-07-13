import 'package:equatable/equatable.dart';
import 'package:reminder_app/model.dart';

abstract class ReminderEvent extends Equatable {
  const ReminderEvent();

  @override
  List<Object> get props => [];
}

class AddReminder extends ReminderEvent {
  final LastTimeItem reminder;

  const AddReminder(this.reminder);

  @override
  List<Object> get props => [reminder];
}

class UpdateReminder extends ReminderEvent {
  final LastTimeItem reminder;

  const UpdateReminder(this.reminder);

  @override
  List<Object> get props => [reminder];
}

class DeleteReminder extends ReminderEvent {
  final int id;

  const DeleteReminder(this.id);

  @override
  List<Object> get props => [id];
}

class MarkAsSubmitted extends ReminderEvent {
  final int id;

  const MarkAsSubmitted(this.id);

  @override
  List<Object> get props => [id];
}

class MarkAsComplete extends ReminderEvent {
  final int id;

  const MarkAsComplete(this.id);

  @override
  List<Object> get props => [id];
}


class CheckLateReminders extends ReminderEvent {}




