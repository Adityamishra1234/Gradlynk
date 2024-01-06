import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:studentpanel/binding/serviceIniitial.dart';
import 'package:studentpanel/data/models/saveVisitSheetDeskResponse.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/controllers/dashboardcontroller.dart';
import 'package:get/get.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class EventDeskListWidget extends StatefulWidget {
  EventDeskListWidget({
    super.key,
  });

  @override
  State<EventDeskListWidget> createState() => _EventDeskListWidgetState();
}

class _EventDeskListWidgetState extends State<EventDeskListWidget> {
  var controller = Get.find<BaseController>();

  @override
  void initState() {
    controller.getEventDeskListData(id: controller.model1.id.toString());
    controller.temporarySelectedDeskIndex = [];

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        padding: EdgeInsets.all(10),
        child: controller.obx(
          (state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomAutoSizeTextMontserrat(
                      text: 'Event Desk',
                      textColor: ThemeConstants.bluecolor,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                    Spacer(),
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.close))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                if (controller.showAddAssignOption == true)
                  CustomAutoSizeTextMontserrat(
                    text:
                        'Select the university and SIEC desk you wish to visit',
                    textColor: ThemeConstants.blackcolor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                if (controller.showAddAssignOption == false)
                  CustomAutoSizeTextMontserrat(
                    text: 'Desk assigned to you',
                    textColor: ThemeConstants.blackcolor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                SizedBox(
                  height: 10,
                ),
                if (controller.showAddAssignOption == true)
                  Expanded(
                      child: EventDeskList(model: controller.notAssignedDesk)),
                if (controller.showAddAssignOption == false)
                  Expanded(
                      child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: controller.assignedDesk.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // if (controller.temporarySelectedDeskIndex
                          //     .contains(index)) {
                          //   controller.temporarySelectedDeskIndex.remove(index);
                          // } else {
                          //   controller.temporarySelectedDeskIndex.add(index);
                          // }

                          // controller.update();
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ThemeConstants.lightblueColor),
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          child: Text(
                              '${controller.assignedDesk[index].userName}'),
                        ),
                      );
                    },
                  )),
                SizedBox(
                  height: 10,
                ),
                if (controller.showAddAssignOption == true)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          print(controller.temporarySelectedDeskIndex);
                          if (controller
                              .temporarySelectedDeskIndex.isNotEmpty) {
                            controller.saveEventDeskData();
                          } else {
                            getToast("Kindly Select your fields");
                          }
                        },
                        child: Container(
                          // color: ThemeConstants.bluecolor,
                          decoration: BoxDecoration(
                              color: ThemeConstants.bluecolor,
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          child: CustomAutoSizeTextMontserrat(
                            text: "Assign Desk",
                            textColor: ThemeConstants.whitecolor,
                          ),
                        ),
                      ),
                    ],
                  )
              ],
            );
          },
        ));
  }
}

class EventDeskList extends StatefulWidget {
  List<Data> model;

  EventDeskList({
    super.key,
    required this.model,
  });

  @override
  State<EventDeskList> createState() => _EventDeskListState();
}

class _EventDeskListState extends State<EventDeskList> {
  List<int> data = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      itemCount: widget.model.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            if (data.contains(index)) {
              data.remove(index);
              // Get.find<BaseController>()
              //     .temporarySelectedDeskIndex
              //     .remove(index);
            } else {
              // Get.find<BaseController>().temporarySelectedDeskIndex.add(index);

              data.add(index);
            }

            Get.find<BaseController>().temporarySelectedDeskIndex = data;
            Get.find<BaseController>().update();
            setState(() {});

            // controller.update();
          },
          child: Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: data.contains(index)
                  ? ThemeConstants.bluecolor
                  : ThemeConstants.lightblueColor,
            ),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: CustomAutoSizeTextMontserrat(
              text: '${widget.model[index].userName}',
              textColor: data.contains(index)
                  ? ThemeConstants.whitecolor
                  : ThemeConstants.blackcolor,
            ),
          ),
        );
      },
    );
  }
}
