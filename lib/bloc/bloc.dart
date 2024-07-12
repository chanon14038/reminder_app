import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/bloc/event.dart';
import 'package:reminder_app/bloc/state.dart';
import 'package:reminder_app/repo.dart';

class LastTimeBloc extends Bloc<LastTimeEvent, LastTimeState> {
  final LastTimeRepository repository;
  LastTimeBloc(this.repository) : super(LoadingState()) {
    on<LoadEvent>(_onLoaded);
  }

  _onLoaded(LoadEvent event, Emitter<LastTimeState> emit) async {
    final items = await repository.load();
    emit(ReadyState(items: items));
  }
}
