part of 'event_history_bloc.dart';

@immutable
abstract class EventHistoryEvent extends Equatable {}

class EventHistoryInitialEvent extends EventHistoryEvent {
  final int eventIDIndex;

  EventHistoryInitialEvent(this.eventIDIndex);
  List<Object> get props => [];
}

class EventHistoryClickEvent extends EventHistoryEvent {
  final int eventIDIndex;
  final String nameOfEvent;

  EventHistoryClickEvent(this.eventIDIndex, this.nameOfEvent);

  List<Object> get props => [eventIDIndex, nameOfEvent];
}
