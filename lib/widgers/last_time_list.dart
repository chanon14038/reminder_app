import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/bloc/bloc_export.dart';
import 'package:reminder_app/model.dart';


class ReminderPage extends StatelessWidget {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _cycleDaysController = TextEditingController();

  ReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reminder App')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _taskController,
              decoration: const InputDecoration(labelText: 'Task'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _cycleDaysController,
              decoration: const InputDecoration(labelText: 'Cycle Days'),
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
              );

              context.read<ReminderBloc>().add(AddReminder(reminder));
            },
            child: const Text('Add Reminder'),
          ),
          Expanded(
            child: BlocBuilder<ReminderBloc, ReminderState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.reminders.length,
                  itemBuilder: (context, index) {
                    final reminder = state.reminders[index];
                    return ListTile(
                      title: Text(reminder.tasks),
                      subtitle: Text(
                          'Cycle Days: ${reminder.cycleDays}, Last Submit: ${reminder.lastSubmit ?? 'N/A'}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context.read<ReminderBloc>().add(DeleteReminder(reminder.id));
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}