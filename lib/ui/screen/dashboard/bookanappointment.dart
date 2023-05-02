import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/bookanappointment.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customDatePicker.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';
import 'package:studentpanel/widgets/time_picker.dart';
import 'package:studentpanel/widgets/Custom%20Dropdown/custom_dropdown.dart';

class BookAnAppointment extends StatelessWidget {
  BookAnAppointment({super.key});
  static const routeNamed = '/BookAnAppointment';
  var controller = Get.put(BookAnAppointmentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("title"),
        drawer: CustomDrawer(),
        body: GetBuilder<BookAnAppointmentController>(
          builder: (_) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: ThemeConstants.lightblueColor,
                      borderRadius: BorderRadiusDirectional.circular(10.0)),
                  child: Center(
                    child: CustomAutoSizeTextMontserrat(
                      text: "Book an Appointment",
                      textColor: ThemeConstants.bluecolor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: CustomAutoSizeTextMontserrat(
                    text: "Select your Counsellor",
                    mandatory: true,
                    //textColor: ThemeConstants.TextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomDropDownSingle(
                model: getDropdownModel(
                    _.loadingServiceAssigned.value, _.nameSelected, _.name),
                initialSelectedValue: getSelectedDropDown(
                    _.loadingServiceAssigned.value, _.nameSelected, _.name),
                choosefieldtype: false,
                callbackFunction: callbackServiceAssigned,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: CustomAutoSizeTextMontserrat(
                    text: "Preferred Date",
                    mandatory: true,
                    //textColor: ThemeConstants.TextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: DatePickerExample(
                    enableField: false,
                    date: _.dateSelected,
                    callbackDate: callbackDatePicker),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: CustomAutoSizeTextMontserrat(
                    text: "Preferred Time",
                    mandatory: true,
                    //textColor: ThemeConstants.TextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TimePickerExample(
                enableField: false,
                date: _.timeSelected,
                callbackDate: callbacktimepicker,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: SizedBox(
                      width: 100,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            primary: ThemeConstants.bluecolor, // background
                            onPrimary: ThemeConstants.bluecolor, // foreground
                          ),
                          onPressed: () {
                            if (getNUllChecker(_.nameSelected)) {
                              getToast(SnackBarConstants.counsellorError!);
                            } else if (getNUllChecker(_.dateSelected)) {
                              getToast(SnackBarConstants.preferresDateError!);
                            } else if (getNUllChecker(_.timeSelected)) {
                              getToast(SnackBarConstants.preferresTimeError!);
                            } else {
                              _.addBookAppointment();
                            }
                          },
                          child: CustomAutoSizeTextMontserrat(
                            text: "Confirm",
                            textColor: ThemeConstants.whitecolor,
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  //Function
  List getDropdownModel(bool loading, String? selected, List model) {
    if (loading == true) {
      return model;
    } else {
      return ["No data"];
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
