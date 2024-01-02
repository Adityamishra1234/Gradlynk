import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/trackyourticketscontroller.dart';
import 'package:studentpanel/ui/models/ticketdatamodel.dart';
import 'package:studentpanel/ui/screen/gradlynk_support/completeticketview.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:rounded_background_text/rounded_background_text.dart';
import 'package:studentpanel/widgets/customdrawer.dart';
import 'package:studentpanel/widgets/empty_widget.dart';

class TrackyourTickets extends GetView<TrackYourTicketsController> {
  TrackyourTickets({super.key});
  @override
  var controller = Get.put(TrackYourTicketsController());
  static const routeNamed = '/TrackyourTickets';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('title'),
      drawer: CustomDrawer(
        index: 10,
      ),
      body: controller.obx(
        onLoading: getLoading(context),
        (state) => Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomAutoSizeTextMontserrat(
                  text: "Track Your Tickets",
                  fontSize: 22,
                  textColor: ThemeConstants.bluecolor,
                ),
              ),
            ),
            Row(
              children: [
                const Spacer(),
                InkWell(
                  onTap: () {
                    // Get.find<TrackYourTicketsController>().chooseOption =
                    //     1.obs;
                    controller.chooseOption = 1.obs;
                    controller.update();
                  },
                  child: Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                        color: controller.chooseOption.value == 1
                            ? ThemeConstants.orangeColor
                            : ThemeConstants.whitecolor,
                        border: Border.all(color: ThemeConstants.orangeColor),
                        borderRadius: BorderRadiusDirectional.circular(5.0)),
                    child: Center(
                      child: CustomAutoSizeTextMontserrat(
                          text: "Waiting",
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          textColor: controller.chooseOption.value == 1
                              ? ThemeConstants.whitecolor
                              : ThemeConstants.orangeColor),
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    // Get.find<TrackYourTicketsController>().chooseOption =
                    //     2.obs;
                    controller.chooseOption = 2.obs;
                    controller.update();
                  },
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                        color: controller.chooseOption.value == 2
                            ? ThemeConstants.GreenColor
                            : ThemeConstants.whitecolor,
                        border: Border.all(color: ThemeConstants.GreenColor),
                        borderRadius: BorderRadiusDirectional.circular(5.0)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: CustomAutoSizeTextMontserrat(
                            text: "Resolving",
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            textColor: controller.chooseOption.value == 2
                                ? ThemeConstants.whitecolor
                                : ThemeConstants.GreenColor),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    controller.chooseOption = 3.obs;
                    controller.update();
                  },
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                        color: controller.chooseOption.value == 3
                            ? ThemeConstants.VioletColor
                            : ThemeConstants.whitecolor,
                        border: Border.all(color: ThemeConstants.VioletColor),
                        borderRadius: BorderRadiusDirectional.circular(5.0)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: CustomAutoSizeTextMontserrat(
                            text: "Resolved",
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            textColor: controller.chooseOption.value == 3
                                ? ThemeConstants.whitecolor
                                : ThemeConstants.VioletColor),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            if (controller.chooseOption.value == 1)
              if (controller.model.value!.data!.length != 0)
                Expanded(
                  child: ListView.builder(
                      itemCount: controller.model.value != null
                          ? controller.model.value!.data!.length
                          : 0,
                      itemBuilder: (BuildContext context, int index) {
                        if (controller.model.value!.data![index].queryStatus ==
                                1 &&
                            controller.model.value!.data![index].issue !=
                                null) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, right: 5, left: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(width: 0.5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0))),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(CompleteTicketView(
                                          model: controller
                                              .model.value!.data![index],
                                        ));
                                      },
                                      child: CustomAutoSizeTextMontserrat(
                                        maxLines: 2,
                                        text: controller
                                            .model.value!.data![index].issue,
                                        textColor: ThemeConstants.bluecolor,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: CustomAutoSizeTextMontserrat(
                                        text: controller.model.value!
                                            .data![index].createdAt!
                                            .split("T")[0],
                                        textColor: ThemeConstants.TextColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }),
                ),
            //Resolving
            if (controller.chooseOption.value == 2)
              if (controller.model.value!.data!.length != 0)
                Expanded(
                  child: ListView.builder(
                      itemCount: controller.model.value != null
                          ? controller.model.value!.data!.length
                          : 0,
                      itemBuilder: (BuildContext context, int index) {
                        if (controller.model.value!.data![index].queryStatus ==
                            2) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, right: 5, left: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(width: 0.5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0))),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(CompleteTicketView(
                                          model: controller
                                              .model.value!.data![index],
                                        ));
                                      },
                                      child: CustomAutoSizeTextMontserrat(
                                        maxLines: 2,
                                        text: controller
                                            .model.value!.data![index].issue,
                                        textColor: ThemeConstants.bluecolor,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: CustomAutoSizeTextMontserrat(
                                        text: controller.model.value!
                                            .data![index].createdAt!
                                            .split("T")[0],
                                        textColor: ThemeConstants.TextColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                    if (controller.model.value!.data![index]
                                        .comments!.isNotEmpty)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: CustomAutoSizeTextMontserrat(
                                          text:
                                              "Gradlynk Support${"  ${controller.model.value!.data![index].createdAt!.split("T")[0]}"}",
                                          textColor: ThemeConstants.TextColor,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 12,
                                        ),
                                      ),
                                    if (controller.model.value!.data![index]
                                        .comments!.isNotEmpty)
                                      CustomAutoSizeTextMontserrat(
                                        text: controller.model.value!
                                            .data![index].firstComment,
                                        textColor: ThemeConstants.TextColor,
                                        fontSize: 12,
                                      ),
                                    Align(
                                      alignment: AlignmentDirectional.topEnd,
                                      child: InkWell(
                                        onTap: () {
                                          if (controller
                                              .model
                                              .value!
                                              .data![index]
                                              .comments!
                                              .isNotEmpty) {
                                            getDailogViewHistory(
                                                controller.model.value!
                                                    .data![index].comments!,
                                                index,
                                                controller.model.value!
                                                    .data![index].id!);
                                          }
                                        },
                                        child: Container(
                                          height: 35,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              color: ThemeConstants.bluecolor,
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0, right: 10.0),
                                            child: Center(
                                              child:
                                                  CustomAutoSizeTextMontserrat(
                                                text: "View History",
                                                textColor:
                                                    ThemeConstants.whitecolor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }),
                ),
            if (controller.chooseOption.value == 3)
              if (controller.model.value!.data!.length != 0)
                Expanded(
                  child: ListView.builder(
                      itemCount: controller.model.value != null
                          ? controller.model.value!.data!.length
                          : 0,
                      itemBuilder: (BuildContext context, int index) {
                        if (controller.model.value!.data![index].queryStatus ==
                            3) {
                          if (controller
                                  .model.value!.data![index].firstComment !=
                              null) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, bottom: 5, right: 5, left: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(width: 0.5),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.to(CompleteTicketView(
                                            model: controller
                                                .model.value!.data![index],
                                          ));
                                        },
                                        child: CustomAutoSizeTextMontserrat(
                                          maxLines: 2,
                                          text: controller
                                              .model.value!.data![index].issue,
                                          textColor: ThemeConstants.bluecolor,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: CustomAutoSizeTextMontserrat(
                                          text: controller.model.value!
                                              .data![index].createdAt!
                                              .split("T")[0],
                                          textColor: ThemeConstants.TextColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                      if (controller.model.value!.data![index]
                                              .firstComment !=
                                          null)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: CustomAutoSizeTextMontserrat(
                                            text:
                                                "Gradlynk Support${"  ${controller.model.value!.data![index].createdAt!.split("T")[0]}"}",
                                            textColor: ThemeConstants.TextColor,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 12,
                                          ),
                                        ),
                                      if (controller.model.value!.data![index]
                                              .firstComment !=
                                          null)
                                        CustomAutoSizeTextMontserrat(
                                          text: controller.model.value!
                                              .data![index].firstComment,
                                          textColor: ThemeConstants.TextColor,
                                          fontSize: 12,
                                        ),
                                      if (controller.model.value!.data![index]
                                              .comments![0].senderBy !=
                                          "2")
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topEnd,
                                          child: InkWell(
                                            onTap: () {
                                              if (controller
                                                  .model
                                                  .value!
                                                  .data![index]
                                                  .comments!
                                                  .isNotEmpty) {
                                                getDailogViewHistory(
                                                    controller.model.value!
                                                        .data![index].comments!,
                                                    index,
                                                    controller.model.value!
                                                        .data![index].id!);
                                              }
                                            },
                                            child: Container(
                                              height: 35,
                                              width: 150,
                                              decoration: BoxDecoration(
                                                  color:
                                                      ThemeConstants.bluecolor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0, right: 10.0),
                                                child: Center(
                                                  child:
                                                      CustomAutoSizeTextMontserrat(
                                                    text: "View History",
                                                    textColor: ThemeConstants
                                                        .whitecolor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (controller.model.value!.data![index]
                                              .comments![0].senderBy ==
                                          "2")
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topEnd,
                                          child: InkWell(
                                            onTap: () {
                                              if (controller
                                                  .model
                                                  .value!
                                                  .data![index]
                                                  .comments!
                                                  .isNotEmpty) {
                                                getDailogViewHistory(
                                                    controller.model.value!
                                                        .data![index].comments!,
                                                    index,
                                                    controller.model.value!
                                                        .data![index].id!,
                                                    true);
                                              }
                                            },
                                            child: Container(
                                              height: 35,
                                              width: 150,
                                              decoration: BoxDecoration(
                                                  color:
                                                      ThemeConstants.bluecolor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0, right: 10.0),
                                                child: Center(
                                                  child:
                                                      CustomAutoSizeTextMontserrat(
                                                    text: "Not Convinced",
                                                    textColor: ThemeConstants
                                                        .whitecolor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        } else {
                          return Container();
                        }
                      }),
                ),

            if (controller.model.value!.data!.length == 0) Empty_details()
          ],
        ),
      ),
    );
  }

  //Function
  getDailogViewHistory(List<Comments> model, int dataIndex, int id,
      [bool submitbutton = false]) {
    TextEditingController addComment = TextEditingController();
    return Get.dialog(Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Container(
          decoration: BoxDecoration(
              color: ThemeConstants.whitecolor,
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          height: submitbutton == false ? 250 : 400,
          child: StatefulBuilder(
            builder: (context, setInnerState) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomAutoSizeTextMontserrat(
                    text: "View History",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    textColor: ThemeConstants.bluecolor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: SizedBox(
                      height: 200,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/chatbackground.png"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: ListView.builder(
                            itemCount: model.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Align(
                                alignment: model[index].senderBy == "2"
                                    ? AlignmentDirectional.topStart
                                    : AlignmentDirectional.topEnd,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 5, bottom: 5),
                                  child: RoundedBackgroundText(
                                    model[index].content!,
                                    textAlign: model[index].senderBy == "2"
                                        ? TextAlign.left
                                        : TextAlign.right,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                    backgroundColor:
                                        model[index].senderBy == "2"
                                            ? ThemeConstants.bluechatColor
                                            : Colors.white,
                                  ),
                                ),
                              );
                            }),
                      )),
                ),
                if (submitbutton == true)
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
                            controller: addComment,
                            minLines: 3, // Set this
                            maxLines: 6, // and this
                            keyboardType: TextInputType.multiline,
                            textAlign: TextAlign.center,

                            decoration: InputDecoration(
                              hintText: 'Please specify user concern',
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
                if (submitbutton == true)
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          child: SizedBox(
                            width: 100,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      ThemeConstants.lightgreycolor,
                                  backgroundColor:
                                      ThemeConstants.lightgreycolor,
                                  elevation: 0.0, // foreground
                                ),
                                onPressed: () {
                                  setInnerState(() {
                                    addComment.clear();
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
                                  foregroundColor: ThemeConstants.bluecolor,
                                  backgroundColor: ThemeConstants.bluecolor,
                                  elevation: 0.0, // foreground
                                ),
                                onPressed: () async {
                                  Get.back();
                                  controller.saveComment(id.toString(),
                                      addComment.text, dataIndex);
                                },
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Submit",
                                  textColor: ThemeConstants.whitecolor,
                                )),
                          ),
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
}
