part of 'event_history_bloc.dart';

@immutable
abstract class EventHistoryState {}

class EventHistoryInitial extends EventHistoryState {}

class EventHistoryActionState extends EventHistoryState {}

class EventHistoryChangeEventState extends EventHistoryState {}

class EventHistoryFetchedState extends EventHistoryState {
  final List<String> nameListOfEventHistory;
  final List<Widget> eventHistoryTimelineWidget;
  final String nameOfEvent;

  EventHistoryFetchedState(this.nameListOfEventHistory,
      this.eventHistoryTimelineWidget, this.nameOfEvent);
}

// class EventHistoryWidgetState extends EventHistoryState {
//   final List<Widget> eventHistoryTimelineWidget;
//   final String nameOfEvent;

//   EventHistoryWidgetState(this.eventHistoryTimelineWidget, this.nameOfEvent);
// }
