import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/visaSummary.dart';
import 'package:studentpanel/ui/screen/Visa/visa.dart';

import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

class VisaSummary extends StatelessWidget {
  VisaSummary({Key? key}) : super(key: key);
  static const routeNamed = '/VisaSummary';
  var controller = Get.put(VisaSummaryController());

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
    double width = MediaQuery.of(context).size.width;
    if (displayMobileLayout == true) {
      width = MediaQuery.of(context).size.width - 240;
    }

    return Scaffold(
        appBar: const CustomAppBar("title"),
        drawer: displayMobileLayout == false
            ? CustomDrawer(
                index: 6,
              )
            : null,
        body: GetBuilder<VisaSummaryController>(builder: (_) {
          if (_.loadingVisaDetails.value == true &&
              _.loadingVisaStatus.value == true) {
            for (var i = 0; i < _.modelList.length; i++) {
              for (var j = 0; j < _.visaStatusID.length; j++) {
                if (_.modelList[i].statusId.toString() ==
                    _.visaStatusID[j].toString()) {
                  _.modelList[i].stageName = _.visaStatusName[j];
                }
              }
            }
          }
          return Row(
            children: [
              if (displayMobileLayout == true)
                CustomDrawer(
                  index: 6,
                ),
              Flexible(
                child: Column(
                  children: [
                    if (_.loadingVisaDetails.value == true)
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 20),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: CustomAutoSizeTextMontserrat(
                            text: "Visa Summary",
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            textColor: ThemeConstants.bluecolor,
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (_.loadingVisaDetails.value == true)
                      Expanded(
                        child: ListView.builder(
                            controller: ScrollController(),
                            itemCount: _.modelList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: ThemeConstants.blackcolor,
                                      width: 0.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, bottom: 10, right: 10, left: 10),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            print(_
                                                .modelList[index].applicationId
                                                .toString());
                                            Get.to(VisaDetail(
                                              applicationId: getNUllChecker(_
                                                          .modelList[index]
                                                          .applicationId) ==
                                                      false
                                                  ? _.modelList[index]
                                                      .applicationId
                                                      .toString()
                                                  : "",
                                            ));
                                          },
                                          child: CustomAutoSizeTextMontserrat(
                                            text: _.modelList[index].country,
                                            textColor: ThemeConstants.bluecolor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 7),
                                          child: Row(
                                            children: [
                                              CustomAutoSizeTextMontserrat(
                                                text: "University: ",
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              SizedBox(
                                                width: width - 140,
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: _.modelList[index]
                                                      .universityName,
                                                  fontSize: 14,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: ThemeConstants
                                                  .lightgreentColor,
                                              borderRadius:
                                                  BorderRadius.circular(7.0)),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10,
                                                    left: 10,
                                                    bottom: 10),
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Stage: ",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              SizedBox(
                                                width: width - 95,
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: _.modelList[index]
                                                      .stageName,
                                                  textColor:
                                                      ThemeConstants.TextColor,
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
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            color:
                                                ThemeConstants.lightorangeColor,
                                          ),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10,
                                                    bottom: 10,
                                                    left: 10),
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Status: ",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              SizedBox(
                                                width: width - 100,
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: _.modelList[index]
                                                      .stageName,
                                                  fontSize: 14,
                                                  textColor:
                                                      ThemeConstants.TextColor,
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
                    if (_.loadingVisaDetails.value == false)
                      Center(child: getLoading(context)),
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
