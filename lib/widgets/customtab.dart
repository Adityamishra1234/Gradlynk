import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/profilepagecontroller.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: TabBar(
            onTap: ((value) {
              if (value == 0) {
                Get.find<ProfilePageController>()
                    .getEnglishTestDetail(true.obs);
              } else {
                Get.find<ProfilePageController>()
                    .getEnglishTestDetail(false.obs);
              }
            }),
            tabs: [
              SizedBox(
                height: 30,
                child: CustomAutoSizeTextMontserrat(
                  text: 'English Test Details',
                  fontSize: 16,
                  textColor: Get.find<ProfilePageController>()
                              .englishTestDetail!
                              .value ==
                          false
                      ? Colors.grey
                      : const Color(0xFF1940BC),
                ),
              ),
              SizedBox(
                height: 30,
                child: CustomAutoSizeTextMontserrat(
                  text: 'Other Test Details',
                  fontSize: 16,
                  textColor: Get.find<ProfilePageController>()
                              .englishTestDetail!
                              .value ==
                          true
                      ? Colors.grey
                      : const Color(0xFF1940BC),
                ),
              ),
            ]));
  }
}
