import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'event_history_event.dart';
part 'event_history_state.dart';

class EventHistoryBloc extends Bloc<EventHistoryEvent, EventHistoryState> {
  EventHistoryBloc() : super(EventHistoryInitial()) {
    on<EventHistoryEvent>(eventHistoryInitialEvent);
  }

  eventHistoryInitialEvent(event, emit) {}
}
