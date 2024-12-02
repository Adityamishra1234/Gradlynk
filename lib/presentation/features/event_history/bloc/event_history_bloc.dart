import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/screen/test/stage_profilemodule.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
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
    emit(state.copyWith(status: Status.loading));
    var res =
        await api.getEventHistoryList(Get.find<BaseController>().model1.id!);

    int dataList = res['data'].length;
    if (dataList == 0) {
      getToast(SnackBarConstants.eventHistory);
      Get.back();
      return;
    }
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
          userID: Get.find<BaseController>().model1.id.toString(),
          eventID: id.toString());
    } else {
      endPoint = getEventTrackingDetails(
          userID: Get.find<BaseController>().model1.id.toString(),
          eventID: listOfeventHistoryCode[0].toString());
    }

    var res = await api.getEventHistoryData(endPoint);

    List<dynamic> rawStudentData = res['student_time_line'];

    int dataListLength = res['student_time_line'].length;

    print(rawStudentData);

    // if (rawStudentData.length == 0) {
    //   eventHistoryStudentTimeline = [SizedBox.shrink()];

    //   emit(state.copyWith(
    //       status: Status.loaded,
    //       nameListOfEventHistory: listOfeventHistoryName,
    //       eventHistoryTimelineWidget: eventHistoryStudentTimeline,
    //       nameOfEvent: listOfeventHistoryName[event.eventIDIndex]));
    //   return;
    // }

    // print(rawStudentData[0]['user_name']);

    var name = res['events_data']["campaign_name"];

    var num = name.toString().split(' - ')[0];

    print(num);

    List listOfEventAttended = [];
    // rawStudentData.add({
    //   "user_name": "Start Time",
    //   "start_time": " ${res["events_data"]["event_start_time"]} "
    // });
    bool isInitialSetepperFirst = false;

    if (res["events_data"]["event_end_time"] == null && dataListLength == 0) {
      isInitialSetepperFirst = true;
    }

    eventHistoryStudentTimeline = [];
    eventHistoryStudentTimeline.add(
        CustomStepper(
      iconColor: ThemeConstants.bluecolor,
      backIconColor: ThemeConstants.lightblueColor,
      text: "Start Time",
      text2: "${res["events_data"]["event_start_time"]}",
      count: 1,
      count1: 1,
      last: true,
      first: isInitialSetepperFirst,
    ));

    for (var i = 0; i < dataListLength; i++) {
      if (i != dataListLength - 1) {
        eventHistoryStudentTimeline.add(CustomStepper(
          iconColor: ThemeConstants.bluecolor,
          backIconColor: ThemeConstants.lightblueColor,
          text: "${rawStudentData[i]['user_name']}",
          text2: "${rawStudentData[i]['start_time']}",
          count: 1,
          count1: i + 2,
          last: true,
          first: false,
        ));
      } else {
        if (res["events_data"]["event_end_time"] == null) {
          eventHistoryStudentTimeline.add(CustomStepper(
            iconColor: ThemeConstants.bluecolor,
            backIconColor: ThemeConstants.lightblueColor,
            text: "${rawStudentData[i]['user_name']}",
            text2: "${rawStudentData[i]['start_time']}",
            count: 1,
            count1: i + 2,
            last: true,
            first: true,
          ));
        }
      }
      eventHistoryStudentTimeline.add(CustomStepper(
        iconColor: ThemeConstants.bluecolor,
        backIconColor: ThemeConstants.lightblueColor,
        text: "${rawStudentData[i]['user_name']}",
        text2: "${rawStudentData[i]['start_time']}",
        count: 1,
        count1: i + 2,
        last: true,
        first: false,
      ));
      eventHistoryStudentTimeline.add(CustomStepper(
        iconColor: ThemeConstants.bluecolor,
        backIconColor: ThemeConstants.lightblueColor,
        text: "${rawStudentData[i]['user_name']}",
        text2: "${rawStudentData[i]['start_time']}",
        count: 1,
        count1: i + 2,
        last: true,
        first: false,
      ));
      eventHistoryStudentTimeline.add(CustomStepper(
        iconColor: ThemeConstants.bluecolor,
        backIconColor: ThemeConstants.lightblueColor,
        text: "${rawStudentData[i]['user_name']}",
        text2: "${rawStudentData[i]['start_time']}",
        count: 1,
        count1: i + 2,
        last: true,
        first: false,
      ));
      eventHistoryStudentTimeline.add(CustomStepper(
        iconColor: ThemeConstants.bluecolor,
        backIconColor: ThemeConstants.lightblueColor,
        text: "${rawStudentData[i]['user_name']}",
        text2: "${rawStudentData[i]['start_time']}",
        count: 1,
        count1: i + 2,
        last: true,
        first: false,
      ));
      eventHistoryStudentTimeline.add(CustomStepper(
        iconColor: ThemeConstants.bluecolor,
        backIconColor: ThemeConstants.lightblueColor,
        text: "${rawStudentData[i]['user_name']}",
        text2: "${rawStudentData[i]['start_time']}",
        count: 1,
        count1: i + 2,
        last: true,
        first: false,
      ));
      eventHistoryStudentTimeline.add(CustomStepper(
        iconColor: ThemeConstants.bluecolor,
        backIconColor: ThemeConstants.lightblueColor,
        text: "${rawStudentData[i]['user_name']}",
        text2: "${rawStudentData[i]['start_time']}",
        count: 1,
        count1: i + 2,
        last: true,
        first: false,
      ));
      eventHistoryStudentTimeline.add(CustomStepper(
        iconColor: ThemeConstants.bluecolor,
        backIconColor: ThemeConstants.lightblueColor,
        text: "${rawStudentData[i]['user_name']}",
        text2: "${rawStudentData[i]['start_time']}",
        count: 1,
        count1: i + 2,
        last: true,
        first: false,
      ));
      eventHistoryStudentTimeline.add(CustomStepper(
        iconColor: ThemeConstants.bluecolor,
        backIconColor: ThemeConstants.lightblueColor,
        text: "${rawStudentData[i]['user_name']}",
        text2: "${rawStudentData[i]['start_time']}",
        count: 1,
        count1: i + 2,
        last: true,
        first: false,
      ));
      eventHistoryStudentTimeline.add(CustomStepper(
        iconColor: ThemeConstants.bluecolor,
        backIconColor: ThemeConstants.lightblueColor,
        text: "${rawStudentData[i]['user_name']}",
        text2: "${rawStudentData[i]['start_time']}",
        count: 1,
        count1: i + 2,
        last: true,
        first: false,
      ));

      // listOfEventAttended.add(res['data'][i]);

      // var data = listOfEventAttended[i]['campaign_name'];

      // var num = data.toString().split(' - ')[0];

      // print(num);

      // listOfeventHistoryName.add(num);

      // listOfeventHistoryCode.add(listOfEventAttended[i]['event_id']);
      // print(res['data'][i]);

      // emit(EventHistoryFetchedState(
      //     listOfeventHistoryName, eventHistoryStudentTimeline, num));
    }

    // if (dataListLength == 0) {
    //   dataListLength = 1;
    // }
    if (res["events_data"]["event_end_time"] != null) {
      eventHistoryStudentTimeline.add(CustomStepper(
        iconColor: ThemeConstants.bluecolor,
        backIconColor: ThemeConstants.lightblueColor,
        text: "End Time",
        text2: "${res["events_data"]["event_end_time"]}",
        count: dataListLength + 1,
        count1: dataListLength + 2,
        last: true,
        first: true,
      ));
    }
    print(res["events_data"]["event_end_time"]);

    emit(state.copyWith(
        status: Status.loaded,
        eventId: event.eventIDIndex,
        nameListOfEventHistory: listOfeventHistoryName,
        eventHistoryTimelineWidget: eventHistoryStudentTimeline,
        nameOfEvent: num));
  }

  callBackOfSelectionFrom({index, listOfName, listOfCode}) {
    var code = listOfCode[index];
    var name = listOfName[index];

    return [code, name];
  }
}
