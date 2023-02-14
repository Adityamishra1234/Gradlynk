import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashids2/hashids2.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/screen/My_Application/applicationcompletedetail.dart';
import 'package:studentpanel/ui/screen/track_application/applicationdetail.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  String reverseStringUsingSplit(String input) {
    var chars = input.split('');
    return chars.reversed.join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("title"),
      drawer: const CustomDrawer(),
      body: GetBuilder<BaseController>(builder: (_) {
        final hashids = HashIds(
          salt: 'xmjXtQZXO6JryHPC',
          minHashLength: 10,
          alphabet:
              'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
        );
        RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

        List<Widget> addWidget = [];
        if (_.notificationModel != null) {
          for (var i = 0; i < _.notificationModel!.length; i++) {
            addWidget.add(InkWell(
              onTap: () {
                String hashidsApplication = _
                    .notificationModel![i].notificationBody
                    .toString()
                    .split("href='")[1]
                    .split("'>")[0];
                hashidsApplication =
                    reverseStringUsingSplit(hashidsApplication);
                hashidsApplication = hashidsApplication.split("/")[0];
                hashidsApplication =
                    reverseStringUsingSplit(hashidsApplication);

                hashidsApplication =
                    hashids.decode(hashidsApplication)[0].toString();
                //TODO
                Get.toNamed("/ApplicationCompleteDetails",
                    arguments: hashidsApplication);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: ThemeConstants.whitecolor,
                      border: Border.all(color: const Color(0xFFE5E1FE)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            width: 10.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                              color: ThemeConstants.blackcolor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 75,
                            child: Column(
                              children: [
                                CustomAutoSizeTextMontserrat(
                                  text:
                                      _.notificationModel![i].notificationTitle,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      child: HtmlWidget(
                                        _.notificationModel![0]
                                            .notificationBody!
                                            .replaceAll(exp, ""),
                                        renderMode: RenderMode.column,
                                        textStyle: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          color: ThemeConstants.TextColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "1 day ago",
                                    textColor: ThemeConstants.TextColor,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
          }
        }

        return SingleChildScrollView(
          child: Column(
            children: [...addWidget],
          ),
        );
      }),
    );
  }
}
