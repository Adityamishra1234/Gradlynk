import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/ui/models/travelhistory.dart';
import 'package:studentpanel/utils/constants.dart';

import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class TravingHistoryView extends StatelessWidget {
  Function callbackAddTravelDetails;
  Function callbackEdit;
  Function callbackDelete;
  List<TravelHistoryModel> model = [];
  TravingHistoryView({
    Key? key,
    required this.callbackDelete,
    required this.callbackEdit,
    required this.model,
    required this.callbackAddTravelDetails,
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
                  callbackAddTravelDetails(true);
                },
                child: CustomAutoSizeTextMontserrat(
                  text: "Added Travel Details",
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
                                      text: "Travel Status",
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
                                    text: model[index].travelStatus,
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
                                      text: "Country",
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
                                    text: model[index].countryName,
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
                                      text: "Type Of Visa",
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
                                    text: getNUllChecker(model[index]
                                                .typeOfVisa
                                                .toString()) ==
                                            false
                                        ? model[index].typeOfVisa.toString()
                                        : "",
                                    maxLines: 2,
                                    fontSize: 12,
                                    textColor: ThemeConstants.TextColor,
                                    fontWeight: FontWeight.bold,
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
                                      text: "Visa Status",
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
                                    text: getNUllChecker(model[index]
                                                .visaStatus
                                                .toString()) ==
                                            false
                                        ? model[index].visaStatus.toString()
                                        : "",
                                    maxLines: 2,
                                    fontSize: 12,
                                    textColor: ThemeConstants.TextColor,
                                    fontWeight: FontWeight.bold,
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
                                      text: "Visa Number",
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
                                    text: getNUllChecker(model[index]
                                                .visaNumber
                                                .toString()) ==
                                            false
                                        ? model[index].visaNumber.toString()
                                        : "",
                                    maxLines: 2,
                                    fontSize: 12,
                                    textColor: ThemeConstants.TextColor,
                                    fontWeight: FontWeight.bold,
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
                                      text: "Application Number",
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
                                    text: getNUllChecker(model[index]
                                                .applicationNumber
                                                .toString()) ==
                                            false
                                        ? model[index]
                                            .applicationNumber
                                            .toString()
                                        : "",
                                    maxLines: 2,
                                    fontSize: 12,
                                    textColor: ThemeConstants.TextColor,
                                    fontWeight: FontWeight.bold,
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
                                      text: "Date of Application",
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
                                    text: getNUllChecker(model[index]
                                                .dateOfApplication
                                                .toString()) ==
                                            false
                                        ? model[index]
                                            .dateOfApplication
                                            .toString()
                                        : "",
                                    maxLines: 2,
                                    fontSize: 12,
                                    textColor: ThemeConstants.TextColor,
                                    fontWeight: FontWeight.bold,
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
                                      text: "Date of rejection",
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
                                    text: getNUllChecker(model[index]
                                                .dateOfRejection
                                                .toString()) ==
                                            false
                                        ? model[index]
                                            .dateOfRejection
                                            .toString()
                                        : "",
                                    maxLines: 2,
                                    fontSize: 12,
                                    textColor: ThemeConstants.TextColor,
                                    fontWeight: FontWeight.bold,
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
                                      text: "Reason Of rejection",
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
                                    text: getNUllChecker(model[index]
                                                .reasonOfRejection
                                                .toString()) ==
                                            false
                                        ? model[index]
                                            .reasonOfRejection
                                            .toString()
                                        : "",
                                    maxLines: 2,
                                    fontSize: 12,
                                    textColor: ThemeConstants.TextColor,
                                    fontWeight: FontWeight.bold,
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
                                      text: "Proof Available",
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
                                    text: getNUllChecker(model[index]
                                                .proofAvailable
                                                .toString()) ==
                                            false
                                        ? model[index].proofAvailable.toString()
                                        : "",
                                    maxLines: 2,
                                    fontSize: 12,
                                    textColor: ThemeConstants.TextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
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
                                      callbackDelete(index);
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
                                        callbackEdit(index);
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
