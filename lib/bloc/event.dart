sealed class LastTimeEvent {}

class LoadEvent extends LastTimeEvent {}

class LastTimeActionEvent extends LastTimeEvent {
  final int id;
  final DateTime lastAction;

  LastTimeActionEvent(this.id, this.lastAction);
}

class SearchEvent extends LastTimeEvent {
  final String key;
  SearchEvent(this.key);
}

class SearchClearEvent extends LastTimeEvent {
}
