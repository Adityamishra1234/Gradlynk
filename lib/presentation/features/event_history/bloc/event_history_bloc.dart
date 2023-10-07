import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';

part 'event_history_event.dart';
part 'event_history_state.dart';

class EventHistoryBloc extends Bloc<EventHistoryEvent, EventHistoryState> {
  ApiServices api = ApiServices();

  EventHistoryBloc() : super(EventHistoryInitial()) {
    // on<EventHistoryEvent>(eventHistoryInitialEvent);

    on<EventHistoryInitialEvent>(eventHistoryInitialEvent);
  }

  List<String> listOfeventHistoryName = [];
  List listOfeventHistoryCode = [];

  eventHistoryInitialEvent(event, emit) async {
    var res =
        await api.getEventHistoryList(Get.find<BaseController>().model1.id!);

    int dataList = res['data'].length;
    List listOfEventAttended = [];

    for (var i = 0; i < dataList; i++) {
      listOfEventAttended.add(res['data'][i]);

      var data = listOfEventAttended[i]['campaign_name'];

      var num = data.toString().split(' - ')[0];

      print(num);

      listOfeventHistoryName.add(num);

      listOfeventHistoryCode.add(listOfEventAttended[i]['event_id']);
      // print(res['data'][i]);
    }

    emit(EventHistoryFetchedState(listOfeventHistoryName));
  }
}
