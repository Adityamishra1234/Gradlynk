import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/screen/test/stage_profilemodule.dart';
import 'package:studentpanel/utils/endpoint.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:equatable/equatable.dart';
part 'event_history_event.dart';
part 'event_history_state.dart';

class EventHistoryBloc extends Bloc<EventHistoryEvent, EventHistoryInitial> {
  ApiServices api = ApiServices();

  EventHistoryBloc() : super(EventHistoryInitial.initial()) {
    // on<EventHistoryEvent>(eventHistoryInitialEvent);

    on<EventHistoryInitialEvent>(eventHistoryInitialEvent);

    on<EventHistoryClickEvent>(eventHistorySelected);
  }

  List<String> listOfeventHistoryName = [];
  List listOfeventHistoryCode = [];

  eventHistoryInitialEvent(EventHistoryInitialEvent event, emit) async {
    emit(state.copyWith(status: Status.loaded));
    var res = await api.getEventHistoryList(325127);

    int dataList = res['data'].length;
    List listOfEventAttended = [];

    var nameFirst = '';

    for (var i = 0; i < dataList; i++) {
      listOfEventAttended.add(res['data'][i]);

      var data = listOfEventAttended[i]['campaign_name'];

      var num = data.toString().split(' - ')[0];

      print(num);
      if (i == 0) {
        nameFirst = num;
      }

      listOfeventHistoryName.add(num);

      listOfeventHistoryCode.add(listOfEventAttended[i]['event_id']);
      // print(res['data'][i]);
    }
    await eventHistorySelected(event, emit);

    emit(state.copyWith(
        status: Status.loaded, nameListOfEventHistory: listOfeventHistoryName));
  }

  List<Widget> eventHistoryStudentTimeline = [];

  eventHistorySelected(event, emit) async {
    var endPoint;
    if (event.eventIDIndex != 0) {
      var codeAndName = await callBackOfSelectionFrom(
          index: event.eventIDIndex,
          listOfCode: listOfeventHistoryCode,
          listOfName: listOfeventHistoryName);
      var id = codeAndName[0];

      endPoint = getEventTrackingDetails(
          userID: 325127.toString(), eventID: id.toString());
      // userID: Get.find<BaseController>().model1.id.toString(),
      // eventID: id.toString());
    } else {
      endPoint = getEventTrackingDetails(
          userID: Get.find<BaseController>().model1.id.toString(),
          eventID: listOfeventHistoryCode[0].toString());
    }

    // var res =
    //     await api.getEventHistoryList(Get.find<BaseController>().model1.id!);

    var res = await api.getEventHistoryData(endPoint);

    int dataListLength = res['student_time_line'].length;

    List<dynamic> rawStudentData = res['student_time_line'];

    print(rawStudentData);

    if (rawStudentData.length == 0) {
      eventHistoryStudentTimeline = [SizedBox.shrink()];

      emit(state.copyWith(
          status: Status.loaded,
          nameListOfEventHistory: listOfeventHistoryName,
          eventHistoryTimelineWidget: eventHistoryStudentTimeline,
          nameOfEvent: listOfeventHistoryName[event.eventIDIndex]));
      return;
    }

    print(rawStudentData[0]['user_name']);

    var name = res['events_data']["campaign_name"];

    var num = name.toString().split(' - ')[0];

    print(num);

    List listOfEventAttended = [];

    eventHistoryStudentTimeline = [];
    for (var i = 0; i < dataListLength; i++) {
      eventHistoryStudentTimeline.add(Container(
        child: Column(children: [
          CustomStepper(
            iconColor: ThemeConstants.bluecolor,
            backIconColor: ThemeConstants.lightblueColor,
            text: "${rawStudentData[i]['user_name']}",
            text2: "${rawStudentData[i]['start_time']}",
            count: 1,
            last: true,
            first: i == dataListLength - 1 ? true : false,
          ),
          // CustomAutoSizeTextMontserrat(
          //     text: '${rawStudentData[i]['user_name']}'),
          // CustomAutoSizeTextMontserrat(text: '${rawStudentData[i]}'),
        ]),
      ));

      // listOfEventAttended.add(res['data'][i]);

      // var data = listOfEventAttended[i]['campaign_name'];

      // var num = data.toString().split(' - ')[0];

      // print(num);

      // listOfeventHistoryName.add(num);

      // listOfeventHistoryCode.add(listOfEventAttended[i]['event_id']);
      // print(res['data'][i]);
      emit(state.copyWith(
          status: Status.loaded,
          nameListOfEventHistory: listOfeventHistoryName,
          eventHistoryTimelineWidget: eventHistoryStudentTimeline,
          nameOfEvent: num));
      // emit(EventHistoryFetchedState(
      //     listOfeventHistoryName, eventHistoryStudentTimeline, num));
    }
  }

  callBackOfSelectionFrom({index, listOfName, listOfCode}) {
    var code = listOfCode[index];
    var name = listOfName[index];

    return [code, name];
  }
}
