import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/applicationsummarycontroller.dart';
import 'package:studentpanel/ui/screen/applicationcompletedetail.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class ApplicationSummary extends StatelessWidget {
  ApplicationSummary({Key? key}) : super(key: key);
  static const routeNamed = '/ApplicationSummary';
  var controller = Get.put(ApplicationSummaryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("title"),
        body: GetBuilder<ApplicationSummaryController>(
          builder: (_) => Column(
            children: [
              if (_.loadingApplicationSummary.value == true)
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: CustomAutoSizeTextMontserrat(
                      text: "Application Summary",
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      textColor: ThemeConstants.bluecolor,
                    ),
                  ),
                ),
              const SizedBox(
                height: 10,
              ),
              if (_.loadingApplicationSummary.value == true)
                Expanded(
                  child: ListView.builder(
                      itemCount: controller.applicationSummaryModel.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: ThemeConstants.blackcolor, width: 0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, right: 10, left: 10),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      var response = await controller
                                          .getApplicationDetailComplete(
                                              controller
                                                  .applicationSummaryModel[
                                                      index]
                                                  .id
                                                  .toString());
                                      if (response != null) {
                                        Get.to(ApplicationCompleteDetails(
                                            applicationDetailModel: controller
                                                .applicationDetailModel));
                                      }
                                    },
                                    child: CustomAutoSizeTextMontserrat(
                                      text: controller
                                          .applicationSummaryModel[index]
                                          .universityName,
                                      textColor: ThemeConstants.bluecolor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      CustomAutoSizeTextMontserrat(
                                        text: "Country: ",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                100,
                                        child: CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .applicationSummaryModel[index]
                                              .countryName,
                                          fontSize: 14,
                                          textColor: ThemeConstants.TextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      CustomAutoSizeTextMontserrat(
                                        text: "Course Level: ",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                140,
                                        child: CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .applicationSummaryModel[index]
                                              .courseLevel,
                                          fontSize: 14,
                                          textColor: ThemeConstants.TextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      CustomAutoSizeTextMontserrat(
                                        text: "Course Name: ",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                155,
                                        child: CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .applicationSummaryModel[index]
                                              .courseName,
                                          fontSize: 14,
                                          textColor: ThemeConstants.TextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      CustomAutoSizeTextMontserrat(
                                        text: "campus Name: ",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                150,
                                        child: CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .applicationSummaryModel[index]
                                              .campusName,
                                          fontSize: 14,
                                          textColor: ThemeConstants.TextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: ThemeConstants.lightgreentColor,
                                        borderRadius:
                                            BorderRadius.circular(7.0)),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 10, bottom: 10),
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "Stage: ",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              95,
                                          child: CustomAutoSizeTextMontserrat(
                                            text: controller
                                                .applicationSummaryModel[index]
                                                .stageId
                                                .toString(),
                                            textColor: ThemeConstants.TextColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: ThemeConstants.lightorangeColor,
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, bottom: 10, left: 10),
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "Status: ",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              100,
                                          child: CustomAutoSizeTextMontserrat(
                                            text: controller
                                                .applicationSummaryModel[index]
                                                .statusId
                                                .toString(),
                                            fontSize: 14,
                                            textColor: ThemeConstants.TextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        );
                      }),
                ),
              if (_.loadingApplicationSummary.value == false)
                const Center(child: CircularProgressIndicator())
            ],
          ),
        ));
  }
}
