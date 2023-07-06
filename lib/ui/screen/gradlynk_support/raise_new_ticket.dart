import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/controllers/raise_new_ticket_controller.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

class RaiseYourTicket extends StatefulWidget {
  const RaiseYourTicket({super.key});
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar("sd"),
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
                    padding: const EdgeInsets.all(8.0),
                    child: CustomAutoSizeTextMontserrat(
                      text: "Use this ticket to",
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
                              const BorderRadius.all(Radius.circular(10.0)),
                          border:
                              Border.all(width: 0.5, color: ThemeConstants.red),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomAutoSizeTextMontserrat(
                            text: "Raise an issue",
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
                              const BorderRadius.all(Radius.circular(10.0)),
                          border: Border.all(
                              width: 0.5, color: ThemeConstants.GreenColor),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomAutoSizeTextMontserrat(
                            text: "Provide A Feedback",
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
                      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                      child: CustomAutoSizeTextMontserrat(
                        text:
                            "We apologise for the inconvenience.\nKindly specify your issue:",
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
                                getToast(SnackBarConstants.fileSelectedError2!);
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
                      padding: const EdgeInsets.all(8.0),
                      child: CustomAutoSizeTextMontserrat(
                        text:
                            "We appreciate your efforts.\nKindly provide your valuable feedback.",
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
                                    getToast(
                                        SnackBarConstants.raiseIssueError!);
                                  }
                                }
                                if (controller.suggestAnImprovisation.value ==
                                    true) {
                                  if (suggesationController.text.isEmpty) {
                                    temp = false;
                                    getToast(SnackBarConstants.feedBackError!);
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
                                    files.isNotEmpty ? files[0] : "",
                                    files.isNotEmpty ? files[1] : "",
                                  );
                                  if (res != null) {
                                    getToast(SnackBarConstants.raiseIssue!);
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
