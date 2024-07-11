import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/bloc/event.dart';
import 'package:reminder_app/bloc/state.dart';

class LastTimeBloc extends Bloc<LastTimeEvent, LastTimeState> {
  LastTimeBloc() : super(LoadingState());
}
