part of 'event_history_bloc.dart';

@immutable
abstract class EventHistoryEvent extends Equatable {}

class EventHistoryInitialEvent extends EventHistoryEvent {
  final int eventId;

  EventHistoryInitialEvent(this.eventId);
  List<Object> get props => [];
}

class EventHistoryClickEvent extends EventHistoryEvent {
  final int eventId;
  final String nameOfEvent;

  EventHistoryClickEvent(this.eventId, this.nameOfEvent);

  List<Object> get props => [eventId, nameOfEvent];
}
