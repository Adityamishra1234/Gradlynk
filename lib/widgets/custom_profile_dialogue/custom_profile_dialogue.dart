import 'package:flutter/material.dart';
import 'package:studentpanel/utils/config/size_config.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CustomProfileDialogue extends StatelessWidget {
  Widget child;
  String title;
  bool? enableSaveNext = false;
  bool? enableEdit = false;
  Function()? onTap;
  Function()? onEdit;
  Function()? viewDetail;
  bool? showViewDetails = false;
  Function()? backButton;

  CustomProfileDialogue(
      {super.key,
      required this.backButton,
      this.showViewDetails,
      required this.child,
      this.enableEdit,
      required this.title,
      required this.onEdit,
      this.enableSaveNext,
      this.viewDetail,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // backgroundColor: ThemeConstants.whitecolor,
      contentPadding: const EdgeInsets.all(15),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            // fit: StackFit.expand,
            children: [
              SizedBox(
                height: 40,
                // heightFactor: 0.05,
                // alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomAutoSizeTextMontserrat(
                      text: title,
                      fontSize: SizeConfig.headingSize,
                      fontWeight: SizeConfig.headingFontWeight,
                      textColor: ThemeConstants.bluecolor,
                    ),
                    if (enableEdit == true)
                      InkWell(
                        onTap: onEdit,
                        child: CustomAutoSizeTextMontserrat(
                          textColor: ThemeConstants.bluecolor,
                          text: 'Edit',
                        ),
                      ),
                    if (showViewDetails == true)
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 10, bottom: 10),
                        child: InkWell(
                            onTap: viewDetail,
                            child: Text(
                                                          "View Details",
                                                          style: TextStyle(
                              fontSize: 13,
                              color: ThemeConstants.orangeColor),
                                                        )),
                      ),
                  ],
                ),
              ),
              Expanded(
                // height: 50,
                // heightFactor: 0.85,
                // alignment: Alignment.centerLeft,
                child: Container(
                    padding: const EdgeInsets.only(bottom: 10), child: child),
              ),
              SizedBox(
                height: 40,
                // heightFactor: 0.1,
                // alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: backButton,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomAutoSizeTextMontserrat(
                            textColor: ThemeConstants.bluecolor,
                            text: 'Cancel',
                          ),
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
