import 'package:equatable/equatable.dart';
import 'package:reminder_app/model.dart';

class ReminderState extends Equatable {
  final List<LastTimeItem> reminders;

  const ReminderState(this.reminders);

  @override
  List<Object> get props => [reminders];
}
