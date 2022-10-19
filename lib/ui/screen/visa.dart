import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/visa.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class VisaDetail extends StatelessWidget {
  VisaDetail({Key? key}) : super(key: key);
  static const routeNamed = '/VisaDetail';
  var controller = Get.put(VisaDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("title"),
        body: GetBuilder<VisaDetailController>(
            builder: (controller1) => controller1.loadingVisaDetails.value ==
                    true
                ? Container(
                    color: ThemeConstants.whitecolor,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 20),
                          child: CustomAutoSizeTextMontserrat(
                            text: "My Visa",
                            textColor: ThemeConstants.bluecolor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Card(
                            elevation: 0,
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: Table(
                                    children: [
                                      TableRow(children: [
                                        CustomAutoSizeTextMontserrat(
                                          text: "Country",
                                          maxLines: 2,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: "University",
                                          maxLines: 2,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ]),
                                      TableRow(children: [
                                        CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .visaDetailModel.country,
                                          textColor: ThemeConstants.TextColor,
                                          fontSize: 14,
                                          maxLines: 2,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .visaDetailModel.universityName,
                                          fontSize: 14,
                                          textColor: ThemeConstants.TextColor,
                                          maxLines: 2,
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: Table(
                                    children: [
                                      TableRow(children: [
                                        CustomAutoSizeTextMontserrat(
                                          text: "Campus Name",
                                          maxLines: 2,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: "Course Level",
                                          maxLines: 2,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ]),
                                      TableRow(children: [
                                        CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .visaDetailModel.campusName,
                                          textColor: ThemeConstants.TextColor,
                                          fontSize: 14,
                                          maxLines: 2,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .visaDetailModel.courseLevel,
                                          textColor: ThemeConstants.TextColor,
                                          fontSize: 14,
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
                                          text: "Course Name",
                                          maxLines: 2,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ]),
                                      TableRow(children: [
                                        CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .visaDetailModel.courseName,
                                          fontSize: 14,
                                          textColor: ThemeConstants.TextColor,
                                          maxLines: 2,
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: ThemeConstants.TextColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Card(
                            elevation: 0,
                            child: ConfigurableExpansionTile(
                              header: SizedBox(
                                width: MediaQuery.of(context).size.width - 30,
                                height: 40,
                                child: Row(
                                  children: [
                                    CustomAutoSizeTextMontserrat(
                                      text: "Application Related Documents",
                                      textColor: ThemeConstants.blackcolor,
                                      fontWeight: FontWeight.w700,
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
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        side: BorderSide(
                                            color: ThemeConstants.GreenColor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                                        side: BorderSide(
                                            color: ThemeConstants.bluecolor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                                        side: BorderSide(
                                            color: ThemeConstants.orangeColor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        side: BorderSide(
                                            color: ThemeConstants.GreenColor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                                        side: BorderSide(
                                            color: ThemeConstants.bluecolor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                                        side: BorderSide(
                                            color: ThemeConstants.orangeColor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                        ),
                        Divider(
                          color: ThemeConstants.TextColor,
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Card(
                            elevation: 0,
                            child: ConfigurableExpansionTile(
                              header: SizedBox(
                                width: MediaQuery.of(context).size.width - 30,
                                height: 40,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(),
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "GIC Section",
                                        textColor: ThemeConstants.blackcolor,
                                        fontWeight: FontWeight.w700,
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
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: "GIC Account Username",
                                          maxLines: 2,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ]),
                                      TableRow(children: [
                                        CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .visaDetailModel.gicAccNo,
                                          textColor: ThemeConstants.TextColor,
                                          maxLines: 2,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: controller.visaDetailModel
                                              .gicAccountUsername,
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
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: "Name of the GIC Bank",
                                          maxLines: 2,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ]),
                                      TableRow(children: [
                                        CustomAutoSizeTextMontserrat(
                                          text: controller.visaDetailModel
                                              .gicAccountPassword,
                                          textColor: ThemeConstants.TextColor,
                                          maxLines: 2,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .visaDetailModel.gicBank,
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
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ]),
                                      TableRow(children: [
                                        CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .visaDetailModel.gicDate,
                                          textColor: ThemeConstants.TextColor,
                                          maxLines: 2,
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                                const SizedBox(
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
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: "Name of the Home bank",
                                          maxLines: 2,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ]),
                                      TableRow(children: [
                                        CustomAutoSizeTextMontserrat(
                                          text: controller.visaDetailModel
                                              .homeBankCountryName,
                                          textColor: ThemeConstants.TextColor,
                                          maxLines: 2,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .visaDetailModel.homeBankName,
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
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ]),
                                      TableRow(children: [
                                        CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .visaDetailModel.paymentDate,
                                          textColor: ThemeConstants.TextColor,
                                          maxLines: 2,
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Related Documents -",
                                    textColor: ThemeConstants.bluecolor,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "TT/Swift copy of Amount Transferred",
                                    textColor: ThemeConstants.bluecolor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        side: BorderSide(
                                            color: ThemeConstants.GreenColor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                                        side: BorderSide(
                                            color: ThemeConstants.bluecolor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                                        side: BorderSide(
                                            color: ThemeConstants.orangeColor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        side: BorderSide(
                                            color: ThemeConstants.GreenColor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                                        side: BorderSide(
                                            color: ThemeConstants.bluecolor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                                        side: BorderSide(
                                            color: ThemeConstants.orangeColor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                        ),
                        Divider(
                          color: ThemeConstants.TextColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Card(
                            elevation: 0,
                            child: ConfigurableExpansionTile(
                              header: SizedBox(
                                width: MediaQuery.of(context).size.width - 30,
                                height: 40,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Medical Process",
                                        textColor: ThemeConstants.blackcolor,
                                        fontWeight: FontWeight.w700,
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
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: "Select City",
                                          maxLines: 2,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ]),
                                      TableRow(children: [
                                        CustomAutoSizeTextMontserrat(
                                          text: controller.visaDetailModel
                                              .medicalProcessState,
                                          textColor: ThemeConstants.TextColor,
                                          maxLines: 2,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: controller.visaDetailModel
                                              .medicalProcessCity,
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
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: "Address of the doctor",
                                          maxLines: 2,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ]),
                                      TableRow(children: [
                                        CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .visaDetailModel.doctorName,
                                          textColor: ThemeConstants.TextColor,
                                          maxLines: 2,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .visaDetailModel.doctorAddress,
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
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: "Appointment Date",
                                          maxLines: 2,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ]),
                                      TableRow(children: [
                                        CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .visaDetailModel.appointmentDate,
                                          textColor: ThemeConstants.TextColor,
                                          maxLines: 2,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .visaDetailModel.appointmentTime,
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
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        side: BorderSide(
                                            color: ThemeConstants.GreenColor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                                        side: BorderSide(
                                            color: ThemeConstants.bluecolor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                                        side: BorderSide(
                                            color: ThemeConstants.orangeColor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                        ),
                        Divider(
                          color: ThemeConstants.TextColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Card(
                            elevation: 0,
                            child: ConfigurableExpansionTile(
                              header: SizedBox(
                                width: MediaQuery.of(context).size.width - 30,
                                height: 40,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Biometrics",
                                        textColor: ThemeConstants.blackcolor,
                                        fontWeight: FontWeight.w700,
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
                                          fontSize: 14,
                                          maxLines: 2,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: "Select City",
                                          fontSize: 14,
                                          maxLines: 2,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ]),
                                      TableRow(children: [
                                        CustomAutoSizeTextMontserrat(
                                          text: controller.visaDetailModel
                                              .biometricsStateName,
                                          textColor: ThemeConstants.TextColor,
                                          maxLines: 2,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: controller.visaDetailModel
                                              .biometricsCityName,
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
                                          fontSize: 14,
                                          maxLines: 2,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: "Appointment Time",
                                          fontSize: 14,
                                          maxLines: 2,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ]),
                                      TableRow(children: [
                                        CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .visaDetailModel.appointmentDate,
                                          textColor: ThemeConstants.TextColor,
                                          maxLines: 2,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .visaDetailModel.appointmentTime,
                                          textColor: ThemeConstants.TextColor,
                                          maxLines: 2,
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Biometric Letter",
                                    textColor: ThemeConstants.bluecolor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        side: BorderSide(
                                            color: ThemeConstants.GreenColor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                                        side: BorderSide(
                                            color: ThemeConstants.bluecolor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                                        side: BorderSide(
                                            color: ThemeConstants.orangeColor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                        ),
                        Divider(
                          color: ThemeConstants.TextColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Card(
                            elevation: 0,
                            child: ConfigurableExpansionTile(
                              header: SizedBox(
                                width: MediaQuery.of(context).size.width - 30,
                                height: 40,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: CustomAutoSizeTextMontserrat(
                                        text:
                                            "Visa Submission (To High Commission)",
                                        textColor: ThemeConstants.blackcolor,
                                        fontWeight: FontWeight.w700,
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
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: "Visa Sent Date",
                                          fontSize: 14,
                                          maxLines: 2,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ]),
                                      TableRow(children: [
                                        CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .visaDetailModel.fileSentThrough,
                                          textColor: ThemeConstants.TextColor,
                                          maxLines: 2,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: controller.visaDetailModel
                                              .visaSubmissionDate,
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
                                          text:
                                              "Acknowledgment/TRN/Application number",
                                          maxLines: 2,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ]),
                                      TableRow(children: [
                                        CustomAutoSizeTextMontserrat(
                                          text: controller.visaDetailModel
                                              .applicationNumber,
                                          textColor: ThemeConstants.TextColor,
                                          maxLines: 2,
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Acknowledgment Receipt",
                                    textColor: ThemeConstants.bluecolor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        side: BorderSide(
                                            color: ThemeConstants.GreenColor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                                        side: BorderSide(
                                            color: ThemeConstants.bluecolor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                                        side: BorderSide(
                                            color: ThemeConstants.orangeColor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        side: BorderSide(
                                            color: ThemeConstants.GreenColor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                                        side: BorderSide(
                                            color: ThemeConstants.bluecolor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                                        side: BorderSide(
                                            color: ThemeConstants.orangeColor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        side: BorderSide(
                                            color: ThemeConstants.GreenColor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                                        side: BorderSide(
                                            color: ThemeConstants.bluecolor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                                        side: BorderSide(
                                            color: ThemeConstants.orangeColor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                        ),
                        Divider(
                          color: ThemeConstants.TextColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Card(
                            elevation: 0,
                            child: ConfigurableExpansionTile(
                              header: SizedBox(
                                width: MediaQuery.of(context).size.width - 30,
                                height: 40,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Visa Payment Details",
                                        textColor: ThemeConstants.blackcolor,
                                        fontWeight: FontWeight.w700,
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
                                          fontSize: 14,
                                          maxLines: 2,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: "Payment Date",
                                          fontSize: 14,
                                          maxLines: 2,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ]),
                                      TableRow(children: [
                                        CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .visaDetailModel.paymentAmount
                                              .toString(),
                                          textColor: ThemeConstants.TextColor,
                                          maxLines: 2,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .visaDetailModel.paymentDate,
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
                                          fontSize: 14,
                                          maxLines: 2,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: "Payment Reference Number",
                                          fontSize: 14,
                                          maxLines: 2,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ]),
                                      TableRow(children: [
                                        CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .visaDetailModel.paymentMode,
                                          textColor: ThemeConstants.TextColor,
                                          maxLines: 2,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .visaDetailModel.referenceNumber,
                                          textColor: ThemeConstants.TextColor,
                                          maxLines: 2,
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Payment Receipt",
                                    textColor: ThemeConstants.bluecolor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        side: BorderSide(
                                            color: ThemeConstants.GreenColor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                                        side: BorderSide(
                                            color: ThemeConstants.bluecolor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                                        side: BorderSide(
                                            color: ThemeConstants.orangeColor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                        ),
                        Divider(
                          color: ThemeConstants.TextColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Card(
                            elevation: 0,
                            child: ConfigurableExpansionTile(
                              header: SizedBox(
                                width: MediaQuery.of(context).size.width - 30,
                                height: 40,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Visa Outcome",
                                        textColor: ThemeConstants.blackcolor,
                                        fontWeight: FontWeight.w700,
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
                                          text: "Visa Outcome",
                                          maxLines: 2,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: "Date",
                                          fontSize: 14,
                                          maxLines: 2,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ]),
                                      TableRow(children: [
                                        CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .visaDetailModel.visaOutcome,
                                          textColor: ThemeConstants.TextColor,
                                          maxLines: 2,
                                        ),
                                        CustomAutoSizeTextMontserrat(
                                          text: controller
                                              .visaDetailModel.visaOutcomeDate,
                                          textColor: ThemeConstants.TextColor,
                                          maxLines: 2,
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Visa Grant Letter",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        side: BorderSide(
                                            color: ThemeConstants.GreenColor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                                        side: BorderSide(
                                            color: ThemeConstants.bluecolor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                                        side: BorderSide(
                                            color: ThemeConstants.orangeColor),
                                        primary: ThemeConstants
                                            .whitecolor, // background
                                        onPrimary: ThemeConstants
                                            .whitecolor, // foreground
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
                        ),
                        Divider(
                          color: ThemeConstants.TextColor,
                        ),
                      ],
                    ),
                  )
                : const Center(child: CircularProgressIndicator())));
  }
}
