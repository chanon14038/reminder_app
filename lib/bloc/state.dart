import 'package:reminder_app/model.dart';

sealed class LastTimeState {
  final List<LastTimeItem> items;
  LastTimeState({required this.items});
}

const List<LastTimeItem> empty = [];

class LoadingState extends LastTimeState {
  LoadingState() : super(items: empty);
}

class ReadyState extends LastTimeState {
  ReadyState({required super.items});
}

class SearchState extends LastTimeState {
  SearchState({required super.items});
}
