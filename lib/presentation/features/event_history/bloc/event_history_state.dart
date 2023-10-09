part of 'event_history_bloc.dart';

@immutable
abstract class EventHistoryState extends Equatable {}

enum Status {
  initial,
  loading,
  loaded,
  error,
}

class EventHistoryInitial extends EventHistoryState {
  final Status status;
  final List<String> nameListOfEventHistory;
  final List<Widget> eventHistoryTimelineWidget;
  final String nameOfEvent;
  final int eventId;

  EventHistoryInitial(
      {required this.status,
      required this.eventId,
      required this.nameListOfEventHistory,
      required this.eventHistoryTimelineWidget,
      required this.nameOfEvent});

  static EventHistoryInitial initial() => EventHistoryInitial(
      status: Status.loading,
      eventId: 0,
      nameListOfEventHistory: [],
      eventHistoryTimelineWidget: [],
      nameOfEvent: '');

  EventHistoryInitial copyWith(
      {Status? status,
      List<String>? nameListOfEventHistory,
      List<Widget>? eventHistoryTimelineWidget,
      int? eventId,
      String? nameOfEvent}) {
    return EventHistoryInitial(
        eventId: eventId ?? this.eventId,
        status: status ?? this.status,
        nameListOfEventHistory:
            nameListOfEventHistory ?? this.nameListOfEventHistory,
        eventHistoryTimelineWidget:
            eventHistoryTimelineWidget ?? this.eventHistoryTimelineWidget,
        nameOfEvent: nameOfEvent ?? this.nameOfEvent);
  }

  @override
  List<Object?> get props =>
      [status, nameListOfEventHistory, eventHistoryTimelineWidget, nameOfEvent];
}

class EventHistoryActionState extends EventHistoryState {
  @override
  List<Object?> get props => [];
}

class EventHistoryChangeEventState extends EventHistoryState {
  @override
  List<Object?> get props => [];
}

class EventHistoryFetchedState extends EventHistoryState {
  final List<String> nameListOfEventHistory;
  final List<Widget> eventHistoryTimelineWidget;
  final String nameOfEvent;

  EventHistoryFetchedState(this.nameListOfEventHistory,
      this.eventHistoryTimelineWidget, this.nameOfEvent);

  @override
  List<Object?> get props =>
      [nameListOfEventHistory, eventHistoryTimelineWidget, nameOfEvent];
}






// class EventHistoryWidgetState extends EventHistoryState {
//   final List<Widget> eventHistoryTimelineWidget;
//   final String nameOfEvent;

//   EventHistoryWidgetState(this.eventHistoryTimelineWidget, this.nameOfEvent);
// }
