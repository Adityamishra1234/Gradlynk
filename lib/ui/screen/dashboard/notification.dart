import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashids2/hashids2.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customBottomNavbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';
import 'package:studentpanel/widgets/empty_widget.dart';

import '../../../utils/constants.dart';
import '../../../widgets/drawerfilter.dart';
import '../dashboard.dart';
import '../mark_attendance/qrCodeScreen.dart';

class NotificationScreen extends StatelessWidget {
  static const routeNamed = '/NotificationScreen';
   NotificationScreen({super.key});

  String reverseStringUsingSplit(String input) {
    var chars = input.split('');
    return chars.reversed.join();
  }


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
    return PopScope(canPop: false,
      onPopInvoked: (didPop) async {
          Get.offAllNamed(DashBoard.routeNamed);
      },
      child: Scaffold(
        bottomNavigationBar: CustomButtomNavbar(currentIndex: 2, context2: context,),
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 2.5,centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Image.network(
              "https://sieceducation.in/assets/assets/images/logo.png",
              width: 130,
              height: 30,
            ),
          ),
          automaticallyImplyLeading: true,
          iconTheme:
          IconThemeData(color: ThemeConstants.blackcolor),
          actions: [
            // if (displayMobileLayout == true)
            //   IconButton(
            //     icon: const Icon(Icons.arrow_back, color: Colors.black),
            //     onPressed: () => Get.back(),
            //   ),
            // if (displayMobileLayout == false)
            //   Padding(
            //     padding: const EdgeInsets.only(left: 10),
            //     child: IconButton(
            //       // icon: Image.asset("assets/images/gradlynk lense.png"),
            //       icon: const Icon(
            //         Icons.menu,
            //         color: Colors.black,
            //       ),
            //       // icon: const Icon(Icons.menu,color: Colors.black,),
            //       onPressed: () {
            //         // Get.find<BaseController>().profileDataValidator();
            //         _scaffoldKey.currentState!.openDrawer();
            //
            //         DrawerFilter();
            //       },
            //     ),
            //   ),
            // // svgImage("work", Colors.transparent, 32, 32),
            // const Spacer(),
            // Padding(
            //   padding: const EdgeInsets.only(top: 10),
            //   child: Image.network(
            //     "https://sieceducation.in/assets/assets/images/logo.png",
            //     width: 130,
            //     height: 30,
            //   ),
            // ),
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
            // const Spacer(),
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
        drawer: CustomDrawer(
          index: 0,
        ),
        body:

        LiquidPullToRefresh(
          springAnimationDurationInMilliseconds:600,
          color: ThemeConstants.bluecolor,
          onRefresh: () async {
          },
          child: GetBuilder<BaseController>(builder: (_) {
            List<Widget> addWidget = [];
            try {
              final hashids = HashIds(
                salt: 'xmjXtQZXO6JryHPC',
                minHashLength: 10,
                alphabet:
                    'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
              );
              RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

              if (_.notificationModel != null) {
                for (var i = 0; i < _.notificationModel!.length; i++) {
                  addWidget.add(InkWell(
                    onTap: () {
                      String hashidsApplication = _
                          .notificationModel![i].notificationBody
                          .toString()
                          .split("href='")[1]
                          .split("'>")[0];
                      hashidsApplication =
                          reverseStringUsingSplit(hashidsApplication);
                      hashidsApplication = hashidsApplication.split("/")[0];
                      hashidsApplication =
                          reverseStringUsingSplit(hashidsApplication);

                      hashidsApplication =
                          hashids.decode(hashidsApplication)[0].toString();
                      //TODO
                      Get.toNamed("/ApplicationCompleteDetails",
                          arguments: hashidsApplication);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical:15 ),
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: -0.2,
                                blurRadius: 5,
                                offset: const Offset(0, 4),
                              )],
                            color: ThemeConstants.whitecolor,
                            border: Border.all(color: const Color(0xFFE5E1FE)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Container(
                                  width: 10.0,
                                  height: 10.0,
                                  decoration: BoxDecoration(
                                    color: ThemeConstants.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10,),
                              SizedBox(
                                width: MediaQuery.of(context).size.width-75,
                                child: Column(
                                  children: [
                                    CustomAutoSizeTextMontserrat(
                                      text: _.notificationModel![i]
                                          .notificationTitle,
                                      fontWeight: FontWeight.bold,
                                      textColor: ThemeConstants.bluecolor,
                                      textalingCentre: true,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width -
                                                  100,
                                          child: HtmlWidget(
                                            _.notificationModel![0]
                                                .notificationBody!
                                                .replaceAll(exp, " "),
                                            renderMode: RenderMode.column,
                                            textStyle: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w600,
                                              color: ThemeConstants.TextColor,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "1 day ago",
                                        textColor: ThemeConstants.TextColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ));
                }
              } else {
                addWidget = [const Emptydetails()];
              }
            } catch (e) {
              if (kDebugMode) {
                print(e.toString());
              }
            }

            return SingleChildScrollView(
              child: Column(
                children: [...addWidget],
              ),
            );
          }),
        ),
      ),
    );
  }
}
