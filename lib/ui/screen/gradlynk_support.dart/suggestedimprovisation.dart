import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/trackyourticketscontroller.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

class Suggestedimprovisation extends GetView<TrackYourTicketsController> {
  Suggestedimprovisation({super.key});
  static const routeNamed = '/Suggestedimprovisation';
  var controller = Get.put(TrackYourTicketsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("title"),
      drawer: CustomDrawer(index: 11),
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
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: ThemeConstants.lightgreentColor,
                    border: Border.all(
                        width: 0.5, color: ThemeConstants.GreenColor),
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomAutoSizeTextMontserrat(
                      text: "Suggested Improvisations",
                      fontSize: 14,
                      textColor: ThemeConstants.GreenColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: controller.model.value != null
                      ? controller.model.value!.data!.length
                      : 0,
                  itemBuilder: (BuildContext context, int index) {
                    if (controller.model.value!.data![index].suggestion !=
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
                                CustomAutoSizeTextMontserrat(
                                  text: controller
                                      .model.value!.data![index].suggestion,
                                  textColor: ThemeConstants.bluecolor,
                                  fontSize: 14,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: controller
                                        .model.value!.data![index].createdAt!
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
          ],
        ),
      ),
    );
  }
}
