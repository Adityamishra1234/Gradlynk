import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class DocumentCheckList extends StatefulWidget {
  const DocumentCheckList({Key? key}) : super(key: key);

  @override
  State<DocumentCheckList> createState() => _DocumentCheckListState();
}

class _DocumentCheckListState extends State<DocumentCheckList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 5, left: 10),
          child: CustomAutoSizeTextMontserrat(
            text: "DocumentCheckListState -",
            textColor: ThemeConstants.bluecolor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: CustomAutoSizeTextMontserrat(
                text: "Documnet Status:",
                textColor: ThemeConstants.TextColor,
              ),
            ),
            CustomAutoSizeTextMontserrat(
              text: " 1/10",
              textColor: ThemeConstants.bluecolor,
            ),
            const Spacer(),
            CustomAutoSizeTextMontserrat(
              text: "Validation Status: ",
              textColor: ThemeConstants.TextColor,
            ),
            CustomAutoSizeTextMontserrat(
              text: "3/4",
              textColor: ThemeConstants.bluecolor,
            ),
            const Spacer(),
          ],
        ),
        Card(
          elevation: 5,
          child: ConfigurableExpansionTile(
            header: SizedBox(
              width: MediaQuery.of(context).size.width - 10,
              height: 40,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CustomAutoSizeTextMontserrat(
                      text: "Test",
                      textColor: ThemeConstants.bluecolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),
            children: [
              // Check Box
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 20),
                child: Table(
                  border: TableBorder.all(),
                  children: [
                    TableRow(
                        decoration:
                            const BoxDecoration(color: Color(0xFFECF0FB)),
                        children: [
                          TableCell(
                              child: Center(
                            child: CustomAutoSizeTextMontserrat(
                              text: "Document Name",
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          TableCell(
                            child: Center(
                              child: CustomAutoSizeTextMontserrat(
                                text: "Required By",
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TableCell(
                              child: Center(
                            child: CustomAutoSizeTextMontserrat(
                              text: "Action",
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          TableCell(
                              child: Center(
                            child: CustomAutoSizeTextMontserrat(
                              text: "Verification Status",
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ]),
                    TableRow(children: [
                      TableCell(
                          child: Center(
                        child: CustomAutoSizeTextMontserrat(
                          text: "PassPort *",
                          fontSize: 14,
                          textColor: ThemeConstants.TextColor,
                        ),
                      )),
                      TableCell(
                        child: Center(
                          child: CustomAutoSizeTextMontserrat(
                            text: "Required By SIEC",
                            fontSize: 14,
                            textColor: ThemeConstants.TextColor,
                          ),
                        ),
                      ),
                      TableCell(
                          child: Center(
                              child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 5),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.download,
                                    color: ThemeConstants.bluecolor,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 5),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.remove_red_eye,
                                    color: ThemeConstants.blackcolor,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 5),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.delete,
                                    color: ThemeConstants.orangeColor,
                                  )),
                            ),
                          ),
                        ],
                      ))),
                      TableCell(
                          child: Center(
                        child: CustomAutoSizeTextMontserrat(
                          text: "Verification Status",
                          fontSize: 14,
                          textColor: ThemeConstants.TextColor,
                        ),
                      )),
                    ]),
                    TableRow(children: [
                      TableCell(
                          child: Center(
                        child: CustomAutoSizeTextMontserrat(
                          text: "PassPort *",
                          fontSize: 14,
                          textColor: ThemeConstants.TextColor,
                        ),
                      )),
                      TableCell(
                        child: Center(
                          child: CustomAutoSizeTextMontserrat(
                            text: "Required By SIEC",
                            fontSize: 14,
                            textColor: ThemeConstants.TextColor,
                          ),
                        ),
                      ),
                      TableCell(
                          child: Center(
                              child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 5),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.download,
                                    color: ThemeConstants.bluecolor,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 5),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.remove_red_eye,
                                    color: ThemeConstants.blackcolor,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 5),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.delete,
                                    color: ThemeConstants.orangeColor,
                                  )),
                            ),
                          ),
                        ],
                      ))),
                      TableCell(
                          child: Center(
                        child: CustomAutoSizeTextMontserrat(
                          text: "Verification Status",
                          fontSize: 14,
                          textColor: ThemeConstants.TextColor,
                        ),
                      )),
                    ]),
                    TableRow(children: [
                      TableCell(
                          child: Center(
                        child: CustomAutoSizeTextMontserrat(
                          text: "PassPort *",
                          fontSize: 14,
                          textColor: ThemeConstants.TextColor,
                        ),
                      )),
                      TableCell(
                        child: Center(
                          child: CustomAutoSizeTextMontserrat(
                            text: "Required By SIEC",
                            fontSize: 14,
                            textColor: ThemeConstants.TextColor,
                          ),
                        ),
                      ),
                      TableCell(
                          child: Center(
                              child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 5),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.download,
                                    color: ThemeConstants.bluecolor,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 5),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.remove_red_eye,
                                    color: ThemeConstants.blackcolor,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 5),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.delete,
                                    color: ThemeConstants.orangeColor,
                                  )),
                            ),
                          ),
                        ],
                      ))),
                      TableCell(
                          child: Center(
                        child: CustomAutoSizeTextMontserrat(
                          text: "Verification Status",
                          fontSize: 14,
                          textColor: ThemeConstants.TextColor,
                        ),
                      )),
                    ]),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
