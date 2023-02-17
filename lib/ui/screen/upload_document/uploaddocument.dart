// ignore_for_file: deprecated_member_use
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/controllers/uploaddocumentcontroller.dart';
import 'package:studentpanel/ui/models/commonuploaddocument.dart';
import 'package:studentpanel/ui/screen/test/downloadtestfile.dart';
import 'package:studentpanel/ui/screen/test/takepicturescreen.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/custom_doc_viewer.dart';
import 'package:studentpanel/widgets/custom_image_viewer.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';
import 'package:path_provider/path_provider.dart';

class UploadDocument extends StatefulWidget {
  UploadDocument({Key? key}) : super(key: key);
  static const routeNamed = '/UploadDocument';

  @override
  State<UploadDocument> createState() => _UploadDocumentState();
}

class _UploadDocumentState extends State<UploadDocument> {
  var controller = Get.put(UploadDocumentController());
  double? progress;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
    double width = MediaQuery.of(context).size.width;
    if (displayMobileLayout == true) {
      width = width - 240;
    }
    return Scaffold(
        appBar: CustomAppBar(""),
        drawer: displayMobileLayout == false ? const CustomDrawer() : null,
        body: GetBuilder<UploadDocumentController>(builder: (_) {
          documentList(_.documentModel, context);
          return Row(
            children: [
              if (displayMobileLayout == true) const CustomDrawer(),
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: CustomAutoSizeTextMontserrat(
                        text: "My Document",
                        fontSize: 20,
                        textColor: ThemeConstants.bluecolor,
                        fontWeight: FontWeight.bold,
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
                        padding:
                            const EdgeInsets.only(top: 10, left: 20, right: 10),
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
                                elevation: 0.0,
                                primary: ThemeConstants.bluecolor, // background
                                onPrimary:
                                    ThemeConstants.bluecolor, // foreground
                              ),
                              onPressed: () {
                                print(
                                    "${_.organizationSelectedName!.split("[")[0]}_${_.organizationSelectedID}");
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
        }));
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
          print(controller.organizationName[i].split(" [")[0]);
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
                      border: Border.all(color: ThemeConstants.TextColor),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        const Spacer(),
                        SizedBox(
                          width: 120,
                          child: CustomAutoSizeTextMontserrat(
                            text: model[i].documentName,
                            textColor: ThemeConstants.bluecolor,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            downloadFile(model[i].viewlink!);
                          },
                          child: Container(
                            height: 35,
                            width: 90,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: ThemeConstants.bluecolor),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0))),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Download",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  textColor: ThemeConstants.bluecolor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            getViewDocument(model[i].viewlink!);
                          },
                          child: Container(
                            height: 35,
                            width: 70,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ThemeConstants.orangeColor),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0))),
                            child: Center(
                              child: CustomAutoSizeTextMontserrat(
                                text: "View",
                                fontWeight: FontWeight.w500,
                                textColor: ThemeConstants.orangeColor,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
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
        padding: const EdgeInsets.only(left: 15, top: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: list[i].entries.first.key,
            textColor: ThemeConstants.bluecolor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ));
      documentlist.addAll(list[i].entries.first.value);
    }
    return documentlist;
  }

// Function

  Future<bool> saveVideo(String url, String fileName) async {
    Directory directory;
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = (await getExternalStorageDirectory())!;
          String newPath = "";
          List<String> paths = directory.path.split("/");
          for (int x = 1; x < paths.length; x++) {
            String folder = paths[x];
            if (folder != "Android") {
              newPath += "/$folder";
            } else {
              break;
            }
          }
          newPath = "$newPath/SIEC";
          directory = Directory(newPath);
        } else {
          return false;
        }
      } else {
        if (await _requestPermission(Permission.storage)) {
          directory = await getApplicationDocumentsDirectory();
        } else {
          return false;
        }
      }
      File saveFile = File("${directory.path}/$fileName");
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        await dio.download(url, saveFile.path,
            onReceiveProgress: (value1, value2) {
          setState(() {
            progress = value1 / value2;
            print(progress);
          });
        });
        if (Platform.isIOS) {
          shareFile(saveFile.path);
        }
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  downloadFile(String url) async {
    setState(() {
      loading = true;
      progress = 0;
    });
    bool downloaded = await saveVideo(url,
        reverseStringUsingSplit(reverseStringUsingSplit(url).split("/")[0]));
    if (downloaded) {
      if (Platform.isAndroid) {
        Get.snackbar("File download", "complete download",
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      print("Problem Downloading File");
    }
    setState(() {
      loading = false;
    });
  }

  Future<void> shareFile(String filepath) async {
    await FlutterShare.shareFile(
      title: filepath,
      filePath: filepath,
    );
  }

  getViewDocument(String url) {
    if (url.contains("pdf")) {
      return Get.to(CustomDocumentViewer(
        url: url,
      ));
    } else if (url.contains("doc")) {
      Get.to(CustomDocumentViewer(
        url: url,
      ));
    } else if (url.contains("docx")) {
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
        Get.to(TakePictureScreen(
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
