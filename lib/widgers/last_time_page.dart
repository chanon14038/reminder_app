import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/bloc/app_bloc.dart';
import 'package:reminder_app/widgers/last_time_list.dart';

class LastTimePage extends StatelessWidget {
  const LastTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LastTimeBloc, LastTimeState>(builder: (context, state) {
      return state is LoadingState
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const LastTimeList();
    });
  }
}
