import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/upload_document/takepicturescreenCommonDocument.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/custombutton.dart';
import 'package:studentpanel/widgets/customdrawer.dart';
import '../../../widgets/Custom Dropdown/custom_dropdown.dart';
import 'Controller/eventDocumentUploadController.dart';

class EventDocumentUpload extends StatelessWidget {
  EventDocumentUpload({super.key});

  static const routeNamed = '/EventDocumentUpload';
  var controller = Get.put(EventDocumentUploadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(""),
        drawer: CustomDrawer(),
        body: controller.obx(
          onLoading: getLoading(context),
          (state) => SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  CustomAutoSizeTextMontserrat(
                    text:
                        "kindly upload one of your identity and one or Acodemic Document",
                    textColor: ThemeConstants.bluecolor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  if (controller.model.documentsAcedmicData == null)
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 10, top: 30, bottom: 20),
                            margin: const EdgeInsets.only(
                                top: 10, left: 5, right: 5),
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      blurRadius: 2,
                                      spreadRadius: 0.1,
                                      color: Color.fromARGB(97, 0, 0, 0))
                                ],
                                color: ThemeConstants.whitecolor,

                                // color: ThemeConstants.lightblueColor,
                                border:
                                    Border.all(color: ThemeConstants.yellow),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0))),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Document Name",
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: CustomDropDownSingle(
                                    bgColor:
                                        ThemeConstants.ultraLightgreyColor2,
                                    model: controller.listIdentity,
                                    initialSelectedValue:
                                        controller.identityselected,
                                    choosefieldtype: false,
                                    callbackFunction: (value) {
                                      controller.identityselected = value;
                                      if (controller
                                              .model.documentsListIdentity !=
                                          null) {
                                        for (var i = 0;
                                            i <
                                                controller
                                                    .model
                                                    .documentsListIdentity!
                                                    .length;
                                            i++) {
                                          if (controller
                                                  .model
                                                  .documentsListIdentity![i]
                                                  .name ==
                                              value) {
                                            controller.identityIDselected =
                                                controller
                                                    .model
                                                    .documentsListIdentity![i]
                                                    .id
                                                    .toString();
                                          }
                                        }
                                      }

                                      controller.update();
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: SizedBox(
                                    width: 100,
                                    child: CustomButton(
                                      text: "Upload",
                                      onPressed: () {
                                        getSourceSelected(
                                          callbackSelectedSource1,
                                          controller.identityIDselected!,
                                        );
                                      },
                                      backgroundColor: ThemeConstants.bluecolor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                              // top: -20,
                              left: 25,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                height: 35,
                                decoration: BoxDecoration(
                                    color: ThemeConstants.lightYellow,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        width: 1,
                                        color: ThemeConstants.yellow)),
                                child: Row(
                                  children: [
                                    svgImage("identityproof",
                                        ThemeConstants.blackcolor, 50, 50),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    CustomAutoSizeTextMontserrat(
                                      fontSize: 14,
                                      text: "Academic Document",
                                      textColor: ThemeConstants.blackcolor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  if (controller.model.documentsIdentityData == null)
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 10, top: 30, bottom: 20),
                            margin: const EdgeInsets.only(
                                top: 10, left: 5, right: 5),
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      blurRadius: 2,
                                      spreadRadius: 0.1,
                                      color: Color.fromARGB(97, 0, 0, 0))
                                ],
                                color: ThemeConstants.whitecolor,

                                // color: ThemeConstants.lightblueColor,
                                border:
                                    Border.all(color: ThemeConstants.yellow),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0))),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Document Name",
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: CustomDropDownSingle(
                                    bgColor:
                                        ThemeConstants.ultraLightgreyColor2,
                                    model: controller.listAcedmic,
                                    initialSelectedValue:
                                        controller.academicselected,
                                    choosefieldtype: false,
                                    callbackFunction: (value) {
                                      controller.academicselected = value;

                                      if (controller
                                              .model.documentsListIdentity !=
                                          null) {
                                        for (var i = 0;
                                            i <
                                                controller
                                                    .model
                                                    .documentsListAcedmic!
                                                    .length;
                                            i++) {
                                          if (controller
                                                  .model
                                                  .documentsListAcedmic![i]
                                                  .name ==
                                              value) {
                                            controller.academicIDselected =
                                                controller.model
                                                    .documentsListAcedmic![i].id
                                                    .toString();
                                          }
                                        }
                                      }
                                      controller.update();
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: SizedBox(
                                    width: 100,
                                    child: CustomButton(
                                      text: "Upload",
                                      onPressed: () {
                                        getSourceSelected(
                                          callbackSelectedSource1,
                                          controller.academicIDselected!,
                                        );
                                      },
                                      backgroundColor: ThemeConstants.bluecolor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                              // top: -20,
                              left: 25,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                height: 35,
                                decoration: BoxDecoration(
                                    color: ThemeConstants.lightYellow,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        width: 1,
                                        color: ThemeConstants.yellow)),
                                child: Row(
                                  children: [
                                    svgImage("academicDocument",
                                        ThemeConstants.blackcolor, 50, 50),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    CustomAutoSizeTextMontserrat(
                                      fontSize: 14,
                                      text: "Academic Document",
                                      textColor: ThemeConstants.blackcolor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 15),
                  //   child: Align(
                  //     alignment: Alignment.topRight,
                  //     child: SizedBox(
                  //       width: 100,
                  //       child: CustomButton(
                  //         text: "Submit",
                  //         onPressed: () {},
                  //         backgroundColor: ThemeConstants.bluecolor,
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ));
  }

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

  getSourceSelected(Function callbackSelectedSource, String id,
      {String OrgName = ""}) {
    Get.bottomSheet(Container(
      color: ThemeConstants.whitecolor,
      height: 300,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CustomAutoSizeTextMontserrat(
              text: "Select Source",
              fontSize: 18,
              textColor: ThemeConstants.bluecolor,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              const Spacer(),
              InkWell(
                onTap: () {
                  Get.back();
                  callbackSelectedSource("Camera,${id.toString()},$OrgName");
                },
                child: Column(
                  children: [
                    svgImage(
                        "cameracapture", ThemeConstants.bluecolor, 100, 100),
                    CustomAutoSizeTextMontserrat(
                      text: "Camera",
                    )
                  ],
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Get.back();
                  callbackSelectedSource("Gallery,${id.toString()},$OrgName");
                },
                child: Column(
                  children: [
                    svgImage("gallery", ThemeConstants.bluecolor, 100, 100),
                    CustomAutoSizeTextMontserrat(
                      text: "Gallery",
                    )
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    ));
  }

  callbackSelectedSource1(data) async {
    List temp = [];
    temp = data.toString().split(",");
    try {
      if (temp[0].toString() == "Camera") {
        final cameras = await availableCameras();

        // Get a specific camera from the list of available cameras.
        final firstCamera = cameras.first;
        // String id = DateTime.now().toIso8601String();
        Get.to(TakePictureScreenCommonDocument(
          camera: firstCamera,
          id: temp[1],
          orgname: temp[2],
        ));
      } else {
        Get.find<EventDocumentUploadController>()
            .uploadDocument(temp[1], orgname: temp[2]);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
