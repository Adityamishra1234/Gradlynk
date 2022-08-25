import 'package:flutter/material.dart';

import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class TestExpanded extends StatelessWidget {
  TestExpanded({
    Key? key,
  }) : super(key: key);

  // var controller = Get.put(ProfilePageController());
  // var dashboardcontroller = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
              child: SizedBox(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Wrap(
                        direction: Axis.vertical,
                        children: [
                          CustomAutoSizeTextMontserrat(
                            text: "Email",
                            textColor: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 200,
                      // custom Text field
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: CustomAutoSizeTextMontserrat(
                          text: " asifh asdfiadbsf esdifbaserfd fdiaws  dafub ",
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
          ],
        ),
      ),
    ]);
  }
}
