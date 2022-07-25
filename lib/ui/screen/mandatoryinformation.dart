import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/dashboardcontroller.dart';
import 'package:studentpanel/ui/controllers/profilepagecontroller.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class MandatoryInformation extends StatelessWidget {
  MandatoryInformation({
    Key? key,
  }) : super(key: key);

  var controller = Get.put(ProfilePageController());
  var dashboardcontroller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    print(controller.chooseIndex);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 10, top: 30),
          child: SizedBox(
            height: 40,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CustomAutoSizeTextMontserrat(
                    text: "Branch Type",
                    maxLines: 1,
                    textColor: Colors.grey,
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 40,
                  width: 200,
                  // custom Text field
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: CustomAutoSizeTextMontserrat(
                      text: dashboardcontroller
                              .studentPanel.addtionalDetails![1].branchType ??
                          "",
                      maxLines: 1,
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
            left: 20,
            right: 10,
          ),
          child: SizedBox(
            height: 40,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CustomAutoSizeTextMontserrat(
                    text: "Branch Name",
                    maxLines: 1,
                    textColor: Colors.grey,
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 40,
                  width: 200,
                  // custom Text field
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: CustomAutoSizeTextMontserrat(
                      text: dashboardcontroller
                              .studentPanel.addtionalDetails![1].branchName ??
                          "",
                      maxLines: 1,
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
            left: 20,
            right: 10,
          ),
          child: SizedBox(
            height: 40,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CustomAutoSizeTextMontserrat(
                    text: "Service Name",
                    maxLines: 1,
                    textColor: Colors.grey,
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 40,
                  width: 200,
                  // custom Text field
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: CustomAutoSizeTextMontserrat(
                      text: dashboardcontroller
                              .studentPanel.addtionalDetails![1].serviceName ??
                          "",
                      maxLines: 1,
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
            left: 20,
            right: 10,
          ),
          child: SizedBox(
            height: 40,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CustomAutoSizeTextMontserrat(
                    text: "1st Country of Interest",
                    maxLines: 1,
                    textColor: Colors.grey,
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 40,
                  width: 150,
                  // custom Text field
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: CustomAutoSizeTextMontserrat(
                      text: dashboardcontroller
                              .studentPanel.addtionalDetails![1].countryName ??
                          "",
                      maxLines: 1,
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
            left: 20,
            right: 10,
          ),
          child: SizedBox(
            height: 40,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CustomAutoSizeTextMontserrat(
                    text: "Other Country of Interest",
                    maxLines: 1,
                    textColor: Colors.grey,
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 40,
                  width: 150,
                  // custom Text field
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: CustomAutoSizeTextMontserrat(
                      text: "Gurugram",
                      maxLines: 1,
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
            left: 20,
            right: 10,
          ),
          child: SizedBox(
            height: 40,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CustomAutoSizeTextMontserrat(
                    text: "Decision Marker",
                    maxLines: 1,
                    textColor: Colors.grey,
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 40,
                  width: 150,
                  // custom Text field
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: CustomAutoSizeTextMontserrat(
                      text: "",
                      maxLines: 1,
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
          padding: const EdgeInsets.only(
            left: 20,
            right: 10,
          ),
          child: SizedBox(
            height: 40,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CustomAutoSizeTextMontserrat(
                    text: "Passport Available",
                    maxLines: 1,
                    textColor: Colors.grey,
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 40,
                  width: 150,
                  // custom Text field
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: CustomAutoSizeTextMontserrat(
                      text:
                          dashboardcontroller.studentPanel.passportAvailable ??
                              "",
                      maxLines: 1,
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
    );
  }
}
