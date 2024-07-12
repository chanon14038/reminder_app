import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/bloc/app_bloc.dart';
import 'package:reminder_app/mock_repo.dart';
import 'package:reminder_app/widgers/last_time_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LastTimeBloc>(create: (context) {
            final bloc = LastTimeBloc(LastTimeMockRepository());
            bloc.add(LoadEvent());
            return bloc;
          }),
        ],
        child: MaterialApp(
            home: Scaffold(
          appBar: AppBar(
            title: const Text('App Reminder'),
          ),
          body: const Center(
            child: LastTimePage(),
          ),
        )));
  }
}
