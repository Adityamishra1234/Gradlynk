import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CustomProfileDialogue extends StatelessWidget {
  Widget child;
  String title;
  bool? enableSaveNext = false;
  bool? enableEdit = false;
  Function()? onTap;
  Function()? onEdit;
  CustomProfileDialogue(
      {super.key,
      required this.child,
      this.enableEdit,
      required this.title,
      required this.onEdit,
      this.enableSaveNext,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(15),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Stack(
            fit: StackFit.expand,
            children: [
              FractionallySizedBox(
                heightFactor: 0.05,
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomAutoSizeTextMontserrat(
                      text: title,
                    ),
                    if (enableEdit == true)
                      InkWell(
                        onTap: onEdit,
                        child: CustomAutoSizeTextMontserrat(
                          textColor: ThemeConstants.bluecolor,
                          text: 'Edit',
                        ),
                      )
                  ],
                ),
              ),
              FractionallySizedBox(
                heightFactor: 0.85,
                alignment: Alignment.centerLeft,
                child: Container(
                    padding: const EdgeInsets.only(bottom: 10), child: child),
              ),
              FractionallySizedBox(
                heightFactor: 0.1,
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: CustomAutoSizeTextMontserrat(
                          textColor: ThemeConstants.bluecolor,
                          text: 'Cancel',
                        ),
                      ),
                      InkWell(
                        onTap: onTap,
                        child: Container(
                          // color: ThemeConstants.bluecolor,
                          decoration: BoxDecoration(
                              color: ThemeConstants.bluecolor,
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          child: CustomAutoSizeTextMontserrat(
                            text:
                                enableSaveNext == true ? 'Save & Next' : "Next",
                            textColor: ThemeConstants.whitecolor,
                          ),
                        ),
                      )

                      // CustomButton(text: "Cancel", onPressed: () {})
                    ],
                  ),
                ),
              ),

              // Row(
              //   children: [
              //     CustomAutoSizeTextMontserrat(
              //       text: title,
              //     )
              //   ],
              // ),

              // SingleChildScrollView(
              //   child: child,
              // )
            ],
          )),
    );
  }
}
