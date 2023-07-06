import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/controllers/visa.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

class VisaDetail extends StatefulWidget {
  String applicationId;
  VisaDetail({Key? key, required this.applicationId}) : super(key: key);
  static const routeNamed = '/VisaDetail';

  @override
  State<VisaDetail> createState() => _VisaDetailState();
}

class _VisaDetailState extends State<VisaDetail> {
  var controller = Get.put(VisaDetailController());

  final rowSpacer = const TableRow(children: [
    SizedBox(
      height: 3,
    ),
    SizedBox(
      height: 3,
    )
  ]);

  final rowSpacer2 = const TableRow(children: [
    SizedBox(
      height: 3,
    ),
    SizedBox(
      height: 3,
    )
  ]);

  @override
  void initState() {
    controller.getVisDetail(
        Get.find<BaseController>().model1.id.toString(), widget.applicationId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
    double width = MediaQuery.of(context).size.width;
    if (displayMobileLayout == true) {
      width = MediaQuery.of(context).size.width - 240;
    }
    return Scaffold(
        appBar: const CustomAppBar("title"),
        drawer: displayMobileLayout == false
            ? CustomDrawer(
                index: 6,
              )
            : null,
        body: GetBuilder<VisaDetailController>(
            builder: (controller1) => controller1.loadingVisaDetails.value ==
                    true
                ? Row(
                    children: [
                      if (displayMobileLayout == true)
                        CustomDrawer(
                          index: 6,
                        ),
                      Flexible(
                        child: Container(
                          color: ThemeConstants.whitecolor,
                          child: ListView(
                            controller: ScrollController(),
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 20),
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
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Card(
                                  elevation: 0,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12, bottom: 5),
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
                                            rowSpacer,
                                            TableRow(children: [
                                              CustomAutoSizeTextMontserrat(
                                                text: controller
                                                    .visaDetailModel.country,
                                                textColor:
                                                    ThemeConstants.TextColor,
                                                fontSize: 14,
                                                maxLines: 2,
                                              ),
                                              CustomAutoSizeTextMontserrat(
                                                text: controller.visaDetailModel
                                                    .universityName,
                                                fontSize: 14,
                                                textColor:
                                                    ThemeConstants.TextColor,
                                                maxLines: 2,
                                              ),
                                            ]),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12, bottom: 5),
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
                                                textColor:
                                                    ThemeConstants.TextColor,
                                                fontSize: 14,
                                                maxLines: 2,
                                              ),
                                              CustomAutoSizeTextMontserrat(
                                                text: controller.visaDetailModel
                                                    .courseLevel,
                                                textColor:
                                                    ThemeConstants.TextColor,
                                                fontSize: 14,
                                                maxLines: 2,
                                              ),
                                            ]),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 12),
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
                                                textColor:
                                                    ThemeConstants.TextColor,
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
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Card(
                                  elevation: 0,
                                  child: ConfigurableExpansionTile(
                                    header: SizedBox(
                                      width: width - 30,
                                      height: 40,
                                      child: Row(
                                        children: [
                                          CustomAutoSizeTextMontserrat(
                                            text:
                                                "Application Related Documents",
                                            textColor:
                                                ThemeConstants.blackcolor,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          const Spacer(),
                                          const Icon(Icons.keyboard_arrow_down),
                                        ],
                                      ),
                                    ),
                                    childrenBody: Column(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "Offer letter Full Offer",
                                            textColor:
                                                ThemeConstants.blackcolor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .GreenColor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Upload",
                                                  fontSize: 12,
                                                  textColor:
                                                      ThemeConstants.GreenColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .bluecolor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Download",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  textColor:
                                                      ThemeConstants.bluecolor,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .orangeColor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "View",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  textColor: ThemeConstants
                                                      .orangeColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "Fee Receipt",
                                            textColor:
                                                ThemeConstants.blackcolor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .GreenColor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Upload",
                                                  fontSize: 12,
                                                  textColor:
                                                      ThemeConstants.GreenColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .bluecolor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Download",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  textColor:
                                                      ThemeConstants.bluecolor,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .orangeColor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "View",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  textColor: ThemeConstants
                                                      .orangeColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
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
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Card(
                                  elevation: 0,
                                  child: ConfigurableExpansionTile(
                                    header: SizedBox(
                                      width: width - 30,
                                      height: 40,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(),
                                            child: CustomAutoSizeTextMontserrat(
                                              text: "GIC Section",
                                              textColor:
                                                  ThemeConstants.blackcolor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const Spacer(),
                                          const Icon(Icons.keyboard_arrow_down),
                                        ],
                                      ),
                                    ),
                                    childrenBody: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12),
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
                                              rowSpacer,
                                              TableRow(children: [
                                                CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .visaDetailModel.gicAccNo,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                  fontSize: 14,
                                                  maxLines: 2,
                                                ),
                                                CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .visaDetailModel
                                                      .gicAccountUsername,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                  fontSize: 14,
                                                  maxLines: 2,
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12),
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
                                              rowSpacer,
                                              TableRow(children: [
                                                CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .visaDetailModel
                                                      .gicAccountPassword,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                  fontSize: 14,
                                                  maxLines: 2,
                                                ),
                                                CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .visaDetailModel.gicBank,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                  fontSize: 14,
                                                  maxLines: 2,
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12),
                                          child: Table(
                                            children: [
                                              TableRow(children: [
                                                CustomAutoSizeTextMontserrat(
                                                  text:
                                                      "Date of GIC account request",
                                                  maxLines: 2,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ]),
                                              TableRow(children: [
                                                CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .visaDetailModel.gicDate,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                  fontSize: 14,
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
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "Home bank -",
                                            textColor: ThemeConstants.bluecolor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12),
                                          child: Table(
                                            children: [
                                              TableRow(children: [
                                                CustomAutoSizeTextMontserrat(
                                                  text:
                                                      "Country of the home bank",
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
                                              rowSpacer,
                                              TableRow(children: [
                                                CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .visaDetailModel
                                                      .homeBankCountryName,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                  fontSize: 14,
                                                  maxLines: 2,
                                                ),
                                                CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .visaDetailModel
                                                      .homeBankName,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                  fontSize: 14,
                                                  maxLines: 2,
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12),
                                          child: Table(
                                            children: [
                                              TableRow(children: [
                                                CustomAutoSizeTextMontserrat(
                                                  text:
                                                      "Payment receipt received date",
                                                  maxLines: 2,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ]),
                                              TableRow(children: [
                                                CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .visaDetailModel
                                                      .paymentDate,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                  fontSize: 14,
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
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "Related Documents -",
                                            textColor: ThemeConstants.bluecolor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: CustomAutoSizeTextMontserrat(
                                            text:
                                                "TT/Swift copy of Amount Transferred",
                                            textColor:
                                                ThemeConstants.blackcolor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .GreenColor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Upload",
                                                  fontSize: 12,
                                                  textColor:
                                                      ThemeConstants.GreenColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .bluecolor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Download",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  textColor:
                                                      ThemeConstants.bluecolor,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .orangeColor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "View",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  textColor: ThemeConstants
                                                      .orangeColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "GIC Certificate",
                                            textColor:
                                                ThemeConstants.blackcolor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .GreenColor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Upload",
                                                  fontSize: 12,
                                                  textColor:
                                                      ThemeConstants.GreenColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .bluecolor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Download",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  textColor:
                                                      ThemeConstants.bluecolor,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .orangeColor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "View",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  textColor: ThemeConstants
                                                      .orangeColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                color: ThemeConstants.TextColor,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Card(
                                  elevation: 0,
                                  child: ConfigurableExpansionTile(
                                    header: SizedBox(
                                      width: width - 30,
                                      height: 40,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 0),
                                            child: CustomAutoSizeTextMontserrat(
                                              text: "Medical Process",
                                              textColor:
                                                  ThemeConstants.blackcolor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const Spacer(),
                                          const Icon(Icons.keyboard_arrow_down),
                                        ],
                                      ),
                                    ),
                                    childrenBody: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12),
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
                                              rowSpacer,
                                              TableRow(children: [
                                                CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .visaDetailModel
                                                      .medicalProcessState,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                  fontSize: 14,
                                                  maxLines: 2,
                                                ),
                                                CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .visaDetailModel
                                                      .medicalProcessCity,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                  fontSize: 14,
                                                  maxLines: 2,
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12),
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
                                              rowSpacer,
                                              TableRow(children: [
                                                CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .visaDetailModel
                                                      .doctorName,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                  fontSize: 14,
                                                  maxLines: 2,
                                                ),
                                                CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .visaDetailModel
                                                      .doctorAddress,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                  fontSize: 14,
                                                  maxLines: 2,
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12),
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
                                              rowSpacer,
                                              TableRow(children: [
                                                CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .visaDetailModel
                                                      .appointmentDate,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                  fontSize: 14,
                                                  maxLines: 2,
                                                ),
                                                CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .visaDetailModel
                                                      .appointmentTime,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                  fontSize: 14,
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
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "Medical Report",
                                            textColor:
                                                ThemeConstants.blackcolor,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .GreenColor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Upload",
                                                  fontSize: 12,
                                                  textColor:
                                                      ThemeConstants.GreenColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .bluecolor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Download",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  textColor:
                                                      ThemeConstants.bluecolor,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .orangeColor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "View",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  textColor: ThemeConstants
                                                      .orangeColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                color: ThemeConstants.TextColor,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Card(
                                  elevation: 0,
                                  child: ConfigurableExpansionTile(
                                    header: SizedBox(
                                      width: width - 30,
                                      height: 40,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 0),
                                            child: CustomAutoSizeTextMontserrat(
                                              text: "Biometrics",
                                              textColor:
                                                  ThemeConstants.blackcolor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const Spacer(),
                                          const Icon(Icons.keyboard_arrow_down),
                                        ],
                                      ),
                                    ),
                                    childrenBody: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12),
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
                                                  text: controller
                                                      .visaDetailModel
                                                      .biometricsStateName,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                  fontSize: 14,
                                                  maxLines: 2,
                                                ),
                                                CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .visaDetailModel
                                                      .biometricsCityName,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                  fontSize: 14,
                                                  maxLines: 2,
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12),
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
                                                      .visaDetailModel
                                                      .appointmentDate,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                  fontSize: 14,
                                                  maxLines: 2,
                                                ),
                                                CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .visaDetailModel
                                                      .appointmentTime,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                  fontSize: 14,
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
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "Biometric Letter",
                                            textColor:
                                                ThemeConstants.blackcolor,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .GreenColor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Upload",
                                                  fontSize: 12,
                                                  textColor:
                                                      ThemeConstants.GreenColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .bluecolor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Download",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  textColor:
                                                      ThemeConstants.bluecolor,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .orangeColor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "View",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  textColor: ThemeConstants
                                                      .orangeColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                color: ThemeConstants.TextColor,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Card(
                                  elevation: 0,
                                  child: ConfigurableExpansionTile(
                                    header: SizedBox(
                                      width: width - 30,
                                      height: 40,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 0),
                                            child: CustomAutoSizeTextMontserrat(
                                              text: "Visa Submission",
                                              textColor:
                                                  ThemeConstants.blackcolor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const Spacer(),
                                          const Icon(Icons.keyboard_arrow_down),
                                        ],
                                      ),
                                    ),
                                    childrenBody: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12),
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
                                              rowSpacer,
                                              TableRow(children: [
                                                CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .visaDetailModel
                                                      .fileSentThrough,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                  fontSize: 14,
                                                  maxLines: 2,
                                                ),
                                                CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .visaDetailModel
                                                      .visaSubmissionDate,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                  fontSize: 14,
                                                  maxLines: 2,
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12),
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
                                                  text: controller
                                                      .visaDetailModel
                                                      .applicationNumber,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                  fontSize: 14,
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
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "Acknowledgment Receipt",
                                            textColor:
                                                ThemeConstants.blackcolor,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .GreenColor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Upload",
                                                  fontSize: 12,
                                                  textColor:
                                                      ThemeConstants.GreenColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .bluecolor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Download",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  textColor:
                                                      ThemeConstants.bluecolor,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .orangeColor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "View",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  textColor: ThemeConstants
                                                      .orangeColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "PPR Letter",
                                            textColor:
                                                ThemeConstants.blackcolor,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .GreenColor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Upload",
                                                  fontSize: 12,
                                                  textColor:
                                                      ThemeConstants.GreenColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .bluecolor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Download",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  textColor:
                                                      ThemeConstants.bluecolor,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .orangeColor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "View",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  textColor: ThemeConstants
                                                      .orangeColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "Stamped Passport",
                                            textColor:
                                                ThemeConstants.blackcolor,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .GreenColor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Upload",
                                                  fontSize: 12,
                                                  textColor:
                                                      ThemeConstants.GreenColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .bluecolor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Download",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  textColor:
                                                      ThemeConstants.bluecolor,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .orangeColor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "View",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  textColor: ThemeConstants
                                                      .orangeColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                color: ThemeConstants.TextColor,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Card(
                                  elevation: 0,
                                  child: ConfigurableExpansionTile(
                                    header: SizedBox(
                                      width: width - 30,
                                      height: 40,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 0),
                                            child: CustomAutoSizeTextMontserrat(
                                              text: "Visa Payment Details",
                                              textColor:
                                                  ThemeConstants.blackcolor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const Spacer(),
                                          const Icon(Icons.keyboard_arrow_down),
                                        ],
                                      ),
                                    ),
                                    childrenBody: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12),
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
                                              rowSpacer,
                                              TableRow(children: [
                                                CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .visaDetailModel
                                                      .paymentAmount
                                                      .toString(),
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                  fontSize: 14,
                                                  maxLines: 2,
                                                ),
                                                CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .visaDetailModel
                                                      .paymentDate,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                  fontSize: 14,
                                                  maxLines: 2,
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12),
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
                                                  text:
                                                      "Payment Reference Number",
                                                  fontSize: 14,
                                                  maxLines: 2,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ]),
                                              rowSpacer,
                                              TableRow(children: [
                                                CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .visaDetailModel
                                                      .paymentMode,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                  fontSize: 14,
                                                  maxLines: 2,
                                                ),
                                                CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .visaDetailModel
                                                      .referenceNumber,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                  fontSize: 14,
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
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "Payment Receipt",
                                            textColor:
                                                ThemeConstants.blackcolor,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .GreenColor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Upload",
                                                  fontSize: 12,
                                                  textColor:
                                                      ThemeConstants.GreenColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .bluecolor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Download",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  textColor:
                                                      ThemeConstants.bluecolor,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .orangeColor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "View",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  textColor: ThemeConstants
                                                      .orangeColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                color: ThemeConstants.TextColor,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Card(
                                  elevation: 0,
                                  child: ConfigurableExpansionTile(
                                    header: SizedBox(
                                      width: width - 30,
                                      height: 40,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 0),
                                            child: CustomAutoSizeTextMontserrat(
                                              text: "Visa Outcome",
                                              textColor:
                                                  ThemeConstants.blackcolor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const Spacer(),
                                          const Icon(Icons.keyboard_arrow_down),
                                        ],
                                      ),
                                    ),
                                    childrenBody: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12),
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
                                              rowSpacer,
                                              TableRow(children: [
                                                CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .visaDetailModel
                                                      .visaOutcome,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                  fontSize: 14,
                                                  maxLines: 2,
                                                ),
                                                CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .visaDetailModel
                                                      .visaOutcomeDate,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                  fontSize: 14,
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
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "Visa Grant Letter",
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .GreenColor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Upload",
                                                  fontSize: 12,
                                                  textColor:
                                                      ThemeConstants.GreenColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .bluecolor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Download",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  textColor:
                                                      ThemeConstants.bluecolor,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .orangeColor), // foreground
                                                ),
                                                onPressed: () {},
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "View",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  textColor: ThemeConstants
                                                      .orangeColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                color: ThemeConstants.TextColor,
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: getLoading(context),
                  )));
  }
}
