import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/applicationsummarycontroller.dart';
import 'package:studentpanel/ui/models/applicationdetailmodel.dart';
import 'package:studentpanel/ui/screen/test/documentdownload.dart';
import 'package:studentpanel/ui/screen/test/downloadtestfile.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/custom_doc_viewer.dart';
import 'package:studentpanel/widgets/custom_image_viewer.dart';
import 'package:studentpanel/widgets/custom_pdf_viewr.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';
import 'package:studentpanel/widgets/download_file.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class ApplicationCompleteDetails extends StatelessWidget {
  ApplicationCompleteDetails({Key? key}) : super(key: key);
  static const routeNamed = '/ApplicationCompleteDetails';
  final rowSpacer2 = const TableRow(children: [
    SizedBox(
      height: 3,
    ),
    SizedBox(
      height: 3,
    )
  ]);

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
    double width = MediaQuery.of(context).size.width;
    if (displayMobileLayout == true) {
      width = MediaQuery.of(context).size.width - 240;
    }
    return Scaffold(
        appBar: CustomAppBar("title"),
        drawer: displayMobileLayout == false ? CustomDrawer() : null,
        body: GetBuilder<ApplicationSummaryController>(builder: (_) {
          return _.loadingApplicationCompleteDetails.value == true
              ? Row(
                  children: [
                    if (displayMobileLayout == true) CustomDrawer(),
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
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                            CustomAutoSizeTextMontserrat(
                                              text: "Acknowledgement Number",
                                              maxLines: 2,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ]),
                                          TableRow(children: [
                                            CustomAutoSizeTextMontserrat(
                                              text: _.applicationDetailModel
                                                  .offerStatus,
                                              textColor:
                                                  ThemeConstants.TextColor,
                                              maxLines: 2,
                                              fontSize: 14,
                                            ),
                                            CustomAutoSizeTextMontserrat(
                                              text: _.applicationDetailModel
                                                  .acknowledgementNumber,
                                              textColor:
                                                  ThemeConstants.TextColor,
                                              maxLines: 2,
                                              fontSize: 14,
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
                                            side: BorderSide(
                                                color:
                                                    ThemeConstants.GreenColor),
                                            primary: ThemeConstants
                                                .whitecolor, // background
                                            onPrimary: ThemeConstants
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
                                            side: BorderSide(
                                                color:
                                                    ThemeConstants.bluecolor),
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
                                                color:
                                                    ThemeConstants.orangeColor),
                                            primary: ThemeConstants
                                                .whitecolor, // background
                                            onPrimary: ThemeConstants
                                                .whitecolor, // foreground
                                          ),
                                          onPressed: () {
                                            // For Android
                                            // FileDownloader.downloadFile(
                                            //         url:
                                            //             'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
                                            //         name: "sample",
                                            //         onProgress: (name, progress) {
                                            //           // setState(() {
                                            //           //   _progress = progress;
                                            //           //   _status = 'Progress: $progress%';
                                            //           // });
                                            //         },
                                            //         onDownloadCompleted: (path) {
                                            //           // setState(() {
                                            //           //   _progress = null;
                                            //           //   _status =
                                            //           //       'File downloaded to: $path';
                                            //           // });
                                            //         },
                                            //         onDownloadError: (error) {
                                            //           // setState(() {
                                            //           //   _progress = null;
                                            //           //   _status =
                                            //           //       'Download error: $error';
                                            //           // });
                                            //         })
                                            //     .then((file) {
                                            //   debugPrint('file path: ${file?.path}');
                                            // });

                                            // For IOS
                                            // String temp =
                                            //     """data:application/vnd.openxmlformats-officedocument.wordprocessingml.document;base64,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""";
                                            Get.to(CustomDownloadFile());
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
                                            text: _.applicationDetailModel
                                                .submissionDate,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: _.applicationDetailModel
                                                .offerDate,
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
                                            text: _.applicationDetailModel
                                                .offerLapseDate,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: _.applicationDetailModel
                                                .conditionalOfferDate,
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
                                            text: "Fee Payment \nDeadline",
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
                                            text: _.applicationDetailModel
                                                .feeDeadline,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: _.applicationDetailModel
                                                .courseStartDate,
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
                                                "Estimated Course Completion date",
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
                                            text: _.applicationDetailModel
                                                .completionDate,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: _.applicationDetailModel
                                                .currencyCode,
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
                                            text: "${_.applicationDetailModel.annualTutionFees ?? ""}" +
                                                " " +
                                                "${_.applicationDetailModel.currencyCode ?? ""}",
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text:
                                                " ${_.applicationDetailModel.annualTutionFeesInr ?? ""}" +
                                                    " " +
                                                    "INR",
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
                                            text:
                                                "Total Fees in ${_.applicationDetailModel.currencyCode}",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ]),
                                        TableRow(children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: _.applicationDetailModel
                                                .oSHCFees,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "${_.applicationDetailModel.totalfees ?? ""}" +
                                                "${_.applicationDetailModel.currencyCode ?? ""}",
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
                                      text:
                                          "Specify conditionals for conditional offer",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: CustomAutoSizeTextMontserrat(
                                          text: "...........")),

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
                                              color:
                                                  ThemeConstants.orangeColor),
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
                                      text: "Rejection Document",
                                      textColor: ThemeConstants.bluecolor,
                                      fontWeight: FontWeight.bold,
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
                                              color:
                                                  ThemeConstants.orangeColor),
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
                                      text: "Conditional offer Document",
                                      textColor: ThemeConstants.bluecolor,
                                      fontWeight: FontWeight.bold,
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
                                              color:
                                                  ThemeConstants.orangeColor),
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
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "Offer Acceptance Date",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ]),
                                        TableRow(children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: _.applicationDetailModel
                                                .acceptanceStage,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: _.applicationDetailModel
                                                .acceptanceDate,
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
                                            text: "Payment Option",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "Amount Paid",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ]),
                                        TableRow(children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: _.applicationDetailModel
                                                .paymentOption,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: _.applicationDetailModel
                                                .amountPaid,
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
                                            text: "Date of Payment",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "Transacted by",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ]),
                                        TableRow(children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: _.applicationDetailModel
                                                .dateOfPayment,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "_.applicationDetailModel.",
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
                                            text: "SIEC Person",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "Mode of Payment",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ]),
                                        TableRow(children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: _.applicationDetailModel
                                                .siecEmployee,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: _.applicationDetailModel
                                                .modeOfPayment,
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
                                            text: "Balance Fee",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "COE/CAS/I-20 Receipt",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ]),
                                        TableRow(children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: _.applicationDetailModel
                                                .balanceFee,
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text:
                                                "applicationDetailModel.coeRecevied",
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
                                      text: "Confirmation Received Date/Time",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: CustomAutoSizeTextMontserrat(
                                        text: _.applicationDetailModel
                                            .conditionalOfferDate,
                                        textColor: ThemeConstants.TextColor,
                                        fontSize: 14,
                                      )),
                                  const SizedBox(
                                    height: 8,
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
                                              color:
                                                  ThemeConstants.orangeColor),
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
                                      text: "CAS/I-20/COE Doc",
                                      textColor: ThemeConstants.bluecolor,
                                      fontWeight: FontWeight.bold,
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
                                              color:
                                                  ThemeConstants.orangeColor),
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
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "Defer Till",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ]),
                                        TableRow(children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: "Scholarship",
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "March 2021",
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
                                      text: "Deferment Status",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: CustomAutoSizeTextMontserrat(
                                          text: "Defer Approved")),
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
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "Withdrawal Status",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ]),
                                        TableRow(children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: "Plan Drop",
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "Request from Student",
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
                                                "Applied for other University",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "How did you apply?",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ]),
                                        TableRow(children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: "Yes",
                                            textColor: ThemeConstants.TextColor,
                                            maxLines: 2,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "Self",
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
                                            text: "Country Name",
                                            maxLines: 2,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text: "University Name",
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
                                            text:
                                                "University of the Fraser Valley",
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
                                children: [
                                  ...documentList(_.applicationDetailModel)
                                ],
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
              : const Center(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
        }));
  }

  // Function
  List<Widget> documentList(ApplicationDetailModel model) {
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
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              side:
                                  BorderSide(color: ThemeConstants.GreenColor),
                              primary: ThemeConstants.whitecolor, // background
                              onPrimary:
                                  ThemeConstants.whitecolor, // foreground
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
                              onPrimary:
                                  ThemeConstants.whitecolor, // foreground
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
                              side:
                                  BorderSide(color: ThemeConstants.orangeColor),
                              primary: ThemeConstants.whitecolor, // background
                              onPrimary:
                                  ThemeConstants.whitecolor, // foreground
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
}
