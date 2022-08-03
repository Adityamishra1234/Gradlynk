import 'dart:io' as io;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/uploaddocumentcontroller.dart';
import 'package:studentpanel/ui/screen/imageviewerscreen.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownbutton.dart';
import 'package:studentpanel/widgets/drawerfilter.dart';

class UploadDocument extends StatelessWidget {
  UploadDocument({Key? key}) : super(key: key);
  static const routeNamed = '/UploadDocument';

  var controller = Get.put(UploadDocumentController());

  callback(varTopic) {
    print("mandatory" + varTopic);
    controller.setLoadingHighestQualification(true);

    // dashboardcontroller.setdropdown1(varTopic);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(UploadDocument.routeNamed),
        drawer: DrawerFilter(),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: GetBuilder<UploadDocumentController>(
              builder: (_) => ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: CustomAutoSizeTextMontserrat(
                        text: "Upload Documents",
                        maxLines: 1,
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
                            border: Border.all(color: Colors.black),
                            color: const Color(0xFF1940B3),
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
                            decoration: const BoxDecoration(
                              color: Color(0xFF1940B3),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "________",
                          maxLines: 1,
                          textColor: const Color(0xFF1940B3),
                          fontWeight: FontWeight.w900,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: const BoxDecoration(
                              color: Color(0xFF1940B3),
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
                                color: const Color(0xFF1940B3),
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
                          maxLines: 1,
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
                            maxLines: 1,
                            textColor: Colors.grey,
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 200,
                            child: CustomDropDown(
                              model: const ["1", "2", "3"],
                              callbackFunction: callback,
                              hint: "Highest Qualification",
                              textColor: Colors.black,
                            ),
                          ),
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
                                maxLines: 1,
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
                                                          debugPrint(
                                                              file1.extension);
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
                                            "assets/icons/add.svg",
                                          ),
                                        )
                                      : IconButton(
                                          onPressed: () {},
                                          icon: SvgPicture.asset(
                                            "assets/icons/eye.svg",
                                            color: const Color(0xFF1940B3),
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
                                                          debugPrint(
                                                              file1.extension);
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
                                                          debugPrint(
                                                              file1.extension);
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
                                            color: const Color(0xFF1940B3),
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
                                maxLines: 1,
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
                                                          debugPrint(
                                                              file1.extension);
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
                                            color: const Color(0xFF1940B3),
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
                                primary: const Color(0xFF1940B3), // background
                                onPrimary:
                                    const Color(0xFF1940B3), // foreground
                              ),
                              onPressed: () {},
                              child: CustomAutoSizeTextMontserrat(
                                text: "Submit",
                                maxLines: 1,
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
