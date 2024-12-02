import 'package:camera/camera.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/controllers/uploaddocumentcontroller.dart';
import 'package:studentpanel/ui/models/commonuploaddocument.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/custom_doc_viewer.dart';
import 'package:studentpanel/widgets/custom_image_viewer.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';
import 'package:studentpanel/widgets/file_download.dart';
import '../../../widgets/drawerfilter.dart';
import '../mark_attendance/qrCodeScreen.dart';
import 'takepicturescreenCommonDocument.dart';
import 'package:studentpanel/widgets/Custom%20Dropdown/custom_dropdown.dart';

class UploadDocument extends StatefulWidget {
  bool is_event = false;
  UploadDocument({Key? key, this.is_event = false}) : super(key: key);
  static const routeNamed = '/UploadDocument';

  @override
  State<UploadDocument> createState() => _UploadDocumentState();
}

class _UploadDocumentState extends State<UploadDocument> {
  var controller = Get.put(UploadDocumentController());
  double? progress;
  bool loading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
    double width = MediaQuery.of(context).size.width;
    if (displayMobileLayout == true) {
      width = width - 240;
    }
    return Scaffold(
      key: _scaffoldKey,
        appBar: widget.is_event == false ? AppBar(
          elevation: 2.5,
          automaticallyImplyLeading: false,
          actions: [
            if (displayMobileLayout == true)
              IconButton(
                icon: const Icon(Icons.arrow_back,
                    color: Colors.black),
                onPressed: () => Get.back(),
              ),
            if (displayMobileLayout == false)
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child:  IconButton(
                  // icon: Image.asset("assets/images/gradlynk lense.png"),
                  icon: const Icon(Icons.menu, color: Colors.black,),
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
            if (Get.find<BaseController>()
                .meetingZoneStatus
                .qrCodeGenerated ==
                true)
              IconButton(
                icon: svgImage(
                    "qr code", ThemeConstants.IconColor, 25, 25),
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
        ) : null,
        drawer: widget.is_event == false
            ? displayMobileLayout == false
                ? CustomDrawer()
                : null
            : null,
        body: WillPopScope(
          onWillPop: () async {
            if (widget.is_event == true) {}
            return true;
          },
          child: GetBuilder<UploadDocumentController>(builder: (_) {
            documentList(_.documentModel, context);
            return Row(
              children: [
                if (displayMobileLayout == true) CustomDrawer(),
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:15, vertical: 20),
                        child: CustomAutoSizeTextMontserrat(
                          text: "My Documents",
                          fontSize: 18,
                          textColor: ThemeConstants.bluecolor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 20, right: 10),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: CustomAutoSizeTextMontserrat(
                            text: "Document Type",
                            mandatory: true,
                            textColor: ThemeConstants.TextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      CustomDropDownSingle(
                        selectedValue: _.documentTypeSelectedName,
                        model: getDropdownModel(_.loadingDocumentType.value,
                            _.documentTypeSelectedName, _.documenttypeName),
                        callbackFunction: callbackDocumentType,
                        initialSelectedValue: getSelectedDropDown(
                            _.loadingDocumentType.value,
                            _.documentTypeSelectedName,
                            _.documenttypeName),
                        choosefieldtype: false,
                      ),
                      if (_.documentTypeSelectedID == 3)
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 10),
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: CustomAutoSizeTextMontserrat(
                              text: "Organization Name",
                              mandatory: true,
                              textColor: ThemeConstants.TextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      if (_.documentTypeSelectedID == 3)
                        CustomDropDownSingle(
                          selectedValue: _.organizationSelectedName,
                          model: getDropdownModel(_.loadingOrgName.value,
                              _.organizationSelectedName, _.organizationName),
                          callbackFunction: callbackOrganization,
                          initialSelectedValue: getSelectedDropDown(
                              _.loadingOrgName.value,
                              _.organizationSelectedName,
                              _.organizationName),
                          choosefieldtype: false,
                        ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 20, right: 10),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: CustomAutoSizeTextMontserrat(
                            text: "Document Name",
                            mandatory: true,
                            textColor: ThemeConstants.TextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      CustomDropDownSingle(
                        selectedValue: _.documentNameSelectedName,
                        model: getDropdownModel(_.loadingDocumentName.value,
                            _.documentNameSelectedName, _.documentNameName),
                        callbackFunction: callbackDocumentName,
                        initialSelectedValue: getSelectedDropDown(
                            _.loadingDocumentName.value,
                            _.documentNameSelectedName,
                            _.documentNameName),
                        choosefieldtype: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (_.documentNameSelectedName != null)
                        Row(
                          children: [
                            const Spacer(),
                            SizedBox(
                              width: 100,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: ThemeConstants.bluecolor, backgroundColor: ThemeConstants.bluecolor, elevation: 5.0, // foreground
                                ),
                                onPressed: () {
                                  getSourceSelected(callbackSelectedSource1,
                                      _.documentNameSelectedID.toString(),
                                      OrgName: getNUllChecker(
                                                  _.organizationSelectedName) ==
                                              false
                                          ? ("${_.organizationSelectedName!.split("[")[0]}_${_.organizationSelectedID}")
                                          : "");
                                },
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Upload",
                                  textColor: ThemeConstants.whitecolor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                      ...documentList(_.documentModel, context)
                    ],
                  ),
                ),
              ],
            );
          }),
        ));
  }

  //Function
  callbackFunction(data) {}

  //Function
  List getDropdownModel(bool loading, String? selected, List model) {
    try {
      if (loading == true) {
        return model;
      } else {
        return ["No data"];
      }
    } catch (e) {
      return ["No data"];
    }
  }

  String getSelectedDropDown(bool loading, String? selected, List model) {
    try {
      if (loading == true) {
        if (selected == null) {
          return model[0].toString();
        } else {
          return selected;
        }
      } else {
        return "No data";
      }
    } catch (e) {
      return "No data";
    }
  }

  //Callback Funcation
  callbackDocumentType(varTopic) {
    for (var i = 0; i < controller.documenttypeName.length; i++) {
      if (i == 0) {
        controller.documentTypeSelectedName = null;
        controller.documentTypeSelectedID = null;
      } else {
        if (controller.documenttypeName[i] == varTopic) {
          controller.documentTypeSelectedName = controller.documenttypeName[i];
          controller.documentTypeSelectedID = controller.documenttypeId[i];
          if (controller.documenttypeId[i] == 3) {
          } else {
            controller.getDocumentName(
                Get.find<BaseController>().model1.id.toString(),
                controller.documenttypeId[i].toString());
          }
          controller.documentNameSelectedName = null;
          controller.documentNameSelectedID = null;
          controller.organizationSelectedName = null;
          controller.organizationSelectedID = null;
          controller.update();
        }
      }
    }
  }

  callbackOrganization(varTopic) {
    for (var i = 0; i < controller.organizationName.length; i++) {
      if (i == 0) {
        controller.organizationSelectedName = null;
        controller.organizationSelectedID = null;
      } else {
        if (controller.organizationName[i] == varTopic) {
          controller.organizationSelectedName = controller.organizationName[i];
          controller.organizationSelectedID = controller.organizationId[i];
          controller.getDocumentName(
              Get.find<BaseController>().model1.id.toString(), "3",
              organizationName:
                  "${controller.organizationName[i].splitMapJoin("[")[0]}_${controller.organizationId[i]}");
          controller.update();
        }
      }
    }
  }

  callbackDocumentName(varTopic) {
    for (var i = 0; i < controller.documentNameName.length; i++) {
      if (i == 0) {
        controller.documentNameSelectedName = null;
        controller.documentNameSelectedID = null;
      } else {
        if (controller.documentNameName[i] == varTopic) {
          controller.documentNameSelectedName = controller.documentNameName[i];
          controller.documentNameSelectedID = controller.documentNameId[i];
          controller.update();
        }
      }
    }
  }

  documentList(List<CommonUploadDocument> model, BuildContext context) {
    List<Widget> documentlist = [];
    List temp = [];

    for (var i = 0; i < model.length; i++) {
      temp.add(model[i].documentParentCategory);
    }
    temp = temp.toSet().toList();
    List<Map<String, List<Widget>>> list = [];
    for (var i = 0; i < temp.length; i++) {
      list.add({temp[i]: []});
    }

    for (var i = 0; i < model.length; i++) {
      for (var j = 0; j < list.length; j++) {
        if (list[j].entries.first.key == model[i].documentParentCategory) {
          list[j].entries.first.value.add(Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(

                  decoration: BoxDecoration(
                    color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: ThemeConstants.bluecolor.withOpacity(0.5),
                          spreadRadius: -2.5,
                          blurRadius: 5,
                          offset: const Offset(0, 4.5),
                        )
                      ],
                      // border: Border.all(color: ThemeConstants.TextColor),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 120,
                          child: CustomAutoSizeTextMontserrat(
                            text: model[i].documentName,
                            textColor: ThemeConstants.bluecolor,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                            width: 55,
                            child: FileDownload(url: model[i].viewlink!)),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            getViewDocument(model[i].viewlink!);
                          },
                          child: Container(
                            height: 35,
                            width: 55,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: ThemeConstants.bluecolor),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child: Center(
                              child: Icon(
                                Icons.remove_red_eye,
                                size: 18,
                                color: ThemeConstants.bluecolor,
                              ),
                              // child: CustomAutoSizeTextMontserrat(
                              //   text: "View",
                              //   fontSize: 10,
                              //   fontWeight: FontWeight.w500,
                              //   textColor: ThemeConstants.orangeColor,
                              // ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        }
      }
    }
    for (var i = 0; i < list.length; i++) {
      documentlist.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: list[i].entries.first.key,
            textColor: ThemeConstants.bluecolor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ));
      documentlist.addAll(list[i].entries.first.value);
    }
    return documentlist;
  }

// Function

  Future<void> shareFile(String filepath) async {
    await FlutterShare.shareFile(
      title: filepath,
      filePath: filepath,
    );
  }

  getViewDocument(String url) {
    print(url);
    String extension = url.split('.').last;
    print(extension);
    if (extension == "pdf") {
      return Get.to(CustomDocumentViewer(
        url: url,
      ));
    } else if (extension == "doc") {
      Get.to(CustomDocumentViewer(
        url: url,
      ));
    } else if (extension == "docx") {
      Get.to(CustomDocumentViewer(
        url: url,
      ));
    } else {
      Get.to(CustomImageViewer(
        url: url,
      ));
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
        Get.find<UploadDocumentController>()
            .uploadDocument(temp[1], orgname: temp[2]);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
