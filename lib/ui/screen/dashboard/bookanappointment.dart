import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/bookanappointment.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/Custom_time_widgets.dart/custom_time_picker_only.dart';
import 'package:studentpanel/widgets/Custom_time_widgets.dart/custom_timer_widget.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customDatePicker.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';
import 'package:studentpanel/widgets/customtextfield.dart';
import 'package:studentpanel/widgets/time_picker.dart';
import 'package:studentpanel/widgets/Custom%20Dropdown/custom_dropdown.dart';

class BookAnAppointment extends StatefulWidget {
  BookAnAppointment({super.key});
  static const routeNamed = '/BookAnAppointment';

  @override
  State<BookAnAppointment> createState() => _BookAnAppointmentState();
}

class _BookAnAppointmentState extends State<BookAnAppointment> {
  var controller = Get.put(BookAnAppointmentController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return SingleChildScrollView(
          child: Container(
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    CustomAutoSizeTextMontserrat(
                      text: "Book an appointment",
                      fontSize: 17,
                      textalingCentre: false,
                      fontWeight: FontWeight.w700,
                      textColor: ThemeConstants.bluecolor,
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: ThemeConstants.lightblueColor,
                        child: Icon(
                          Icons.close,
                          color: ThemeConstants.TextColor,
                          size: 18,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: CustomAutoSizeTextMontserrat(
                    text: "Select the Counsellor",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    textColor: ThemeConstants.blackcolor,
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: 400,
                  height: 35,
                  child: Obx(
                    () => ListView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.all(0),
                      children: [
                        if (controller.loadingServiceAssigned == true) ...[
                          ...getDropdownModel(
                              controller.loadingServiceAssigned.value,
                              controller.nameSelected,
                              controller.name),
                        ] else ...[
                          CircularProgressIndicator()
                        ]
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                    width: 300.0,
                    height: 40.0,
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomAutoSizeTextMontserrat(
                        text:
                            "Your Advisor Simranjeet Canada brampton is in Head Office Branch",
                        fontSize: 12,
                        textColor: ThemeConstants.red,
                      ),
                    )),
                SizedBox(
                    width: 300.0,
                    height: 45.0,
                    child: Row(
                      children: [
                        const Icon(Icons.location_on_sharp),
                        CustomAutoSizeTextMontserrat(
                          text: "Branch Address:",
                          fontSize: 12,
                          textColor: ThemeConstants.blackcolor,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: CustomAutoSizeTextMontserrat(
                            text: "B-2/0 1st floor Opposite Happy Model School",
                            fontSize: 12,
                            textColor: ThemeConstants.skycolor,
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  width: 300.0,
                  height: 40.0,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: ThemeConstants.lightgreycolor),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 5, bottom: 5),
                          child: Row(
                            children: [
                              CustomAutoSizeTextMontserrat(
                                text: "Connect Virtually",
                                fontSize: 12,
                              )
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: ThemeConstants.lightgreycolor),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 5, bottom: 5),
                          child: Row(
                            children: [
                              CustomAutoSizeTextMontserrat(
                                text: "Visit Nearest Branch",
                                fontSize: 12,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    height: 80.0,
                    width: 300,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              width: 80.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.abc),
                                  SizedBox(height: 8.0),
                                  Text('Item $index'),
                                ],
                              ));
                        })),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 150,
                        height: 50,
                        child: CustomTimerWidget(callback: (val) {})),
                    Container(
                        height: 50,
                        width: 150,
                        child: CustomTimerWidget2(callback: (val) {}))
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );

    //   );Scaffold(
    // appBar: const CustomAppBar("title"),
    // drawer: CustomDrawer(),
    // body: GetBuilder<BookAnAppointmentController>(
    //   builder: (_) => Column(
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.all(10),
    //         child: Container(
    //           height: 50,
    //           decoration: BoxDecoration(
    //               color: ThemeConstants.lightblueColor,
    //               borderRadius: BorderRadiusDirectional.circular(10.0)),
    //           child: Center(
    //             child: CustomAutoSizeTextMontserrat(
    //               text: "Book an Appointment",
    //               textColor: ThemeConstants.bluecolor,
    //               fontSize: 14,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
    //         child: Align(
    //           alignment: AlignmentDirectional.topStart,
    //           child: CustomAutoSizeTextMontserrat(
    //             text: "Select your Counsellor",
    //             mandatory: true,
    //             //textColor: ThemeConstants.TextColor,
    //             fontSize: 14,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //       ),
    //       CustomDropDownSingle(
    //         model: getDropdownModel(
    //             _.loadingServiceAssigned.value, _.nameSelected, _.name),
    //         initialSelectedValue: getSelectedDropDown(
    //             _.loadingServiceAssigned.value, _.nameSelected, _.name),
    //         choosefieldtype: false,
    //         callbackFunction: callbackServiceAssigned,
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
    //         child: Align(
    //           alignment: AlignmentDirectional.topStart,
    //           child: CustomAutoSizeTextMontserrat(
    //             text: "Preferred Date",
    //             mandatory: true,
    //             //textColor: ThemeConstants.TextColor,
    //             fontSize: 14,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
    //         child: DatePickerExample(
    //             enableField: false,
    //             date: _.dateSelected,
    //             callbackDate: callbackDatePicker),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
    //         child: Align(
    //           alignment: AlignmentDirectional.topStart,
    //           child: CustomAutoSizeTextMontserrat(
    //             text: "Preferred Time",
    //             mandatory: true,
    //             //textColor: ThemeConstants.TextColor,
    //             fontSize: 14,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //       ),
    //       TimePickerExample(
    //         enableField: false,
    //         date: _.timeSelected,
    //         callbackDate: callbacktimepicker,
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(top: 10),
    //         child: Align(
    //           alignment: AlignmentDirectional.bottomEnd,
    //           child: Padding(
    //             padding: const EdgeInsets.only(right: 20),
    //             child: SizedBox(
    //               width: 100,
    //               child: ElevatedButton(
    //                   style: ElevatedButton.styleFrom(
    //                     foregroundColor: ThemeConstants.bluecolor, backgroundColor: ThemeConstants.bluecolor, elevation: 0.0, // foreground
    //                   ),
    //                   onPressed: () {
    //                     if (getNUllChecker(_.nameSelected)) {
    //                       getToast(SnackBarConstants.counsellorError!);
    //                     } else if (getNUllChecker(_.dateSelected)) {
    //                       getToast(SnackBarConstants.preferresDateError!);
    //                     } else if (getNUllChecker(_.timeSelected)) {
    //                       getToast(SnackBarConstants.preferresTimeError!);
    //                     } else {
    //                       _.addBookAppointment();
    //                     }
    //                   },
    //                   child: CustomAutoSizeTextMontserrat(
    //                     text: "Confirm",
    //                     textColor: ThemeConstants.whitecolor,
    //                   )),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // ));
  }

  //Function
  List<Widget> getDropdownModel(bool loading, String? selected, List model) {
    if (loading == true) {
      List<Widget> data = [];
      for (var i = 0; i < model.length; i++) {
        print(model[i]);
        data.add(Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 238, 238, 238)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              child: CustomAutoSizeTextMontserrat(
                textalingCentre: true,
                text: '${model}',
                textColor: ThemeConstants.blackcolor,
                fontSize: 10,
              ),
            )));
      }
      return data;
    } else {
      return [
        SizedBox(
          child: CircularProgressIndicator(),
        )
      ];
    }
  }

  String getSelectedDropDown(bool loading, String? selected, List model) {
    if (loading == true) {
      if (selected == null) {
        return model[0].toString();
      } else {
        return selected;
      }
    } else {
      return "No data";
    }
  }

  callbackServiceAssigned(varTopic) {
    for (var i = 0; i < controller.name.length; i++) {
      if (i == 0) {
        controller.nameSelected = null;
        controller.nameSelectedID = null;
      } else {
        if (controller.name[i] == varTopic) {
          controller.nameSelected = controller.name[i];
          controller.nameSelectedID = controller.nameID[i];
          controller.update();
        }
      }
    }
  }

  callbackDatePicker(data) {
    String temp = data.toString().split(' ')[0];
    List<String> date = temp.split('-');
    controller.dateSelected = date[0] + "-" + date[1] + '-' + date[2];
    controller.update();
  }

  callbacktimepicker(data) {
    controller.timeSelected = data.toString();
  }
}
