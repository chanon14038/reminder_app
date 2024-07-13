import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/bloc/bloc_export.dart';
import 'package:reminder_app/model.dart';
import 'package:reminder_app/widgers/complete.dart';

class ReminderPage extends StatelessWidget {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _cycleDaysController = TextEditingController();

  ReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reminder App')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _taskController,
              decoration: InputDecoration(labelText: 'Task'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _cycleDaysController,
              decoration: InputDecoration(labelText: 'Cycle Days'),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final task = _taskController.text;
              final cycleDays = int.tryParse(_cycleDaysController.text) ?? 0;

              final reminder = LastTimeItem(
                id: DateTime.now().millisecondsSinceEpoch,
                tasks: task,
                cycleDays: cycleDays,
                lastSubmit: DateTime.now(),
              );

              context.read<ReminderBloc>().add(AddReminder(reminder));
            },
            child: Text('Add Reminder'),
          ),
          Expanded(
            child: BlocBuilder<ReminderBloc, ReminderState>(
              builder: (context, state) {
                final reminders = state.reminders;
                final lateReminders = reminders
                    .where(
                        (reminder) => reminder.isLate && !reminder.isComplete)
                    .toList();
                final upcomingReminders = reminders
                    .where(
                        (reminder) => !reminder.isLate && !reminder.isComplete)
                    .toList();

                return ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Upcoming Reminders',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    ...upcomingReminders.map((reminder) {
                      return ListTile(
                        title: Text(reminder.tasks),
                        subtitle: Text(
                            'Cycle Days: ${reminder.cycleDays}, Due Date: ${reminder.dueDate ?? 'N/A'}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.check),
                              onPressed: () {
                                context
                                    .read<ReminderBloc>()
                                    .add(MarkAsComplete(reminder.id));
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                context
                                    .read<ReminderBloc>()
                                    .add(DeleteReminder(reminder.id));
                              },
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Late Reminders',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    ...lateReminders.map((reminder) {
                      return ListTile(
                        title: Text(reminder.tasks),
                        subtitle: Text(
                            'Cycle Days: ${reminder.cycleDays}, Due Date: ${reminder.dueDate ?? 'N/A'}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.check),
                              onPressed: () {
                                context
                                    .read<ReminderBloc>()
                                    .add(MarkAsComplete(reminder.id));
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                context
                                    .read<ReminderBloc>()
                                    .add(DeleteReminder(reminder.id));
                              },
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              debugPrint('Navigating to CompletedTasksPage');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CompletedTasksPage()),
              );
            },
            child: Text('View Completed Tasks'),
          ),
        ],
      ),
    );
  }
}
