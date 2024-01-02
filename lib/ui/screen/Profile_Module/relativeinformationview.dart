import 'package:flutter/material.dart';
import 'package:studentpanel/ui/models/realtion.dart';

import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/empty_widget.dart';

class RelativeInformationView extends StatelessWidget {
  Function callbackEdit;
  Function callbackDelete;
  Function callbackAddRelativeInfo;
  List<RealtionModel> model = [];
  RelativeInformationView(
      {Key? key,
      required this.callbackAddRelativeInfo,
      required this.callbackDelete,
      required this.callbackEdit,
      required this.model})
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
        // Align(
        //   alignment: AlignmentDirectional.bottomEnd,
        //   child: Padding(
        //     padding: const EdgeInsets.only(right: 10),
        //     child: TextButton(
        //         onPressed: () {
        //           callbackAddRelativeInfo(false);
        //         },
        //         child: CustomAutoSizeTextMontserrat(
        //           text: "Added Relative Info.",
        //           fontSize: 12,
        //           textColor: ThemeConstants.bluecolor,
        //           fontWeight: FontWeight.bold,
        //         )),
        //   ),
        // ),
        if (model.length != 0)
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: ListView.builder(
                padding: EdgeInsets.all(0),
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
                                      text: model[index].countryName,
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
                                      text: model[index].citizenshipStatus,
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
                                      text: model[index].relationWithRelative,
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
                                    child: CustomAutoSizeTextMontserrat(
                                      text: model[index].relativeEmailId,
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
                                        text: "Contact of Relative",
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
                                      text: model[index]
                                          .contactOfRelative
                                          .toString(),
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
                                        text: "Address of Relative",
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
                                      text: model[index].addressOfRelative,
                                      textColor: ThemeConstants.TextColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      maxLines: 2,
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
                                // Padding(
                                //   padding:
                                //       const EdgeInsets.only(top: 20, right: 20),
                                //   child: ElevatedButton(
                                //       style: ElevatedButton.styleFrom(
                                //         foregroundColor:
                                //             ThemeConstants.whitecolor,
                                //         elevation: 0.0,
                                //         backgroundColor:
                                //             ThemeConstants.whitecolor,
                                //         side: BorderSide(
                                //             color: ThemeConstants.TextColor),
                                //         // foreground
                                //       ),
                                //       onPressed: () async {
                                //         // Api call
                                //         callbackDelete(index);
                                //       },
                                //       child: CustomAutoSizeTextMontserrat(
                                //         text: "Delete",
                                //         textColor: ThemeConstants.TextColor,
                                //       )),
                                // ),
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
        if (model.length == 0) Empty_details()
      ],
    );
  }
}
