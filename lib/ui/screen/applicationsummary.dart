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
                CustomAutoSizeTextMontserrat(
                  text: "Application Summary",
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  textColor: ThemeConstants.bluecolor,
                ),
              if (_.loadingApplicationSummary.value == true)
                Expanded(
                  child: ListView.builder(
                      itemCount: controller.applicationSummaryModel.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, right: 10),
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
                                  Wrap(
                                    children: [
                                      CustomAutoSizeTextMontserrat(
                                        text: "Country: ",
                                        fontWeight: FontWeight.bold,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      CustomAutoSizeTextMontserrat(
                                        text: controller
                                            .applicationSummaryModel[index]
                                            .countryName,
                                        textColor: ThemeConstants.TextColor,
                                      ),
                                    ],
                                  ),
                                  Wrap(
                                    children: [
                                      CustomAutoSizeTextMontserrat(
                                        text: "Course Level: ",
                                        fontWeight: FontWeight.bold,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      CustomAutoSizeTextMontserrat(
                                        text: controller
                                            .applicationSummaryModel[index]
                                            .courseLevel,
                                        textColor: ThemeConstants.TextColor,
                                      ),
                                    ],
                                  ),
                                  Wrap(
                                    children: [
                                      CustomAutoSizeTextMontserrat(
                                        text: "Course Name: ",
                                        fontWeight: FontWeight.bold,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      CustomAutoSizeTextMontserrat(
                                        text: controller
                                            .applicationSummaryModel[index]
                                            .courseName,
                                        textColor: ThemeConstants.TextColor,
                                      ),
                                    ],
                                  ),
                                  Wrap(
                                    children: [
                                      CustomAutoSizeTextMontserrat(
                                        text: "campus Name: ",
                                        fontWeight: FontWeight.bold,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      CustomAutoSizeTextMontserrat(
                                        text: controller
                                            .applicationSummaryModel[index]
                                            .campusName,
                                        textColor: ThemeConstants.TextColor,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ThemeConstants.GreenColor),
                                        borderRadius:
                                            BorderRadius.circular(7.0)),
                                    child: Wrap(
                                      children: [
                                        CustomAutoSizeTextMontserrat(
                                          text: "Stage: ",
                                          fontWeight: FontWeight.bold,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .applicationSummaryModel[index]
                                              .stageId
                                              .toString(),
                                          textColor: ThemeConstants.TextColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ThemeConstants.yellow),
                                        borderRadius:
                                            BorderRadius.circular(7.0)),
                                    child: Wrap(
                                      children: [
                                        CustomAutoSizeTextMontserrat(
                                          text: "Status: ",
                                          fontWeight: FontWeight.bold,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .applicationSummaryModel[index]
                                              .statusId
                                              .toString(),
                                          textColor: ThemeConstants.TextColor,
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
                const CircularProgressIndicator()
            ],
          ),
        ));
  }
}
