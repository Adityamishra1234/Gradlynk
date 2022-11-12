// ignore_for_file: deprecated_member_use

import 'dart:io' as io;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/uploaddocumentcontroller.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';
import 'package:studentpanel/widgets/customdropdownbutton.dart';
import 'package:studentpanel/widgets/drawerfilter.dart';

class UploadDocument extends StatelessWidget {
  UploadDocument({Key? key}) : super(key: key);
  static const routeNamed = '/UploadDocument';

  var controller = Get.put(UploadDocumentController());

  callback(varTopic) {
    controller.setLoadingHighestQualification(true);

    // dashboardcontroller.setdropdown1(varTopic);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(UploadDocument.routeNamed),
        drawer: CustomDrawer(),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: GetBuilder<UploadDocumentController>(
              builder: (_) => ListView(
                controller: ScrollController(),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: CustomAutoSizeTextMontserrat(
                        text: "Upload Documents",
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    child: Row(
                      children: [
                        const Spacer(),
                        // ClipRRect(
                        //     borderRadius: BorderRadius.circular(8.0),
                        //     child: SvgPicture.asset(
                        //       "assets/icons/Qualification.svg",
                        //       height: 40,
                        //       color: Colors.red,
                        //     )),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: ThemeConstants.bluecolor,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 10, bottom: 10),
                            child: SvgPicture.asset(
                              "assets/icons/Qualification.svg",
                              height: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, top: 10),
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: ThemeConstants.bluecolor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "________",
                          textColor: ThemeConstants.bluecolor,
                          fontWeight: FontWeight.w900,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: ThemeConstants.bluecolor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 7),
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: ThemeConstants.bluecolor,
                                shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, bottom: 10),
                              child: SvgPicture.asset(
                                "assets/icons/upload_doc.svg",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, top: 10),
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "________",
                          textColor: Colors.grey,
                          fontWeight: FontWeight.w900,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 7),
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                // borderRadius: ,
                                color: Colors.white,
                                shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, bottom: 10, right: 10),
                              child: SvgPicture.asset(
                                "assets/icons/submit.svg",
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                  if (_.loadingHighestQualification.value == false)
                    SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          CustomAutoSizeTextMontserrat(
                            text: "Highest Qualification",
                            textColor: Colors.grey,
                          ),
                          const Spacer(),
                          // SizedBox(
                          //   width: 200,
                          //   child: CustomDropDown(
                          //     model: const ["1", "2", "3"],
                          //     callbackFunction: callback,
                          //     hint: "Highest Qualification",
                          //     textColor: Colors.black,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  if (_.loadingHighestQualification.value == false)
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                        height: 5,
                        thickness: 1,
                      ),
                    ),
                  if (_.loadingHighestQualification.value == true)
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: SizedBox(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Add Degree",
                                textColor: Colors.grey,
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 50,
                              // custom Text field
                              child: Padding(
                                  padding: const EdgeInsets.only(top: 0),
                                  child: _.loadingDegree.value == false
                                      ? IconButton(
                                          onPressed: () {
                                            Get.bottomSheet(Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(40.0),
                                                  // bottomRight:
                                                  //     Radius.circular(40.0),
                                                  topLeft:
                                                      Radius.circular(40.0),
                                                  // bottomLeft:
                                                  //     Radius.circular(40.0)),
                                                ),
                                              ),
                                              height: 210,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 30),
                                                    child:
                                                        CustomAutoSizeTextMontserrat(
                                                      text: "Select Source",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Row(
                                                    children: [
                                                      const Spacer(),
                                                      FlatButton(
                                                        onPressed: () => {},
                                                        color: ThemeConstants
                                                            .whitecolor,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Column(
                                                          // Replace with a Row for horizontal icon + text
                                                          children: <Widget>[
                                                            SvgPicture.asset(
                                                              "assets/icons/camera.svg",
                                                              height: 50,
                                                              width: 50,
                                                              color:
                                                                  ThemeConstants
                                                                      .bluecolor,
                                                            ),
                                                            CustomAutoSizeTextMontserrat(
                                                              text: "Camera",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 80,
                                                      ),
                                                      FlatButton(
                                                        onPressed: () async {
                                                          FilePickerResult?
                                                              result =
                                                              await FilePicker
                                                                  .platform
                                                                  .pickFiles();

                                                          if (result != null) {
                                                            PlatformFile file1 =
                                                                result.files
                                                                    .first;
                                                            io.File file =
                                                                io.File(result
                                                                    .files
                                                                    .single
                                                                    .path!);

                                                            _.setLoadingDegree(
                                                                true);

                                                            // ));
                                                          } else {
                                                            Get.back();
                                                            // User canceled the picker
                                                          }
                                                        },
                                                        color: ThemeConstants
                                                            .whitecolor,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Column(
                                                          // Replace with a Row for horizontal icon + text
                                                          children: <Widget>[
                                                            SvgPicture.asset(
                                                              "assets/icons/gallery.svg",
                                                              height: 50,
                                                              width: 50,
                                                              color:
                                                                  ThemeConstants
                                                                      .bluecolor,
                                                            ),
                                                            CustomAutoSizeTextMontserrat(
                                                              text: "Gallery",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                    ],
                                                  ),
                                                  const Spacer()
                                                ],
                                              ),
                                            ));
                                          },
                                          icon: SvgPicture.asset(
                                            "assets/icons/add.svg",
                                          ),
                                        )
                                      : IconButton(
                                          onPressed: () {},
                                          icon: SvgPicture.asset(
                                            "assets/icons/eye.svg",
                                            color: ThemeConstants.bluecolor,
                                          ))),
                            )
                          ],
                        ),
                      ),
                    ),
                  if (_.loadingHighestQualification.value == true)
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                        height: 5,
                        thickness: 1,
                      ),
                    ),
                  if (_.loadingHighestQualification.value == true)
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: SizedBox(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Add Sr. secondary certificate",
                                maxLines: 2,
                                textColor: Colors.grey,
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 50,
                              // custom Text field
                              child: Padding(
                                  padding: const EdgeInsets.only(top: 0),
                                  child: _.loadingSrSecondary.value == false
                                      ? IconButton(
                                          onPressed: () {
                                            Get.bottomSheet(Container(
                                              height: 140,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Colors.white,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 50,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: Colors
                                                            .white, // background
                                                        onPrimary: Colors
                                                            .white, // foreground
                                                      ),
                                                      onPressed: () async {
                                                        FilePickerResult?
                                                            result =
                                                            await FilePicker
                                                                .platform
                                                                .pickFiles();

                                                        if (result != null) {
                                                          PlatformFile file1 =
                                                              result
                                                                  .files.first;
                                                          io.File file =
                                                              io.File(result
                                                                  .files
                                                                  .single
                                                                  .path!);

                                                          _.setLoadingSrSecondary(
                                                              true);
                                                        } else {
                                                          Get.back();
                                                          // User canceled the picker
                                                        }
                                                      },
                                                      child: const Text(
                                                        'Gallery',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    color: Colors.grey,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: SizedBox(
                                                      height: 50,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary: Colors
                                                              .red, // background
                                                          onPrimary: Colors
                                                              .white, // foreground
                                                        ),
                                                        onPressed: () {},
                                                        child: const Text(
                                                            'Camera'),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ));
                                          },
                                          icon: SvgPicture.asset(
                                            "assets/icons/add.svg",
                                          ),
                                        )
                                      : IconButton(
                                          onPressed: () {
                                            Get.bottomSheet(Container(
                                              height: 140,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Colors.white,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 50,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: Colors
                                                            .white, // background
                                                        onPrimary: Colors
                                                            .white, // foreground
                                                      ),
                                                      onPressed: () async {
                                                        FilePickerResult?
                                                            result =
                                                            await FilePicker
                                                                .platform
                                                                .pickFiles();

                                                        if (result != null) {
                                                          PlatformFile file1 =
                                                              result
                                                                  .files.first;
                                                          io.File file =
                                                              io.File(result
                                                                  .files
                                                                  .single
                                                                  .path!);

                                                          _.setLoadingDegree(
                                                              true);

                                                          // ));
                                                        } else {
                                                          Get.back();
                                                          // User canceled the picker
                                                        }
                                                      },
                                                      child: const Text(
                                                        'Gallery',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    color: Colors.grey,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: SizedBox(
                                                      height: 50,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary: Colors
                                                              .red, // background
                                                          onPrimary: Colors
                                                              .white, // foreground
                                                        ),
                                                        onPressed: () {},
                                                        child: const Text(
                                                            'Camera'),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ));
                                          },
                                          icon: SvgPicture.asset(
                                            "assets/icons/eye.svg",
                                            color: ThemeConstants.bluecolor,
                                          ))),
                            )
                          ],
                        ),
                      ),
                    ),
                  if (_.loadingHighestQualification.value == true)
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                        height: 5,
                        thickness: 1,
                      ),
                    ),
                  if (_.loadingHighestQualification.value == true)
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: SizedBox(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Add secondary certificate",
                                textColor: Colors.grey,
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 50,
                              // custom Text field
                              child: Padding(
                                  padding: const EdgeInsets.only(top: 0),
                                  child: _.loadingSecondary.value == false
                                      ? IconButton(
                                          onPressed: () {
                                            Get.bottomSheet(Container(
                                              height: 140,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Colors.white,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 50,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: Colors
                                                            .white, // background
                                                        onPrimary: Colors
                                                            .white, // foreground
                                                      ),
                                                      onPressed: () async {
                                                        FilePickerResult?
                                                            result =
                                                            await FilePicker
                                                                .platform
                                                                .pickFiles();

                                                        if (result != null) {
                                                          PlatformFile file1 =
                                                              result
                                                                  .files.first;
                                                          io.File file =
                                                              io.File(result
                                                                  .files
                                                                  .single
                                                                  .path!);

                                                          _.setLoadingSecondary(
                                                              true);

                                                          // ));
                                                        } else {
                                                          Get.back();
                                                          // User canceled the picker
                                                        }
                                                      },
                                                      child: const Text(
                                                        'Gallery',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    color: Colors.grey,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: SizedBox(
                                                      height: 50,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary: Colors
                                                              .red, // background
                                                          onPrimary: Colors
                                                              .white, // foreground
                                                        ),
                                                        onPressed: () {},
                                                        child: const Text(
                                                            'Camera'),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ));
                                          },
                                          icon: SvgPicture.asset(
                                            "assets/icons/add.svg",
                                          ),
                                        )
                                      : IconButton(
                                          onPressed: () {},
                                          icon: SvgPicture.asset(
                                            "assets/icons/eye.svg",
                                            color: ThemeConstants.bluecolor,
                                          ))),
                            )
                          ],
                        ),
                      ),
                    ),
                  if (_.loadingHighestQualification.value == true)
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                        height: 5,
                        thickness: 1,
                      ),
                    ),
                  if (_.loadingDegree.value == true &&
                      _.loadingSrSecondary.value == true &&
                      _.loadingSecondary.value == true)
                    Padding(
                      padding: const EdgeInsets.only(top: 10, right: 15),
                      child: Row(
                        children: [
                          const Spacer(),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: ThemeConstants.bluecolor, // background
                                onPrimary:
                                    ThemeConstants.bluecolor, // foreground
                              ),
                              onPressed: () {},
                              child: CustomAutoSizeTextMontserrat(
                                text: "Submit",
                                textColor: Colors.white,
                              )),
                        ],
                      ),
                    )
                ],
              ),
            )));
  }
}
