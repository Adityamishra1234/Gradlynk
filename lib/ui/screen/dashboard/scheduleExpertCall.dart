import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:studentpanel/ui/controllers/scheduleExpertCall.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/Custom_time_widgets.dart/custom_timer_widget.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customDatePicker.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';
import 'package:studentpanel/widgets/time_picker.dart';
import 'package:studentpanel/widgets/Custom%20Dropdown/custom_dropdown.dart';

import '../../../widgets/TopSnackBar/top_snack_bar.dart';
import '../../../widgets/drawerfilter.dart';
import '../../controllers/basecontroller.dart';
import '../mark_attendance/qrCodeScreen.dart';

class ScheduleExpertCall extends StatelessWidget {
  ScheduleExpertCall({super.key});
  static const routeNamed = '/ScheduleExpertCall';
  var controller = Get.put(ScheduleExpertCallController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 2.5,
          automaticallyImplyLeading: false,
          actions: [
            if (displayMobileLayout == true)
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Get.back(),
              ),
            if (displayMobileLayout == false)
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                  // icon: Image.asset("assets/images/gradlynk lense.png"),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  // icon: const Icon(Icons.menu,color: Colors.black,),
                  onPressed: () {
                    // Get.find<BaseController>().profileDataValidator();
                    // _scaffoldKey.currentState!.openDrawer();
                    Get.back();

                    DrawerFilter();
                  },
                ),
              ),
            // svgImage("work", Colors.transparent, 32, 32),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Image.network(
                "https://sieceducation.in/assets/assets/images/logo.png",
                width: 130,
                height: 30,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 10),
            //   child: Row(
            //     children: [
            //     Text("Hi, ", style: GoogleFonts.abhayaLibre(textStyle: const TextStyle(
            //                         fontSize: 24,
            //                         fontWeight: FontWeight.w700,
            //                         color: Colors.black,
            //                       ),)),
            //       Text(
            //             style: GoogleFonts.abhayaLibre(textStyle: const TextStyle(
            //               fontSize: 24,
            //               fontWeight: FontWeight.w700,
            //               color: Colors.black,
            //             ),),
            //           "${firstLetterChaptial(controller.personalModal.enquiryName) ?? firstLetterChaptial(controller.model1.enquiryName)}"
            //         ),
            //     ],
            //   ),
            // ),
            const Spacer(),
            if (Get.find<BaseController>().meetingZoneStatus.qrCodeGenerated ==
                true)
              IconButton(
                icon: svgImage("qr code", ThemeConstants.IconColor, 25, 25),
                onPressed: () {
                  showAnimatedDialog(
                      animationType: DialogTransitionType.slideFromBottomFade,
                      curve: Curves.easeInOutQuart,
                      context: context,
                      builder: (_) => QRScreen(
                          Url: Get.find<BaseController>()
                              .meetingZoneStatus
                              .qrCodeView!,
                          code: Get.find<BaseController>()
                              .meetingZoneStatus
                              .student_code!));
                },
              ),

            // IconButton(
            //   icon: SvgPicture.asset(
            //     "assets/icons/profile.svg",
            //     height: 30,
            //     color: const Color.fromARGB(255, 99, 99, 99),
            //   ),
            //   onPressed: () {
            //     Get.toNamed(ProfilePage.routeNamed);
            //   },
            // ),

            const SizedBox(
              width: 5,
            )
          ],
          // title: Text(
          //   title,
          //   style: const TextStyle(color: Colors.black),
          // ),
          backgroundColor: Colors.white,
        ),
        drawer: CustomDrawer(),
        body: GetBuilder<ScheduleExpertCallController>(
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
                      text: "Schedule an Expert call",
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
                selectedValue: _.nameSelected,
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
                child: Container(
                  height: 50,
                  child: CustomTimerWidget(
                      startingDate: Jiffy.now().dateTime,
                      // enableField: false,
                      // date: _.dateSelected,
                      isBlank: true,
                      callback: callbackDatePicker),
                ),
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
                            foregroundColor: ThemeConstants.bluecolor,
                            backgroundColor: ThemeConstants.bluecolor,
                            elevation: 0.0, // foreground
                          ),
                          onPressed: () {
                            if (getNUllChecker(_.nameSelected)) {
                              // getToast(SnackBarConstants.counsellorError!);
                              showTopSnackBar(
                                context,
                                CustomSnackBar.info(message: SnackBarConstants.counsellorError!),
                                showOutAnimationDuration: const Duration(milliseconds: 800),
                                hideOutAnimationDuration: const Duration(milliseconds: 800),
                                displayDuration: const Duration(milliseconds: 1500),
                              );
                            } else if (getNUllChecker(_.dateSelected)) {
                              // getToast(SnackBarConstants.preferresDateError!);
                              showTopSnackBar(
                                context,
                                CustomSnackBar.info(message: SnackBarConstants.preferresDateError!),
                                showOutAnimationDuration: const Duration(milliseconds: 800),
                                hideOutAnimationDuration: const Duration(milliseconds: 800),
                                displayDuration: const Duration(milliseconds: 1500),
                              );
                            } else if (getNUllChecker(_.timeSelected)) {
                              // getToast(SnackBarConstants.preferresTimeError!);
                              showTopSnackBar(
                                context,
                                CustomSnackBar.info(message: SnackBarConstants.preferresTimeError!),
                                showOutAnimationDuration: const Duration(milliseconds: 800),
                                hideOutAnimationDuration: const Duration(milliseconds: 800),
                                displayDuration: const Duration(milliseconds: 1500),
                              );
                            } else {
                              _.addScheduleAnExpertCall();
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
    // String temp = data.toString().split(' ')[0];
    // List<String> date = temp.split('-');
    // controller.dateSelected = date[0] + "-" + date[1] + '-' + date[2];
    controller.dateSelected = data;

    controller.update();
  }

  callbacktimepicker(data) {
    controller.timeSelected = data.toString();
  }
}
