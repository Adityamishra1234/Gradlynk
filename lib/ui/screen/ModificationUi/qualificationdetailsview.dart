import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/ui/models/qualificationdetailview.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class QualificationDetailView extends StatelessWidget {
  Function callbackAddQualification;
  QualificationDetailsViewModel model = QualificationDetailsViewModel();
  QualificationDetailView(
      {Key? key, required this.callbackAddQualification, required this.model})
      : super(key: key);
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
                  callbackAddQualification(true);
                },
                child: CustomAutoSizeTextMontserrat(
                  text: "Added Qualification",
                  fontSize: 12,
                  textColor: ThemeConstants.bluecolor,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - 205,
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
                                      text: "Highest Qualification",
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
                                    text: "Class 12",
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
                                      text: "Qualification Name",
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
                                    text: "Science",
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
                                      text: "Stream",
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
                                    text: "",
                                    textColor: ThemeConstants.blackcolor,
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
                                      text: "Country Of Education",
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
                                      "test",
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
                                      text: "State",
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
                                      "Haryana",
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
                                      text: "Affiliation",
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
                                      "Starex University",
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
                                      text: "City",
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
                                      "Ambala Cantt",
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
                                      text: "Name of the Institution",
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
                                      "",
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
                                      text: "Education status",
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
                                      "complete",
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
                                      text: "Year of Passing/Incomplete",
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
                                      "2015",
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
                                      text: "Percentage",
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
                                      "75",
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
                                      text: "Re-appears/Blacklogs",
                                      fontSize: 12,
                                      maxLines: 2,
                                      textColor: ThemeConstants.blackcolor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Align(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: HtmlWidget(
                                      "0",
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
