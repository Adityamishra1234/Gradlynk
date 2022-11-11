import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/dashboardcontroller.dart';
import 'package:studentpanel/ui/controllers/profilepagecontroller.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownbutton.dart';

class MandatoryInformation extends StatelessWidget {
  MandatoryInformation({
    Key? key,
  }) : super(key: key);

  var controller = Get.put(ProfilePageController());

  callback(varTopic) {
    controller.setdropdown1(varTopic);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (Get.find<DashboardController>().loadingStudentPanelData.value ==
            true)
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
                child: SizedBox(
                  child: Row(
                    children: [
                      CustomAutoSizeTextMontserrat(
                        text: "Branch Type",
                        textColor: Colors.grey,
                      ),
                      const Spacer(),
                      // SizedBox(
                      //   width: 200,
                      //   // custom Text field
                      //   child: Padding(
                      //       padding: const EdgeInsets.only(),
                      //       child: CustomDropDown(
                      //         hint: "Branch Type",
                      //         model: Get.find<DashboardController>()
                      //             .createModelForDropdown(),
                      //         callbackFunction: callback,
                      //       )),
                      // )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  height: 5,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
                child: SizedBox(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CustomAutoSizeTextMontserrat(
                          text: "Branch Name",
                          textColor: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      //   SizedBox(
                      //     width: 200,
                      //     // custom Text field
                      //     child: controller.loadingBranchname.value == true
                      //         ? CustomDropDown(
                      //             hint: controller.dropdown1!.value,
                      //             model: Get.find<DashboardController>()
                      //                 .createDropDownData(
                      //                     controller.dropdown1!.value),
                      //             callbackFunction: callback,
                      //           )
                      //         : Padding(
                      //             padding: const EdgeInsets.only(top: 15),
                      //             child: CustomAutoSizeTextMontserrat(
                      //               text: "Branch Name",
                      //               fontWeight: FontWeight.w600,
                      //             ),
                      //           ),
                      //   ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  height: 5,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
                child: SizedBox(
                  child: Row(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 10),
                      //   child: Get.find<DashboardController>()
                      //               .loadingServiceName
                      //               .value ==
                      //           true
                      //       ? CustomDropDown(
                      //           hint: controller.dropdown1!.value,
                      //           model: Get.find<DashboardController>()
                      //               .createDropDownData(
                      //                   controller.dropdown1!.value),
                      //           callbackFunction: callback,
                      //         )
                      //       : CustomAutoSizeTextMontserrat(
                      //           text: "Service Name",
                      //           textColor: Colors.grey,
                      //         ),
                      // ),

                      const Spacer(),
                      SizedBox(
                        width: 200,
                        // custom Text field
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: CustomAutoSizeTextMontserrat(
                            text: Get.find<DashboardController>()
                                    .studentPanel
                                    .addtionalDetails![1]
                                    .serviceName ??
                                "",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  height: 5,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
                child: SizedBox(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CustomAutoSizeTextMontserrat(
                          text: "1st Country of Interest",
                          textColor: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 150,
                        // custom Text field
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: CustomAutoSizeTextMontserrat(
                            text: Get.find<DashboardController>()
                                    .studentPanel
                                    .addtionalDetails![1]
                                    .countryName ??
                                "",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  height: 5,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
                child: SizedBox(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CustomAutoSizeTextMontserrat(
                          text: "Other Country of Interest",
                          textColor: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 150,
                        // custom Text field
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: CustomAutoSizeTextMontserrat(
                            text: "Gurugram",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  height: 5,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
                child: SizedBox(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CustomAutoSizeTextMontserrat(
                          text: "Decision Marker",
                          textColor: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 150,
                        // custom Text field
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: CustomAutoSizeTextMontserrat(
                            text: "",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Divider(
                  height: 5,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
                child: SizedBox(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CustomAutoSizeTextMontserrat(
                          text: "Passport Available",
                          textColor: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 150,
                        // custom Text field
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: CustomAutoSizeTextMontserrat(
                            text: Get.find<DashboardController>()
                                    .studentPanel
                                    .passportAvailable ??
                                "",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Divider(
                  height: 5,
                  thickness: 1,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 60))
            ],
          ),
        if (Get.find<DashboardController>().loadingStudentPanelData.value ==
            false)
          const Center(
            child: CircularProgressIndicator(),
          )
      ],
    );
  }
}
