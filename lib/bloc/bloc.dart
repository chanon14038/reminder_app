import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/bloc/bloc_export.dart';
import 'package:reminder_app/model.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  ReminderBloc() : super(const ReminderState([])) {
    on<AddReminder>((event, emit) {
      final updatedReminders = List<LastTimeItem>.from(state.reminders)..add(event.reminder);
      debugPrint('AddReminder: ${event.reminder}');
      emit(ReminderState(updatedReminders));
    });

    on<UpdateReminder>((event, emit) {
      final updatedReminders = state.reminders.map((reminder) {
        return reminder.id == event.reminder.id ? event.reminder : reminder;
      }).toList();
      debugPrint('UpdateReminder: ${event.reminder}');
      emit(ReminderState(updatedReminders));
    });

    on<DeleteReminder>((event, emit) {
      final updatedReminders = state.reminders.where((reminder) => reminder.id != event.id).toList();
      debugPrint('DeleteReminder: ${event.id}');
      emit(ReminderState(updatedReminders));
    });

    on<MarkAsComplete>((event, emit) {
      final updatedReminders = state.reminders.map((reminder) {
        if (reminder.id == event.id) {
          reminder.isComplete = true;
          debugPrint('MarkAsComplete: ${reminder.id}');
        }
        return reminder;
      }).toList();
      emit(ReminderState(updatedReminders));
    });

    on<MarkAsSubmitted>((event, emit) {
      final updatedReminders = state.reminders.map((reminder) {
        if (reminder.id == event.id) {
          reminder.markAsSubmitted();
          debugPrint('MarkAsSubmitted: ${reminder.id}');
        }
        return reminder;
      }).toList();
      emit(ReminderState(updatedReminders));
    });

    on<CheckLateReminders>((event, emit) {
      final updatedReminders = List<LastTimeItem>.from(state.reminders);
      debugPrint('CheckLateReminders');
      emit(ReminderState(updatedReminders));
    });
  }
}
