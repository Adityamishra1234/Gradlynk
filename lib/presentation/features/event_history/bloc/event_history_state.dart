part of 'event_history_bloc.dart';

@immutable
abstract class EventHistoryState {}

class EventHistoryInitial extends EventHistoryState {}

class EventHistoryActionState extends EventHistoryState {}

class EventHistoryChangeEventState extends EventHistoryState {}
