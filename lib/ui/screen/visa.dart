import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class VisaDetail extends StatelessWidget {
  const VisaDetail({Key? key}) : super(key: key);
  static const routeNamed = '/VisaDetail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("title"),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: CustomAutoSizeTextMontserrat(
              text: "My Visa",
              textColor: ThemeConstants.bluecolor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
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
                        text: "Application Related Documents",
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
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: CustomAutoSizeTextMontserrat(
                    text: "Offer letter Full Offer",
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
                    SizedBox(
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
                    SizedBox(
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
                    text: "Fee Receipt",
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
                    SizedBox(
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
                    SizedBox(
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
                        text: "GIC Section",
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
                          text: "GIC Account Number",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "GIC Account Username",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "98794291",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "digvijaysingh00999@gmail.com",
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
                          text: "GIC Account Password",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Name of the GIC Bank",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "•••••••••",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Scotia",
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
                          text: "Date of GIC account request",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "2021-06-10",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                      ]),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: CustomAutoSizeTextMontserrat(
                    text: "Home bank -",
                    textColor: ThemeConstants.bluecolor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Table(
                    children: [
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Country of the home bank",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Name of the Home bank",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Canada",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "HDFC Bank",
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
                          text: "Payment receipt received date",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "2021-06-24",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                      ]),
                    ],
                  ),
                ),
                CustomAutoSizeTextMontserrat(
                  text: "Related Documents -",
                  textColor: ThemeConstants.bluecolor,
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: CustomAutoSizeTextMontserrat(
                    text: "TT/Swift copy of Amount Transferred",
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
                    SizedBox(
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
                    SizedBox(
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
                    text: "GIC Certificate",
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
                    SizedBox(
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
                    SizedBox(
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
                        text: "Medical Process",
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
                          text: "State",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Select City",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Punjab",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Ludhiana",
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
                          text: "Name of the doctor",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Address of the doctor",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "dr us sidhu",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "LDH",
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
                          text: "Appointment Date",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Appointment Date",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "2021-05-27",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "07:00",
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
                    text: "Medical Report",
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
                    SizedBox(
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
                    SizedBox(
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
                        text: "Biometrics",
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
                          text: "State",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Select City",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Punjab",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Ludhiana",
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
                          text: "Appointment Date",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Appointment Time",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "2021-05-27",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "07:00",
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
                    text: "Biometric Letter",
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
                    SizedBox(
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
                    SizedBox(
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
                        text: "Visa Submission (To High Commission)",
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
                          text: "File sent through",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Visa Sent Date",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "High Commission website",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "2021-07-16",
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
                          text: "Acknowledgment/TRN/Application number",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "54566",
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
                    text: "Acknowledgment Receipt",
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
                    SizedBox(
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
                    SizedBox(
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
                    text: "PPR Letter",
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
                    SizedBox(
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
                    SizedBox(
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
                    text: "Stamped Passport",
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
                    SizedBox(
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
                    SizedBox(
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
                        text: "Visa Payment Details",
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
                          text: "Visa Fee Amount",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Payment Date",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "235",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "2021-07-16",
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
                          text: "Payment Mode",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Payment Reference Number",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "54566",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "663258560010585340",
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
                    text: "Payment Receipt",
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
                    SizedBox(
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
                    SizedBox(
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
                        text: "Visa Outcome",
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
                          text: "Visa outcome",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Date",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      TableRow(children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Visa Granted",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "2021-10-08",
                          textColor: ThemeConstants.TextColor,
                          maxLines: 2,
                        ),
                      ]),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: CustomAutoSizeTextMontserrat(
                    text: "Visa Grant Letter",
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
                    SizedBox(
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
                    SizedBox(
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
        ],
      ),
    );
  }
}
