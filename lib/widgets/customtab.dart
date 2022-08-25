import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/profilepagecontroller.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilePageController>(
        init: ProfilePageController(),
        builder: (controller) {
          return DefaultTabController(
              initialIndex: 0,
              length: 2,
              child: TabBar(
                  onTap: ((value) {
                    if (value == 0) {
                      controller.getEnglishTestDetail(true.obs);
                    } else {
                      controller.getEnglishTestDetail(false.obs);
                    }
                  }),
                  tabs: [
                    SizedBox(
                      height: 30,
                      child: CustomAutoSizeTextMontserrat(
                        text: 'English Test Details',
                        fontSize: 16,
                        textColor: controller.englishTestDetail!.value == false
                            ? Colors.grey
                            : Color(0xFF1940BC),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: CustomAutoSizeTextMontserrat(
                        text: 'Other Test Details',
                        fontSize: 16,
                        textColor: controller.englishTestDetail!.value == true
                            ? Colors.grey
                            : Color(0xFF1940BC),
                      ),
                    ),
                  ]));
        });
  }
}
