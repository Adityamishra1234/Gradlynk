import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:studentpanel/ui/controllers/applicationcompletedetails.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/applicationdetailmodel.dart';
import 'package:studentpanel/ui/screen/test/downloadtestfile.dart';
import 'package:studentpanel/ui/screen/test/takepicturescreen.dart';
import 'package:studentpanel/ui/screen/test/uploadfile.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/custom_doc_viewer.dart';
import 'package:studentpanel/widgets/custom_image_viewer.dart';
import 'package:studentpanel/widgets/custom_pdf_viewr.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';
import 'package:studentpanel/widgets/download_file.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:flutter_share/flutter_share.dart';

class ApplicationCompleteDetails extends StatefulWidget {
  static const routeNamed = '/ApplicationCompleteDetails';
  ApplicationCompleteDetails({Key? key});

  @override
  State<ApplicationCompleteDetails> createState() =>
      _ApplicationCompleteDetailsState();
}

class _ApplicationCompleteDetailsState
    extends State<ApplicationCompleteDetails> {
  final Dio dio = Dio();
  bool loading = false;
  double progress = 0;

  final rowSpacer2 = const TableRow(children: [
    SizedBox(
      height: 3,
    ),
    SizedBox(
      height: 3,
    )
  ]);

  var controller = Get.put(ApplicationCompleteDetailsController());

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
    double width = MediaQuery.of(context).size.width;
    if (displayMobileLayout == true) {
      width = MediaQuery.of(context).size.width - 240;
    }
    return Scaffold(
        appBar: CustomAppBar("title"),
        drawer: displayMobileLayout == false ? const CustomDrawer() : null,
        body: GetBuilder<ApplicationCompleteDetailsController>(builder: (_) {
          return _.loadingApplicationCompleteDetails.value == true
              ? Row(
                  children: [
                    if (displayMobileLayout == true) const CustomDrawer(),
                    Flexible(
                      child: Container(
                        color: ThemeConstants.whitecolor,
                        child: ListView(
                          controller: ScrollController(),
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
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Card(
                                elevation: 0,
                                child: ConfigurableExpansionTile(
                                  header: SizedBox(
                                    width: width - 20,
                                    height: 40,
                                    child: Row(
                                      children: [
                                        CustomAutoSizeTextMontserrat(
                                          text:
                                              "Application Submission Details",
                                          textColor: ThemeConstants.blackcolor,
                                          fontWeight: FontWeight.bold,
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
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            CustomAutoSizeTextMontserrat(
                                              text: "Acknowledgement Number",
                                              maxLines: 2,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ]),
                                          TableRow(children: [
                                            CustomAutoSizeTextMontserrat(
                                              text: _.model.offerStatus,
                                              textColor:
                                                  ThemeConstants.TextColor,
                                              maxLines: 2,
                                              fontSize: 12,
                                            ),
                                            CustomAutoSizeTextMontserrat(
                                              text:
                                                  _.model.acknowledgementNumber,
                                              textColor:
                                                  ThemeConstants.TextColor,
                                              maxLines: 2,
                                              fontSize: 12,
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
                                            foregroundColor:
                                                ThemeConstants.whitecolor,
                                            side: BorderSide(
                                                color:
                                                    ThemeConstants.GreenColor),
                                            backgroundColor: ThemeConstants
                                                .whitecolor, // foreground
                                          ),
                                          onPressed: () {},
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "Upload",
                                            textColor:
                                                ThemeConstants.GreenColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor:
                                                ThemeConstants.whitecolor,
                                            side: BorderSide(
                                                color:
                                                    ThemeConstants.bluecolor),
                                            backgroundColor: ThemeConstants
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
                                            foregroundColor:
                                                ThemeConstants.whitecolor,
                                            side: BorderSide(
                                                color:
                                                    ThemeConstants.orangeColor),
                                            backgroundColor: ThemeConstants
                                                .whitecolor, // foreground
                                          ),
                                          onPressed: () {
                                            // Get.to(CustomDownloadFile());
                                          },
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "View",
                                            textColor:
                                                ThemeConstants.orangeColor,
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
                              padding: const EdgeInsets.only(left: 10),
                              child: ConfigurableExpansionTile(
                                header: SizedBox(
                                  width: width - 10,
                                  height: 40,
                                  child: Row(
                                    children: [
                                      CustomAutoSizeTextMontserrat(
                                        text: "Offer Details",
                                        textColor: ThemeConstants.blackcolor,
                                        fontWeight: FontWeight.bold,
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
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "Offer Date",
                                            maxLines: 2,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ]),
                                        TableRow(children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: _.model.submissionDate,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: _.model.offerDate,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
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
                                            fontSize: 14,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "Conditional offer date",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ]),
                                        TableRow(children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: _.model.offerLapseDate,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: _.model.conditionalOfferDate,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
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
                                            text: "Fee Payment \nDeadline",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "Course Start date",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ]),
                                        TableRow(children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: _.model.feeDeadline,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: _.model.courseStartDate,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
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
                                                "Estimated Course Completion date",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "Course Fees Currency",
                                            fontSize: 14,
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ]),
                                        TableRow(children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: _.model.completionDate,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: _.model.currencyCode,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
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
                                            fontSize: 14,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "Course Fees in INR",
                                            fontSize: 14,
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ]),
                                        TableRow(children: [
                                          CustomAutoSizeTextMontserrat(
                                            text:
                                                "${_.model.annualTutionFees ?? ""} ${_.model.currencyCode ?? ""}",
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text:
                                                " ${_.model.annualTutionFeesInr ?? ""} INR",
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
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
                                            fontSize: 14,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text:
                                                "Total Fees in ${_.model.currencyCode}",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ]),
                                        TableRow(children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: _.model.oSHCFees,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: (_.model.totalfees ?? "") +
                                                (_.model.currencyCode ?? ""),
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
                                          ),
                                        ]),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
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
                                            fontSize: 14,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "Reason of Rejected",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ]),
                                        TableRow(children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: "9800 INR hardcode",
                                            fontSize: 12,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "1000000 INR hard code",
                                            fontSize: 12,
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
                                      text:
                                          "Specify conditionals for conditional offer",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),

                                  Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "........... hard code",
                                        textColor: ThemeConstants.TextColor,
                                        fontSize: 12,
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
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
                                          foregroundColor:
                                              ThemeConstants.whitecolor,
                                          side: BorderSide(
                                              color: ThemeConstants.GreenColor),
                                          backgroundColor: ThemeConstants
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
                                          foregroundColor:
                                              ThemeConstants.whitecolor,
                                          side: BorderSide(
                                              color: ThemeConstants.bluecolor),
                                          backgroundColor: ThemeConstants
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
                                          foregroundColor:
                                              ThemeConstants.whitecolor,
                                          side: BorderSide(
                                              color:
                                                  ThemeConstants.orangeColor),
                                          backgroundColor: ThemeConstants
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
                                      text: "Rejection Document",
                                      textColor: ThemeConstants.bluecolor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor:
                                              ThemeConstants.whitecolor,
                                          side: BorderSide(
                                              color: ThemeConstants.GreenColor),
                                          backgroundColor: ThemeConstants
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
                                          foregroundColor:
                                              ThemeConstants.whitecolor,
                                          side: BorderSide(
                                              color: ThemeConstants.bluecolor),
                                          backgroundColor: ThemeConstants
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
                                          foregroundColor:
                                              ThemeConstants.whitecolor,
                                          side: BorderSide(
                                              color:
                                                  ThemeConstants.orangeColor),
                                          backgroundColor: ThemeConstants
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
                                      text: "Conditional offer Document",
                                      textColor: ThemeConstants.bluecolor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor:
                                              ThemeConstants.whitecolor,
                                          side: BorderSide(
                                              color: ThemeConstants.GreenColor),
                                          backgroundColor: ThemeConstants
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
                                          foregroundColor:
                                              ThemeConstants.whitecolor,
                                          side: BorderSide(
                                              color: ThemeConstants.bluecolor),
                                          backgroundColor: ThemeConstants
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
                                          foregroundColor:
                                              ThemeConstants.whitecolor,
                                          side: BorderSide(
                                              color:
                                                  ThemeConstants.orangeColor),
                                          backgroundColor: ThemeConstants
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

                                  //
                                ],
                              ),
                            ),
                            Divider(
                              color: ThemeConstants.TextColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: ConfigurableExpansionTile(
                                header: SizedBox(
                                  width: width - 10,
                                  height: 40,
                                  child: Row(
                                    children: [
                                      CustomAutoSizeTextMontserrat(
                                        text: "Offer Acceptance",
                                        textColor: ThemeConstants.blackcolor,
                                        fontWeight: FontWeight.bold,
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
                                            text: "Offer Acceptance status",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "Offer Acceptance Date",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ]),
                                        TableRow(children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: _.model.acceptanceStage,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: _.model.acceptanceDate,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
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
                                            text: "Payment Option",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "Amount Paid",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ]),
                                        TableRow(children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: _.model.paymentOption,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: _.model.amountPaid,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
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
                                            text: "Date of Payment",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "Transacted by",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ]),
                                        TableRow(children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: _.model.dateOfPayment,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "applicationDetailModel.",
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
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
                                            text: "SIEC Person",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "Mode of Payment",
                                            fontSize: 14,
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ]),
                                        TableRow(children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: _.model.siecEmployee,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: _.model.modeOfPayment,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
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
                                            text: "Balance Fee",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "COE/CAS/I-20 Receipt",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ]),
                                        TableRow(children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: _.model.balanceFee,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text:
                                                "applicationDetailModel.coeRecevied",
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
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
                                      text: "Confirmation Received Date/Time",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: CustomAutoSizeTextMontserrat(
                                        text: _.model.conditionalOfferDate,
                                        textColor: ThemeConstants.TextColor,
                                        fontSize: 12,
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional.topStart,
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Payment Receipt Doc",
                                      textColor: ThemeConstants.bluecolor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor:
                                              ThemeConstants.whitecolor,
                                          side: BorderSide(
                                              color: ThemeConstants.GreenColor),
                                          backgroundColor: ThemeConstants
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
                                          foregroundColor:
                                              ThemeConstants.whitecolor,
                                          side: BorderSide(
                                              color: ThemeConstants.bluecolor),
                                          backgroundColor: ThemeConstants
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
                                          foregroundColor:
                                              ThemeConstants.whitecolor,
                                          side: BorderSide(
                                              color:
                                                  ThemeConstants.orangeColor),
                                          backgroundColor: ThemeConstants
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
                                      text: "CAS/I-20/COE Doc",
                                      textColor: ThemeConstants.bluecolor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor:
                                              ThemeConstants.whitecolor,
                                          side: BorderSide(
                                              color: ThemeConstants.GreenColor),
                                          backgroundColor: ThemeConstants
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
                                          foregroundColor:
                                              ThemeConstants.whitecolor,
                                          side: BorderSide(
                                              color: ThemeConstants.bluecolor),
                                          backgroundColor: ThemeConstants
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
                                          foregroundColor:
                                              ThemeConstants.whitecolor,
                                          side: BorderSide(
                                              color:
                                                  ThemeConstants.orangeColor),
                                          backgroundColor: ThemeConstants
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
                            Divider(
                              color: ThemeConstants.TextColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: ConfigurableExpansionTile(
                                header: SizedBox(
                                  width: width - 10,
                                  height: 40,
                                  child: Row(
                                    children: [
                                      CustomAutoSizeTextMontserrat(
                                        text: "Defer Information",
                                        textColor: ThemeConstants.blackcolor,
                                        fontWeight: FontWeight.bold,
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
                                            text: "Reason for Defer",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "Defer Till",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ]),
                                        TableRow(children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: "Scholarship hard code",
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "March 2021 hard code",
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
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
                                      text: "Deferment Status",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Defer Approved hard code",
                                        textColor: ThemeConstants.TextColor,
                                        fontSize: 12,
                                      )),
                                ],
                              ),
                            ),
                            Divider(
                              color: ThemeConstants.TextColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: ConfigurableExpansionTile(
                                header: SizedBox(
                                  width: width - 10,
                                  height: 40,
                                  child: Row(
                                    children: [
                                      CustomAutoSizeTextMontserrat(
                                        text: "Withdraw Information",
                                        textColor: ThemeConstants.blackcolor,
                                        fontWeight: FontWeight.bold,
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
                                            text: "Reason for Withdraw",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "Withdrawal Status",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ]),
                                        TableRow(children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: "Plan Drop hard code",
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text:
                                                "Request from Student hard code",
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
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
                                                "Applied for other University",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "How did you apply?",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ]),
                                        TableRow(children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: "Yes hard code",
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "Self hard code",
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
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
                                            text: "Country Name",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "University Name",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ]),
                                        TableRow(children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: "Canada hard code",
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text:
                                                "University of the Fraser Valley hard code",
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                            fontSize: 12,
                                          ),
                                        ]),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: ThemeConstants.TextColor,
                            ),
                            Card(
                              elevation: 0,
                              shadowColor: ThemeConstants.lightgreycolor,
                              child: ConfigurableExpansionTile(
                                header: SizedBox(
                                  width: width - 15,
                                  height: 40,
                                  child: Row(
                                    children: [
                                      CustomAutoSizeTextMontserrat(
                                        text: "Document",
                                        textColor: ThemeConstants.blackcolor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      const Spacer(),
                                      const Icon(Icons.keyboard_arrow_down),
                                    ],
                                  ),
                                ),
                                children: [...documentList(_.model, context)],
                              ),
                            ),
                            Divider(
                              color: ThemeConstants.TextColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: getLoading(context),
                );
        }));
  }

  // Function
  List<Widget> documentList(
      ApplicationDetailModel model, BuildContext context) {
    List<Widget> documentlist = [];
    List temp = [];

    for (var i = 0; i < model.documents!.length; i++) {
      temp.add(model.documents![i].documentParentCategory);
    }
    temp = temp.toSet().toList();
    List<Map<String, List<Widget>>> list = [];
    for (var i = 0; i < temp.length; i++) {
      list.add({temp[i]: []});
    }
    for (var i = 0; i < model.documents!.length; i++) {
      for (var j = 0; j < list.length; j++) {
        if (list[j].entries.first.key ==
            model.documents![i].documentParentCategory) {
          list[j].entries.first.value.add(Card(
                elevation: 5,
                shadowColor: ThemeConstants.whitecolor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: ThemeConstants.lightgreycolor, width: 2.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, top: 5, bottom: 5, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAutoSizeTextMontserrat(
                        text: model.documents![i].documentName,
                        textColor: ThemeConstants.bluecolor,
                        fontWeight: FontWeight.bold,
                      ),
                      Table(
                        children: [
                          TableRow(children: [
                            CustomAutoSizeTextMontserrat(
                              text: "Mandatory/Non-Mandatory: ",
                              fontSize: 14,
                              maxLines: 2,
                              fontWeight: FontWeight.bold,
                            ),
                            CustomAutoSizeTextMontserrat(
                              text: "Required By",
                              fontSize: 14,
                              maxLines: 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ]),
                          rowSpacer2,
                          TableRow(children: [
                            CustomAutoSizeTextMontserrat(
                              text: model.documents![i].mandatoryStatus,
                              textColor: ThemeConstants.TextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              maxLines: 2,
                            ),
                            CustomAutoSizeTextMontserrat(
                              text: model.documents![i].requiredBy,
                              textColor: ThemeConstants.TextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              maxLines: 2,
                            ),
                          ]),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomAutoSizeTextMontserrat(text: "Uploaded By:"),
                      CustomAutoSizeTextMontserrat(
                        text: model.documents![i].uploadedBy,
                        textColor: ThemeConstants.TextColor,
                      ),
                      Row(
                        children: [
                          //Upload
                          if (getNUllChecker(model.documents![i].viewLink) ==
                              true)
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: ThemeConstants.whitecolor,
                                side: BorderSide(
                                    color: ThemeConstants.GreenColor),
                                backgroundColor:
                                    ThemeConstants.whitecolor, // foreground
                              ),
                              onPressed: () {
                                getSourceSelected(
                                    callbackSelectedSource1,
                                    model.documents![i].id.toString(),
                                    i,
                                    Get.arguments.toString());
                              },
                              child: CustomAutoSizeTextMontserrat(
                                text: "Upload",
                                textColor: ThemeConstants.GreenColor,
                              ),
                            ),
                          if (getNUllChecker(model.documents![i].viewLink) ==
                              true)
                            const SizedBox(
                              width: 20,
                            ),
                          //Download
                          if (getNUllChecker(model.documents![i].viewLink) ==
                              false)
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: ThemeConstants.whitecolor,
                                side:
                                    BorderSide(color: ThemeConstants.bluecolor),
                                backgroundColor:
                                    ThemeConstants.whitecolor, // foreground
                              ),
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             CustomDownloadFile(
                                //               url: model.documents![i].viewLink,
                                //             )));

                                downloadFile(model.documents![i].viewLink);
                              },
                              child: CustomAutoSizeTextMontserrat(
                                text: "Download",
                                textColor: ThemeConstants.bluecolor,
                              ),
                            ),
                          if (getNUllChecker(model.documents![i].viewLink) ==
                              false)
                            const SizedBox(
                              width: 20,
                            ),
                          //View
                          if (getNUllChecker(model.documents![i].viewLink) ==
                              false)
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: ThemeConstants.whitecolor,
                                side: BorderSide(
                                    color: ThemeConstants.orangeColor),
                                backgroundColor:
                                    ThemeConstants.whitecolor, // foreground
                              ),
                              onPressed: () {
                                if (model.documents![i].viewLink
                                    .toString()
                                    .contains("pdf")) {
                                  //TODO
                                  Get.to(CustomPDFViewer(
                                    url:
                                        model.documents![i].viewLink.toString(),
                                  ));
                                } else if (model.documents![i].viewLink
                                    .toString()
                                    .contains("doc")) {
                                  //TODO
                                  Get.to(CustomDocumentViewer(
                                    url: model.documents![i].viewLink!,
                                  ));
                                } else if (model.documents![i].viewLink
                                    .toString()
                                    .contains("docx")) {
                                  //TODO
                                  Get.to(CustomDocumentViewer(
                                    url: model.documents![i].viewLink!,
                                  ));
                                } else {
                                  //TODO
                                  Get.to(CustomImageViewer(
                                    url: model.documents![i].viewLink!,
                                  ));
                                }
                              },
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
              ));
        }
      }
    }
    for (var i = 0; i < list.length; i++) {
      documentlist.add(Padding(
        padding: const EdgeInsets.only(left: 15, top: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: list[i].entries.first.key,
            textColor: ThemeConstants.bluecolor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ));
      documentlist.addAll(list[i].entries.first.value);
    }
    return documentlist;
  }

  Future<bool> saveVideo(String url, String fileName) async {
    Directory directory;
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = (await getExternalStorageDirectory())!;
          String newPath = "";
          List<String> paths = directory.path.split("/");
          for (int x = 1; x < paths.length; x++) {
            String folder = paths[x];
            if (folder != "Android") {
              newPath += "/$folder";
            } else {
              break;
            }
          }
          newPath = "$newPath/SIEC";
          directory = Directory(newPath);
        } else {
          return false;
        }
      } else {
        if (await _requestPermission(Permission.storage)) {
          print("aman2");
          directory = await getApplicationDocumentsDirectory();
          print("aman3");
        } else {
          return false;
        }
      }
      File saveFile = File("${directory.path}/$fileName");
      if (!await directory.exists()) {
        print("aman4");
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        print("aman5");
        await dio.download(url, saveFile.path,
            onReceiveProgress: (value1, value2) {
          setState(() {
            progress = value1 / value2;
            print(progress);
          });
        });
        if (Platform.isIOS) {
          print("aman6");

          shareFile(saveFile.path);
        }
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  downloadFile(String url) async {
    setState(() {
      loading = true;
      progress = 0;
    });
    bool downloaded = await saveVideo(url,
        reverseStringUsingSplit(reverseStringUsingSplit(url).split("/")[0]));
    if (downloaded) {
      if (Platform.isAndroid) {
        Get.snackbar("File download", "complete download",
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      print("Problem Downloading File");
    }
    setState(() {
      loading = false;
    });
  }

  Future<void> shareFile(String filepath) async {
    print("aman1");
    await FlutterShare.shareFile(
      title: filepath,
      filePath: filepath,
    );
    print("aman7");
  }

  callbackSelectedSource1(data) async {
    List temp = [];
    temp = data.toString().split(",");
    try {
      if (temp[0].toString() == "Camera") {
        final cameras = await availableCameras();

        // Get a specific camera from the list of available cameras.
        final firstCamera = cameras.first;
        // String id = DateTime.now().toIso8601String();
        Get.to(TakePictureScreen(
          camera: firstCamera,
          id: temp[1],
          index: temp[2],
          applicationId: Get.arguments.toString(),
        ));
      } else {
        Get.find<ApplicationCompleteDetailsController>()
            .uploadDocument(temp[1], int.parse(temp[2]));
        // await controller.uploadDocument();
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
