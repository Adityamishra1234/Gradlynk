import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentpanel/ui/screen/FeedBack/controller/feedbackcontroller.dart';
import 'package:studentpanel/ui/screen/FeedBack/models/feedbackmodels.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/checkBox/checkBox.dart';
import 'package:studentpanel/widgets/checkBox/multiSelected_checkBox.dart';
import 'package:studentpanel/widgets/custom_text_field_square.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/custombutton.dart';
import 'package:studentpanel/widgets/customtextfield.dart';

class FeedbackPage extends StatelessWidget {
  String enq_id;
  String event_id;
  String phoneNumber;
  FeedbackPage(
      {required this.enq_id,
      required this.event_id,
      required this.phoneNumber});
  TextEditingController textController = TextEditingController();

  static const routeNamed = '/Feedback';

  var controller = Get.put(feedBackController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.remove("Route");
        Get.toNamed(DashBoard.routeNamed);
        return true;
      },
      child: Scaffold(
          body: controller.obx(onLoading: getLoading(context), (state) {
        return SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: "FEEDBACK FORM",
                    textColor: ThemeConstants.bluecolor,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(),
                  CustomAutoSizeTextMontserrat(
                    text: "Rate your overall event experience",
                    mandatory: true,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () async {
                          controller.numberOfStar = index + 1;
                          controller.getCheckBox((index + 1).toString());
                          controller.update();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.star,
                            color: controller.numberOfStar >= index + 1
                                ? const Color(0xFFFFC107)
                                : ThemeConstants
                                    .lightgreycolor, // Color of the star's fill
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //less than 3
                  if (controller.numberOfStar <= 3)
                    CustomAutoSizeTextMontserrat(
                      text:
                          "We apologise for the inconvenience.\n Kindly select the area(s) of dissatisfaction.",
                      mandatory: true,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  if (controller.numberOfStar <= 3)
                    CustomMultiSelectedCheckbox(
                        items: controller.items,
                        selectedValues: controller.selectedValues,
                        onSelectionChanged: (value) {
                          controller.selectedValues = value;
                          controller.update();
                        }),

                  // 4 start
                  if (controller.numberOfStar == 4)
                    CustomAutoSizeTextMontserrat(
                      text: "Kindly select area(s) of improvement",
                      mandatory: true,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  if (controller.numberOfStar == 4)
                    CustomMultiSelectedCheckbox(
                        items: controller.items,
                        selectedValues: controller.selectedValues,
                        onSelectionChanged: (value) {
                          controller.selectedValues = value;
                          controller.update();
                        }),
                  // 5 start
                  if (controller.numberOfStar == 5)
                    CustomAutoSizeTextMontserrat(
                      text: "Kindly select area(s) of satisfaction",
                      mandatory: true,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  if (controller.numberOfStar == 5)
                    CustomMultiSelectedCheckbox(
                        items: controller.items,
                        selectedValues: controller.selectedValues,
                        onSelectionChanged: (value) {
                          controller.selectedValues = value;
                          controller.update();
                        }),
                  CustomAutoSizeTextMontserrat(
                    text: "Write your Feedback",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        controller: textController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      )),

                  // CustomTextFieldSquare(
                  //   hint: 'Kindly enter your feedback',
                  //   controller: textController,
                  //   borderRadius: 10.0,
                  // )),

                  //   CustomTextField(
                  //     keybord: TextInputType.number,
                  //     hint: "Kindly enter your feedback",
                  //     controller: textController,
                  //   ),
                  // ),

                  CheckboxWithTextSelected(
                    text: 'Opt for latest SIEC News and Updates.',
                    isSelected: controller.optUpdate,
                    onChanged: (bool value) {
                      controller.optUpdate = value;
                      controller.update();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: CustomButton(
                        text: "Submit",
                        onPressed: () {
                          List temp = [];
                          for (var i = 0;
                              i < controller.selectedValues.length;
                              i++) {
                            if (controller.selectedValues[i] == true) {
                              temp.add(controller.items[i]);
                            }
                          }
                          if (controller.numberOfStar == 0) {
                            getToast(SnackBarConstants.feedbackpart1);
                          } else if (temp.isEmpty) {
                            getToast(SnackBarConstants.feedbackpart2);
                          } else {
                            FeedBackModel model = FeedBackModel();
                            model.enqId = enq_id;
                            model.eventId = event_id;
                            model.rating = controller.numberOfStar.toString();
                            model.feedback = textController.text;
                            model.optUpdate = controller.optUpdate;
                            if (controller.numberOfStar <= 3) {
                              model.complaint = temp;
                            } else if (controller.numberOfStar == 4) {
                              model.suggestion = temp;
                            } else {
                              model.compliment = temp;
                            }
                            controller.UpdateFeedback(model);
                          }
                        },
                        backgroundColor: ThemeConstants.bluecolor,
                        radius: 10.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      })),
    );
  }
}
