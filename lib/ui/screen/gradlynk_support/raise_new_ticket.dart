import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/controllers/raise_new_ticket_controller.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

import '../../../widgets/TopSnackBar/top_snack_bar.dart';
import '../../../widgets/drawerfilter.dart';
import '../mark_attendance/qrCodeScreen.dart';

class RaiseYourTicket extends StatefulWidget {
  RaiseYourTicket({super.key});
  static const routeNamed = '/RaiseYourTicket';

  @override
  State<RaiseYourTicket> createState() => _RaiseYourTicketState();
}

class _RaiseYourTicketState extends State<RaiseYourTicket> {
  var issueController = TextEditingController();
  var suggesationController = TextEditingController();
  var result;
  List files = [];
  var controller = Get.put(RaiseYourTicketController());
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
                    Icons.menu,
                    color: Colors.black,
                  ),
                  // icon: const Icon(Icons.menu,color: Colors.black,),
                  onPressed: () {
                    // Get.find<BaseController>().profileDataValidator();
                    _scaffoldKey.currentState!.openDrawer();

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
        drawer: CustomDrawer(
          index: 12,
        ),
        body: controller.obx((state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CustomAutoSizeTextMontserrat(
                      text: "Use this ticket to -",
                      fontSize: 18,
                      textColor: ThemeConstants.bluecolor,
                    ),
                  ),
                ),
                Wrap(
                  spacing: 10.0,
                  children: [
                    InkWell(
                      onTap: () {
                        if (controller.raiseAnIssue.value == true) {
                          controller.raiseAnIssue.value = false;
                        } else {
                          controller.raiseAnIssue.value = true;
                        }
                        controller.update();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: controller.raiseAnIssue.value == false
                              ? ThemeConstants.whitecolor
                              : ThemeConstants.red,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          border:
                              Border.all(width: 0.8, color: ThemeConstants.red),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: CustomAutoSizeTextMontserrat(
                            text: "Raise an issue",
                            fontWeight: FontWeight.bold,
                            textColor: controller.raiseAnIssue.value == true
                                ? ThemeConstants.whitecolor
                                : ThemeConstants.red,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (controller.suggestAnImprovisation.value == true) {
                          controller.suggestAnImprovisation.value = false;
                        } else {
                          controller.suggestAnImprovisation.value = true;
                        }
                        controller.update();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              controller.suggestAnImprovisation.value == false
                                  ? ThemeConstants.whitecolor
                                  : ThemeConstants.GreenColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          border: Border.all(
                              width: 0.8, color: ThemeConstants.GreenColor),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: CustomAutoSizeTextMontserrat(
                            text: "Suggest an Improvisation",
                            fontWeight: FontWeight.bold,
                            textColor:
                                controller.suggestAnImprovisation.value == true
                                    ? ThemeConstants.whitecolor
                                    : ThemeConstants.GreenColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                if (controller.raiseAnIssue.value == true)
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                      child: CustomAutoSizeTextMontserrat(
                        text:
                            "We apologise for the inconvenience! \nKindly specify your issue:",
                        mandatory: true,
                      ),
                    ),
                  ),
                if (controller.raiseAnIssue.value == true)
                  SizedBox(
                    height: 100,
                    child: Material(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ThemeConstants.TextColor),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                          child: TextField(
                            controller: issueController,
                            minLines: 3, // Set this
                            maxLines: 6, // and this
                            keyboardType: TextInputType.multiline,
                            textAlign: TextAlign.start,

                            decoration: InputDecoration(
                              hintStyle: const TextStyle(fontSize: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              fillColor: ThemeConstants.whitecolor,
                              contentPadding: const EdgeInsets.all(16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (controller.raiseAnIssue.value == true)
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomAutoSizeTextMontserrat(
                          text: "Kindly upload concerned attachment:"),
                    ),
                  ),
                if (controller.raiseAnIssue.value == true)
                  if (files.isNotEmpty)
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: files.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: [
                                  Image.file(File(files[index].path)),
                                  Positioned(
                                    right: 2,
                                    top: 2,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {});
                                        files.removeAt(index);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                ThemeConstants.lightgreycolor),
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Icon(
                                            Icons.close,
                                            color: ThemeConstants.blackcolor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                if (controller.raiseAnIssue.value == true)
                  if (files.length != 2)
                    Row(
                      children: [
                        InkWell(
                          onTap: () async {
                            result = await FilePicker.platform.pickFiles(
                              allowMultiple: true,
                              type: FileType.custom,
                              allowedExtensions: [
                                'jpg',
                                'jpeg',
                                'png',
                                'tiff',
                              ],
                            );
                            if (result == null) {
                              print("No file selected");
                            } else {
                              var files1 = result.paths
                                  .map((path) => File(path))
                                  .toList();
                              //TODO
                              //change 2 => 5
                              if (files.length > 2) {
                                getToast("maximun number of images have 2");
                                //TODO
                                //change 2 => 5
                                for (var i = 0; i < 2; i++) {
                                  files.add(files1[i]);
                                } //TODO
                                //change 2 => 5
                                if (files.length > 2) {
                                  files.removeRange(2, files.length);
                                }
                              } else {
                                files.addAll(files1);
                                //TODO
                                //change 2 => 5
                                if (files.length > 2) {
                                  files.removeRange(2, files.length);
                                }
                              }
                              setState(() {});
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ThemeConstants.TextColor),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Choose file",
                                  textColor: ThemeConstants.TextColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        if (files.isEmpty)
                          CustomAutoSizeTextMontserrat(
                            text: "No file chosen",
                            textColor: ThemeConstants.TextColor,
                          ),
                        if (files.length == 1)
                          CustomAutoSizeTextMontserrat(
                            text: "choose other file",
                            textColor: ThemeConstants.TextColor,
                          ),
                      ],
                    ),
                if (controller.suggestAnImprovisation.value == true)
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 20),
                      child: CustomAutoSizeTextMontserrat(
                        text:
                            "We appreciate your efforts.\nKindly suggest an improvisation:",
                        mandatory: true,
                      ),
                    ),
                  ),
                if (controller.suggestAnImprovisation.value == true)
                  SizedBox(
                    height: 100,
                    child: Material(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ThemeConstants.TextColor),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                          child: TextField(
                            controller: suggesationController,
                            minLines: 3, // Set this
                            maxLines: 6, // and this
                            keyboardType: TextInputType.multiline,
                            textAlign: TextAlign.start,

                            decoration: InputDecoration(
                              hintStyle: const TextStyle(fontSize: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              fillColor: ThemeConstants.whitecolor,
                              contentPadding: const EdgeInsets.all(16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (controller.raiseAnIssue.value == true ||
                    controller.suggestAnImprovisation.value == true)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: SizedBox(
                          width: 100,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: ThemeConstants.lightgreycolor, backgroundColor: ThemeConstants.lightgreycolor, elevation: 0.0, // foreground
                              ),
                              onPressed: () {
                                setState(() {
                                  files = [];
                                  issueController.text = "";
                                  suggesationController.text = "";
                                });
                              },
                              child: CustomAutoSizeTextMontserrat(
                                text: "Clean",
                                textColor: ThemeConstants.blackcolor,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: SizedBox(
                          width: 150,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: ThemeConstants.bluecolor, backgroundColor: ThemeConstants.bluecolor, elevation: 0.0, // foreground
                              ),
                              onPressed: () async {
                                bool temp = true;
                                if (controller.raiseAnIssue.value == true) {
                                  if (issueController.text.isEmpty) {
                                    temp = false;
                                    // getToast("Kindly enter your issue");
                                    showTopSnackBar(
                                      context,
                                      const CustomSnackBar.info(message: "Kindly enter your issue"),
                                      showOutAnimationDuration: const Duration(milliseconds: 800),
                                      hideOutAnimationDuration: const Duration(milliseconds: 800),
                                      displayDuration: const Duration(milliseconds: 1500),
                                    );
                                  }
                                }
                                if (controller.suggestAnImprovisation.value ==
                                    true) {
                                  if (suggesationController.text.isEmpty) {
                                    temp = false;
                                    // getToast("Please enter  Suggestation");
                                    showTopSnackBar(
                                      context,
                                      const CustomSnackBar.info(message: "Please enter your suggestion"),
                                      showOutAnimationDuration: const Duration(milliseconds: 800),
                                      hideOutAnimationDuration: const Duration(milliseconds: 800),
                                      displayDuration: const Duration(milliseconds: 1500),
                                    );
                                  }
                                }
                                if (temp == true) {
                                  var res = await controller.sendFile(
                                    Get.find<BaseController>()
                                        .model1
                                        .id
                                        .toString(),
                                    issueController.text,
                                    suggesationController.text,
                                    files.isNotEmpty ? files[0] : null,
                                    files.length == 2 ? files[1] : null,
                                  );
                                  if (res != null) {
                                    // getToast("Ticket raise successful");
                                    showTopSnackBar(
                                      context,
                                     const CustomSnackBar.success(message: "Ticket Raised successfully"),
                                      showOutAnimationDuration: const Duration(milliseconds: 800),
                                      hideOutAnimationDuration: const Duration(milliseconds: 800),
                                      displayDuration: const Duration(milliseconds: 1500),
                                    );
                                    setState(() {
                                      files = [];
                                      issueController.text = "";
                                      suggesationController.text = "";
                                    });
                                  }
                                }
                              },
                              child: CustomAutoSizeTextMontserrat(
                                text: "Submit",
                                textColor: ThemeConstants.whitecolor,
                              )),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          );
        }, onLoading: getLoading(context)));
  }
}
