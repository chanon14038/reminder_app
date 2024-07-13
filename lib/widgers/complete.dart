import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/bloc/bloc_export.dart';

class CompletedTasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Completed Tasks'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            debugPrint('Navigating back from CompletedTasksPage');
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocBuilder<ReminderBloc, ReminderState>(
        builder: (context, state) {
          final completedReminders =
              state.reminders.where((reminder) => reminder.isComplete).toList();

          debugPrint('Completed tasks count: ${completedReminders.length}');

          if (completedReminders.isEmpty) {
            return Center(
              child: Text('No completed tasks.'),
            );
          }

          return ListView.builder(
            itemCount: completedReminders.length,
            itemBuilder: (context, index) {
              final reminder = completedReminders[index];
              return ListTile(
                title: Text(reminder.tasks),
                subtitle: Text('Cycle Days: ${reminder.cycleDays}'),
              );
            },
          );
        },
      ),
    );
  }
}
