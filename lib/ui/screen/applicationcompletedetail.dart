import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class ApplicationCompleteDetails extends StatelessWidget {
  const ApplicationCompleteDetails({Key? key}) : super(key: key);
  static const routeNamed = '/ApplicationCompleteDetails';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: CustomAutoSizeTextMontserrat(
              text: "My Application",
              textColor: ThemeConstants.bluecolor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
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
                        text: "Application Submission Details",
                        textColor: ThemeConstants.blackcolor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Table(
                    children: [
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Offer Status",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Acknowledgement Number",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "TAT Lapse",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "098FFGH8767DGF7443FDGs",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                      ]),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: CustomAutoSizeTextMontserrat(
                    text: "Acknowledgement Doc",
                    textColor: ThemeConstants.bluecolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: ThemeConstants.GreenColor),
                        primary: ThemeConstants.whitecolor, // background
                        onPrimary: ThemeConstants.whitecolor, // foreground
                      ),
                      onPressed: () {},
                      child: CustomAutoSizeTextMontserrat(
                        text: "Upload",
                        textColor: ThemeConstants.GreenColor,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: ThemeConstants.bluecolor),
                        primary: ThemeConstants.whitecolor, // background
                        onPrimary: ThemeConstants.whitecolor, // foreground
                      ),
                      onPressed: () {},
                      child: CustomAutoSizeTextMontserrat(
                        text: "Download",
                        textColor: ThemeConstants.bluecolor,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: ThemeConstants.orangeColor),
                        primary: ThemeConstants.whitecolor, // background
                        onPrimary: ThemeConstants.whitecolor, // foreground
                      ),
                      onPressed: () {},
                      child: CustomAutoSizeTextMontserrat(
                        text: "View",
                        textColor: ThemeConstants.orangeColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
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
                        text: "Application Submission Details",
                        textColor: ThemeConstants.blackcolor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Table(
                    children: [
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Application Submission Date",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Offer Date",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "01-09-2022 01:00 AM",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "22-09-2022",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                      ]),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Table(
                    children: [
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Offer lapse Date",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Conditional offer date",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "01-09-2022 01:00 AM",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "09-01-2023",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                      ]),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Table(
                    children: [
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Fee Payment Deadline",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Course Start date",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "09-01-2023",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "09-01-2023",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                      ]),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Table(
                    children: [
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Estimated Course Completion date",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Course Fees Currency",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "09-01-2023",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "INR",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                      ]),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Table(
                    children: [
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Course Fees in AUD",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Course Fees in INR",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "9800 AUD",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "100000000 INR",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                      ]),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Table(
                    children: [
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "OSHC Fees",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Total Fees in AUD",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "9800 AUD",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "1000000 AUD",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                      ]),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Table(
                    children: [
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Total Fees in INR",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Reason of Rejected",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "9800 INR",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "1000000 INR",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                      ]),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: CustomAutoSizeTextMontserrat(
                    text: "Specify conditionals for conditional offer",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Align(
                    alignment: AlignmentDirectional.topStart,
                    child: CustomAutoSizeTextMontserrat(text: "...........")),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: CustomAutoSizeTextMontserrat(
                    text: "FUll Offer Letter Documnet",
                    textColor: ThemeConstants.bluecolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: ThemeConstants.GreenColor),
                        primary: ThemeConstants.whitecolor, // background
                        onPrimary: ThemeConstants.whitecolor, // foreground
                      ),
                      onPressed: () {},
                      child: CustomAutoSizeTextMontserrat(
                        text: "Upload",
                        textColor: ThemeConstants.GreenColor,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: ThemeConstants.bluecolor),
                        primary: ThemeConstants.whitecolor, // background
                        onPrimary: ThemeConstants.whitecolor, // foreground
                      ),
                      onPressed: () {},
                      child: CustomAutoSizeTextMontserrat(
                        text: "Download",
                        textColor: ThemeConstants.bluecolor,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: ThemeConstants.orangeColor),
                        primary: ThemeConstants.whitecolor, // background
                        onPrimary: ThemeConstants.whitecolor, // foreground
                      ),
                      onPressed: () {},
                      child: CustomAutoSizeTextMontserrat(
                        text: "View",
                        textColor: ThemeConstants.orangeColor,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: CustomAutoSizeTextMontserrat(
                    text: "Rejection Document",
                    textColor: ThemeConstants.bluecolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: ThemeConstants.GreenColor),
                        primary: ThemeConstants.whitecolor, // background
                        onPrimary: ThemeConstants.whitecolor, // foreground
                      ),
                      onPressed: () {},
                      child: CustomAutoSizeTextMontserrat(
                        text: "Upload",
                        textColor: ThemeConstants.GreenColor,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: ThemeConstants.bluecolor),
                        primary: ThemeConstants.whitecolor, // background
                        onPrimary: ThemeConstants.whitecolor, // foreground
                      ),
                      onPressed: () {},
                      child: CustomAutoSizeTextMontserrat(
                        text: "Download",
                        textColor: ThemeConstants.bluecolor,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: ThemeConstants.orangeColor),
                        primary: ThemeConstants.whitecolor, // background
                        onPrimary: ThemeConstants.whitecolor, // foreground
                      ),
                      onPressed: () {},
                      child: CustomAutoSizeTextMontserrat(
                        text: "View",
                        textColor: ThemeConstants.orangeColor,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: CustomAutoSizeTextMontserrat(
                    text: "Conditional offer Document",
                    textColor: ThemeConstants.bluecolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: ThemeConstants.GreenColor),
                        primary: ThemeConstants.whitecolor, // background
                        onPrimary: ThemeConstants.whitecolor, // foreground
                      ),
                      onPressed: () {},
                      child: CustomAutoSizeTextMontserrat(
                        text: "Upload",
                        textColor: ThemeConstants.GreenColor,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: ThemeConstants.bluecolor),
                        primary: ThemeConstants.whitecolor, // background
                        onPrimary: ThemeConstants.whitecolor, // foreground
                      ),
                      onPressed: () {},
                      child: CustomAutoSizeTextMontserrat(
                        text: "Download",
                        textColor: ThemeConstants.bluecolor,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: ThemeConstants.orangeColor),
                        primary: ThemeConstants.whitecolor, // background
                        onPrimary: ThemeConstants.whitecolor, // foreground
                      ),
                      onPressed: () {},
                      child: CustomAutoSizeTextMontserrat(
                        text: "View",
                        textColor: ThemeConstants.orangeColor,
                      ),
                    ),
                  ],
                ),

                //
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Table(
                    children: [
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Application Submission Date",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Offer Date",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "01-09-2022 01:00 AM",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "22-09-2022",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                      ]),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Table(
                    children: [
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Offer lapse Date",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Conditional offer date",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "01-09-2022 01:00 AM",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "09-01-2023",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                      ]),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Table(
                    children: [
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Fee Payment Deadline",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Course Start date",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "09-01-2023",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "09-01-2023",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                      ]),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Table(
                    children: [
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Estimated Course Completion date",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Course Fees Currency",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "09-01-2023",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "INR",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                      ]),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Table(
                    children: [
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Course Fees in AUD",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Course Fees in INR",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "9800 AUD",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "100000000 INR",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                      ]),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Table(
                    children: [
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "OSHC Fees",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Total Fees in AUD",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "9800 AUD",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "1000000 AUD",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                      ]),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Table(
                    children: [
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Total Fees in INR",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Reason of Rejected",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "9800 INR",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "1000000 INR",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                      ]),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: CustomAutoSizeTextMontserrat(
                    text: "Specify conditionals for conditional offer",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Align(
                    alignment: AlignmentDirectional.topStart,
                    child: CustomAutoSizeTextMontserrat(text: "...........")),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: CustomAutoSizeTextMontserrat(
                    text: "FUll Offer Letter Documnet",
                    textColor: ThemeConstants.bluecolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: ThemeConstants.GreenColor),
                        primary: ThemeConstants.whitecolor, // background
                        onPrimary: ThemeConstants.whitecolor, // foreground
                      ),
                      onPressed: () {},
                      child: CustomAutoSizeTextMontserrat(
                        text: "Upload",
                        textColor: ThemeConstants.GreenColor,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: ThemeConstants.bluecolor),
                        primary: ThemeConstants.whitecolor, // background
                        onPrimary: ThemeConstants.whitecolor, // foreground
                      ),
                      onPressed: () {},
                      child: CustomAutoSizeTextMontserrat(
                        text: "Download",
                        textColor: ThemeConstants.bluecolor,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: ThemeConstants.orangeColor),
                        primary: ThemeConstants.whitecolor, // background
                        onPrimary: ThemeConstants.whitecolor, // foreground
                      ),
                      onPressed: () {},
                      child: CustomAutoSizeTextMontserrat(
                        text: "View",
                        textColor: ThemeConstants.orangeColor,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: CustomAutoSizeTextMontserrat(
                    text: "Rejection Document",
                    textColor: ThemeConstants.bluecolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: ThemeConstants.GreenColor),
                        primary: ThemeConstants.whitecolor, // background
                        onPrimary: ThemeConstants.whitecolor, // foreground
                      ),
                      onPressed: () {},
                      child: CustomAutoSizeTextMontserrat(
                        text: "Upload",
                        textColor: ThemeConstants.GreenColor,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: ThemeConstants.bluecolor),
                        primary: ThemeConstants.whitecolor, // background
                        onPrimary: ThemeConstants.whitecolor, // foreground
                      ),
                      onPressed: () {},
                      child: CustomAutoSizeTextMontserrat(
                        text: "Download",
                        textColor: ThemeConstants.bluecolor,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: ThemeConstants.orangeColor),
                        primary: ThemeConstants.whitecolor, // background
                        onPrimary: ThemeConstants.whitecolor, // foreground
                      ),
                      onPressed: () {},
                      child: CustomAutoSizeTextMontserrat(
                        text: "View",
                        textColor: ThemeConstants.orangeColor,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: CustomAutoSizeTextMontserrat(
                    text: "Conditional offer Document",
                    textColor: ThemeConstants.bluecolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: ThemeConstants.GreenColor),
                        primary: ThemeConstants.whitecolor, // background
                        onPrimary: ThemeConstants.whitecolor, // foreground
                      ),
                      onPressed: () {},
                      child: CustomAutoSizeTextMontserrat(
                        text: "Upload",
                        textColor: ThemeConstants.GreenColor,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: ThemeConstants.bluecolor),
                        primary: ThemeConstants.whitecolor, // background
                        onPrimary: ThemeConstants.whitecolor, // foreground
                      ),
                      onPressed: () {},
                      child: CustomAutoSizeTextMontserrat(
                        text: "Download",
                        textColor: ThemeConstants.bluecolor,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: ThemeConstants.orangeColor),
                        primary: ThemeConstants.whitecolor, // background
                        onPrimary: ThemeConstants.whitecolor, // foreground
                      ),
                      onPressed: () {},
                      child: CustomAutoSizeTextMontserrat(
                        text: "View",
                        textColor: ThemeConstants.orangeColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
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
                        text: "Application Submission Details",
                        textColor: ThemeConstants.blackcolor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Table(
                    children: [
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Offer Status",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Acknowledgement Number",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "TAT Lapse",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "098FFGH8767DGF7443FDGs",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                      ]),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: CustomAutoSizeTextMontserrat(
                    text: "Acknowledgement Doc",
                    textColor: ThemeConstants.bluecolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: ThemeConstants.GreenColor),
                        primary: ThemeConstants.whitecolor, // background
                        onPrimary: ThemeConstants.whitecolor, // foreground
                      ),
                      onPressed: () {},
                      child: CustomAutoSizeTextMontserrat(
                        text: "Upload",
                        textColor: ThemeConstants.GreenColor,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: ThemeConstants.bluecolor),
                        primary: ThemeConstants.whitecolor, // background
                        onPrimary: ThemeConstants.whitecolor, // foreground
                      ),
                      onPressed: () {},
                      child: CustomAutoSizeTextMontserrat(
                        text: "Download",
                        textColor: ThemeConstants.bluecolor,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: ThemeConstants.orangeColor),
                        primary: ThemeConstants.whitecolor, // background
                        onPrimary: ThemeConstants.whitecolor, // foreground
                      ),
                      onPressed: () {},
                      child: CustomAutoSizeTextMontserrat(
                        text: "View",
                        textColor: ThemeConstants.orangeColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
