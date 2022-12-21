import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/applicationsummarycontroller.dart';
import 'package:studentpanel/ui/models/applicationdetailmodel.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

class ApplicationCompleteDetails extends StatelessWidget {
  // ApplicationDetailModel applicationDetailModel = ApplicationDetailModel();
  ApplicationCompleteDetails({Key? key}) : super(key: key);
  static const routeNamed = '/ApplicationCompleteDetails';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("title"),
        drawer: CustomDrawer(),
        body: GetBuilder<ApplicationSummaryController>(builder: (_) {
          return _.loadingApplicationCompleteDetails.value == true
              ? ListView(
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
                                    text: _.applicationDetailModel.offerStatus,
                                    textColor: ThemeConstants.TextColor,
                                    maxLines: 2,
                                  ),
                                  CustomAutoSizeTextMontserrat(
                                    text: _.applicationDetailModel
                                        .acknowledgementNumber,
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
                                  side: BorderSide(
                                      color: ThemeConstants.GreenColor),
                                  primary:
                                      ThemeConstants.whitecolor, // background
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
                                  side: BorderSide(
                                      color: ThemeConstants.bluecolor),
                                  primary:
                                      ThemeConstants.whitecolor, // background
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
                                  side: BorderSide(
                                      color: ThemeConstants.orangeColor),
                                  primary:
                                      ThemeConstants.whitecolor, // background
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
                                  text: "Offer Details",
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
                                    text:
                                        _.applicationDetailModel.submissionDate,
                                    textColor: ThemeConstants.TextColor,
                                    maxLines: 2,
                                  ),
                                  CustomAutoSizeTextMontserrat(
                                    text: _.applicationDetailModel.offerDate,
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
                                    text:
                                        _.applicationDetailModel.offerLapseDate,
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
                                    text: _.applicationDetailModel.feeDeadline,
                                    textColor: ThemeConstants.TextColor,
                                    maxLines: 2,
                                  ),
                                  CustomAutoSizeTextMontserrat(
                                    text: _
                                        .applicationDetailModel.courseStartDate,
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
                                    text:
                                        _.applicationDetailModel.completionDate,
                                    textColor: ThemeConstants.TextColor,
                                    maxLines: 2,
                                  ),
                                  CustomAutoSizeTextMontserrat(
                                    text: _.applicationDetailModel.currencyCode,
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
                                    text: _.applicationDetailModel.oSHCFees,
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
                                  primary:
                                      ThemeConstants.whitecolor, // background
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
                                  side: BorderSide(
                                      color: ThemeConstants.bluecolor),
                                  primary:
                                      ThemeConstants.whitecolor, // background
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
                                  side: BorderSide(
                                      color: ThemeConstants.orangeColor),
                                  primary:
                                      ThemeConstants.whitecolor, // background
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
                                  primary:
                                      ThemeConstants.whitecolor, // background
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
                                  side: BorderSide(
                                      color: ThemeConstants.bluecolor),
                                  primary:
                                      ThemeConstants.whitecolor, // background
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
                                  side: BorderSide(
                                      color: ThemeConstants.orangeColor),
                                  primary:
                                      ThemeConstants.whitecolor, // background
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
                                  primary:
                                      ThemeConstants.whitecolor, // background
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
                                  side: BorderSide(
                                      color: ThemeConstants.bluecolor),
                                  primary:
                                      ThemeConstants.whitecolor, // background
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
                                  side: BorderSide(
                                      color: ThemeConstants.orangeColor),
                                  primary:
                                      ThemeConstants.whitecolor, // background
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
                          ),

                          //
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
                                  text: "Offer Acceptance",
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
                                    text: _
                                        .applicationDetailModel.acceptanceStage,
                                    textColor: ThemeConstants.TextColor,
                                    maxLines: 2,
                                  ),
                                  CustomAutoSizeTextMontserrat(
                                    text:
                                        _.applicationDetailModel.acceptanceDate,
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
                                    text:
                                        _.applicationDetailModel.paymentOption,
                                    textColor: ThemeConstants.TextColor,
                                    maxLines: 2,
                                  ),
                                  CustomAutoSizeTextMontserrat(
                                    text: _.applicationDetailModel.amountPaid,
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
                                    text:
                                        _.applicationDetailModel.dateOfPayment,
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
                                    text: _.applicationDetailModel.siecEmployee,
                                    textColor: ThemeConstants.TextColor,
                                    maxLines: 2,
                                  ),
                                  CustomAutoSizeTextMontserrat(
                                    text:
                                        _.applicationDetailModel.modeOfPayment,
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
                                    text: _.applicationDetailModel.balanceFee,
                                    textColor: ThemeConstants.TextColor,
                                    maxLines: 2,
                                  ),
                                  CustomAutoSizeTextMontserrat(
                                    text: "applicationDetailModel.coeRecevied",
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
                                  primary:
                                      ThemeConstants.whitecolor, // background
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
                                  side: BorderSide(
                                      color: ThemeConstants.bluecolor),
                                  primary:
                                      ThemeConstants.whitecolor, // background
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
                                  side: BorderSide(
                                      color: ThemeConstants.orangeColor),
                                  primary:
                                      ThemeConstants.whitecolor, // background
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
                                  primary:
                                      ThemeConstants.whitecolor, // background
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
                                  side: BorderSide(
                                      color: ThemeConstants.bluecolor),
                                  primary:
                                      ThemeConstants.whitecolor, // background
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
                                  side: BorderSide(
                                      color: ThemeConstants.orangeColor),
                                  primary:
                                      ThemeConstants.whitecolor, // background
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
                                  text: "Defer Information",
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
                                  text: "Withdraw Information",
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
                                    text: "Applied for other University",
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
                                    text: "University of the Fraser Valley",
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
                    const SizedBox(
                      height: 10,
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
}
