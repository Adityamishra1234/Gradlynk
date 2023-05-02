import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/ui/models/workhistoryview.dart';
import 'package:studentpanel/utils/constantsWithId.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class WorkHistoryView extends StatelessWidget {
  Function callbackDeleteButton;
  Function calbackEditButton;
  Function callbackAddWorkHistory;
  List<WorkHistoryViewModel> model = [];
  WorkHistoryView(
      {Key? key,
      required this.callbackAddWorkHistory,
      required this.model,
      required this.calbackEditButton,
      required this.callbackDeleteButton})
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
                  callbackAddWorkHistory(false);
                },
                child: CustomAutoSizeTextMontserrat(
                  text: "Added WorkHistory",
                  fontSize: 12,
                  textColor: ThemeConstants.bluecolor,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - 260,
          child: ListView.builder(
              itemCount: model.length,
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
                                      text: "Applicant Type",
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
                                    text: ConstantsWithId.getApplicationType(
                                        model[index].applicantType.toString()),
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
                                      text: "Name of Last \n Organisation",
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
                                    text: model[index].organisationName,
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
                                      text: "Working Till",
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
                                    text: model[index].workingTill,
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
                                      text: "Industry",
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
                                      model[index].jobIndustryName ?? "",
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
                                      text: "Designation",
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
                                      model[index].jobRole ?? "",
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
                                      text: "Employment Type",
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
                                      model[index].jobType ?? "",
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
                                      text: "Income as per ITR",
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
                                      model[index].income != null
                                          ? model[index].income.toString()
                                          : "",
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
                                      foregroundColor:
                                          ThemeConstants.whitecolor,
                                      elevation: 0.0,
                                      backgroundColor:
                                          ThemeConstants.whitecolor,
                                      side: BorderSide(
                                          color: ThemeConstants.TextColor),
                                      // foreground
                                    ),
                                    onPressed: () async {
                                      callbackDeleteButton(index);
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
                                        foregroundColor:
                                            ThemeConstants.bluecolor,
                                        elevation: 0.0,
                                        backgroundColor: ThemeConstants
                                            .bluecolor, // foreground
                                      ),
                                      onPressed: () async {
                                        // Api call
                                        calbackEditButton(index);
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
