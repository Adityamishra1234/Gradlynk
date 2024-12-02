import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/receiveACallback/controllers/receiveACallback_controller.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/Custom%20Dropdown/custom_dropdown.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

import '../../../../widgets/drawerfilter.dart';
import '../../../controllers/basecontroller.dart';
import '../../mark_attendance/qrCodeScreen.dart';

class ReceiveACallBackView extends StatelessWidget {
  ReceiveACallBackView({super.key});

  var controller = Get.put(ReceiveACallbackController());

  static String routeNamed = '/recieveACallback';

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
    return Scaffold(
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
        body: controller.obx(
            (state) => Container(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomDropDownSingle(
                          selectedValue: controller.oo.value,
                          model: controller.name,
                          initialSelectedValue: controller.oo.value,
                          choosefieldtype: false,
                          callbackFunction: (value) {
                            controller.oo.value = value;
                            for (var i = 0; i < controller.name.length; i++) {
                              if (controller.oo.value == controller.name[i]) {
                                controller.seletectedID =
                                    controller.idList[i].toString();
                              }
                            }
                            controller.update();
                            // controller.updatedata(value);
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: ThemeConstants.bluecolor,
                              borderRadius: BorderRadius.circular(10)),
                          child: InkWell(
                            onTap: () {
                              if (controller.oo.value !=
                                  'Receive a call back') {
                                getToast(SnackBarConstants.receiveACallback);
                                controller.requestCallbackDataPost();
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: const Text(
                                'Submit',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                        // CustomDropDownSingleMulti(
                        //     model: controller.name,
                        //     enableMultiSelect: false,
                        //     initialSelectedValue: "initialSelectedValue")
                      ]),
                ),
            onLoading: getLoading(context)));
  }
}
