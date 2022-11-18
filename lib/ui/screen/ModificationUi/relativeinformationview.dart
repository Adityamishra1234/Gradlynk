import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class RelativeInformationView extends StatelessWidget {
  Function callbackAddRelativeInfo;
  // List<QualificationDetailsViewModel> model = [];
  RelativeInformationView({
    Key? key,
    required this.callbackAddRelativeInfo,
  }) : super(key: key);
  final rowSpacer = const TableRow(children: [
    SizedBox(
      height: 3,
    ),
    SizedBox(
      height: 3,
    )
  ]);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TextButton(
                onPressed: () {
                  callbackAddRelativeInfo(false);
                },
                child: CustomAutoSizeTextMontserrat(
                  text: "Added Relative Info.",
                  fontSize: 12,
                  textColor: ThemeConstants.bluecolor,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - 225,
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, bottom: 10, top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ThemeConstants.whitecolor,
                      border: Border.all(),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Table(
                            children: [
                              TableRow(children: [
                                Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Coutry Name",
                                      maxLines: 2,
                                      fontSize: 12,
                                      textColor: ThemeConstants.blackcolor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "model[index].courseLevel",
                                    textColor: ThemeConstants.TextColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    maxLines: 5,
                                  ),
                                ),
                              ]),
                              rowSpacer,
                              TableRow(children: [
                                Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Citizenship Status",
                                      maxLines: 2,
                                      textColor: ThemeConstants.blackcolor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "model[index].countryName",
                                    textColor: ThemeConstants.TextColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    maxLines: 2,
                                  ),
                                ),
                              ]),
                              rowSpacer,
                              TableRow(children: [
                                Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Relation",
                                      maxLines: 2,
                                      textColor: ThemeConstants.blackcolor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "model[index].streamName",
                                    textColor: ThemeConstants.TextColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    maxLines: 2,
                                  ),
                                ),
                              ]),
                              rowSpacer,
                              TableRow(children: [
                                Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Relative Email",
                                      maxLines: 2,
                                      fontSize: 12,
                                      textColor: ThemeConstants.blackcolor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Align(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: HtmlWidget(
                                      "model[index].countryName ?? " "",
                                      textStyle: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        color: ThemeConstants.TextColor,
                                        fontSize: 12,
                                      ),
                                    )),
                              ]),
                              rowSpacer,
                              TableRow(children: [
                                Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Contact Of Relative",
                                      maxLines: 2,
                                      textColor: ThemeConstants.blackcolor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Align(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: HtmlWidget(
                                      "model[index].stateName ?? " "",
                                      textStyle: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        color: ThemeConstants.TextColor,
                                        fontSize: 12,
                                      ),
                                    )),
                              ]),
                              rowSpacer,
                              TableRow(children: [
                                Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Address Of Relative",
                                      maxLines: 2,
                                      textColor: ThemeConstants.blackcolor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Align(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: HtmlWidget(
                                      "model[index].affiliationName ?? " "",
                                      textStyle: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        color: ThemeConstants.TextColor,
                                        fontSize: 12,
                                      ),
                                    )),
                              ]),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              const Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, right: 20),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0.0,
                                      side: BorderSide(
                                          color: ThemeConstants.TextColor),
                                      primary: ThemeConstants
                                          .whitecolor, // background
                                      onPrimary: ThemeConstants.whitecolor,
                                      // foreground
                                    ),
                                    onPressed: () async {
                                      // Api call
                                    },
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Delete",
                                      textColor: ThemeConstants.TextColor,
                                    )),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, right: 20),
                                child: SizedBox(
                                  width: 90,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0.0,
                                        primary: ThemeConstants
                                            .bluecolor, // background
                                        onPrimary: ThemeConstants
                                            .bluecolor, // foreground
                                      ),
                                      onPressed: () async {
                                        // Api call
                                      },
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Edit",
                                        textColor: ThemeConstants.whitecolor,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
