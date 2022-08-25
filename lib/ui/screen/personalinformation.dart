import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/dashboardcontroller.dart';
import 'package:studentpanel/ui/controllers/profilepagecontroller.dart';

import 'package:studentpanel/widgets/animationshowdown.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class PersonalInformation extends StatelessWidget {
  PersonalInformation({
    Key? key,
  }) : super(key: key);

  var controller = Get.put(ProfilePageController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (Get.find<DashboardController>().loadingStudentPanelData.value ==
            true)
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 205,
                child: NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    if (notification.direction == ScrollDirection.forward) {
                      controller.getShowAnimation(false.obs);
                    } else if (notification.direction ==
                        ScrollDirection.reverse) {
                      controller.getShowAnimationTrue(true.obs, true.obs);
                    } else {
                      return true;
                    }
                    return true;
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            height: 76,
                            width: 76,
                            decoration: const BoxDecoration(
                                color: Colors.orange, shape: BoxShape.circle),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 5, right: 10),
                          child: Center(
                            child: CustomAutoSizeTextMontserrat(
                              text: Get.find<DashboardController>()
                                      .studentPanel
                                      .enquiryName ??
                                  "",
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 10, top: 10),
                          child: SizedBox(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Gender",
                                    textColor: Colors.grey,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 200,
                                  // custom Text field
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: Get.find<DashboardController>()
                                              .studentPanel
                                              .gender ??
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 10, top: 10),
                          child: SizedBox(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Email",
                                    textColor: Colors.grey,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 200,
                                  // custom Text field
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: Get.find<DashboardController>()
                                              .studentPanel
                                              .email ??
                                          "",
                                      maxLines: 5,
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 10, top: 10),
                          child: SizedBox(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Date of Birth",
                                    textColor: Colors.grey,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 200,
                                  // custom Text field
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: Get.find<DashboardController>()
                                                  .studentPanel
                                                  .dateOfBirth !=
                                              null
                                          ? Get.find<DashboardController>()
                                              .studentPanel
                                              .dateOfBirth!
                                              .toString()
                                          : "",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 10, top: 10),
                          child: SizedBox(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Mobile",
                                    textColor: Colors.grey,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 200,
                                  // custom Text field
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: Get.find<DashboardController>()
                                                  .studentPanel
                                                  .mobile !=
                                              null
                                          ? Get.find<DashboardController>()
                                              .studentPanel
                                              .mobile!
                                              .toString()
                                          : "",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 10, top: 10),
                          child: SizedBox(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Sec. Email",
                                    textColor: Colors.grey,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 200,
                                  // custom Text field
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: Get.find<DashboardController>()
                                              .studentPanel
                                              .secondaryEmail ??
                                          "",
                                      maxLines: 3,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 10, top: 10),
                          child: SizedBox(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Marital Status",
                                    textColor: Colors.grey,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 200,
                                  // custom Text field
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: Get.find<DashboardController>()
                                              .studentPanel
                                              .maritalStatus ??
                                          "",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 10, top: 10),
                          child: SizedBox(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Application Type",
                                    textColor: Colors.grey,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 200,
                                  // custom Text field
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: Get.find<DashboardController>()
                                              .studentPanel
                                              .applicantType ??
                                          "",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 10, top: 10),
                          child: SizedBox(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Country",
                                    textColor: Colors.grey,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 200,
                                  // custom Text field
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: Get.find<DashboardController>()
                                              .studentPanel
                                              .countryName ??
                                          "",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 10, top: 10),
                          child: SizedBox(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "State",
                                    textColor: Colors.grey,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 200,
                                  // custom Text field
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: Get.find<DashboardController>()
                                              .studentPanel
                                              .stateName ??
                                          "",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 10, top: 10),
                          child: SizedBox(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Selected City",
                                    textColor: Colors.grey,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 200,
                                  // custom Text field
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: Get.find<DashboardController>()
                                              .studentPanel
                                              .cityName ??
                                          "",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 10, top: 10),
                          child: SizedBox(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Address(Passport)",
                                    textColor: Colors.grey,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 200,
                                  // custom Text field
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: Get.find<DashboardController>()
                                              .studentPanel
                                              .address ??
                                          "",
                                      maxLines: 5,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 10, top: 10),
                          child: SizedBox(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Zip Code",
                                    textColor: Colors.grey,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 200,
                                  // custom Text field
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: Get.find<DashboardController>()
                                                  .studentPanel
                                                  .pincode !=
                                              null
                                          ? Get.find<DashboardController>()
                                              .studentPanel
                                              .pincode
                                              .toString()
                                          : "",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 10, top: 10),
                          child: SizedBox(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Other Country Int.",
                                    textColor: Colors.grey,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 200,
                                  // custom Text field
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CustomAutoSizeTextMontserrat(
                                      // Test
                                      text: Get.find<DashboardController>()
                                              .studentPanel
                                              .otherCountryOfInterest![0]
                                              .countryName ??
                                          "",

                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              if (controller.showAnimation!.value == true ||
                  controller.firstTimeAnimation!.value == false)
                Positioned(
                  bottom: -50,
                  left: 220,
                  child: AnimationShowDownArror(
                    toY: -100,
                    fromY: -80,
                  ),
                ),
            ],
          ),
        if (Get.find<DashboardController>().loadingStudentPanelData.value ==
            false)
          const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
