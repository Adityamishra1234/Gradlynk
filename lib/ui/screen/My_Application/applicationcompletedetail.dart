import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:studentpanel/ui/controllers/applicationcompletedetails.dart';
import 'package:studentpanel/ui/models/applicationdetailmodel.dart';
import 'package:studentpanel/ui/screen/test/takepicturescreen.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/constantsWithId.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/custom_doc_viewer.dart';
import 'package:studentpanel/widgets/custom_image_viewer.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:studentpanel/widgets/file_download.dart';

class ApplicationCompleteDetails extends StatefulWidget {
  static const routeNamed = '/ApplicationCompleteDetails';
  const ApplicationCompleteDetails({
    super.key,
  });

  @override
  State<ApplicationCompleteDetails> createState() =>
      _ApplicationCompleteDetailsState();
}

class _ApplicationCompleteDetailsState
    extends State<ApplicationCompleteDetails> {
  final Dio dio = Dio();
  bool loading = false;
  double progress = 0;
  bool downloadloading = false;

  final rowSpacer2 = const TableRow(children: [
    SizedBox(
      height: 3,
    ),
    SizedBox(
      height: 3,
    )
  ]);

  var controller = Get.put(ApplicationCompleteDetailsController());

  Future download(String url) async {
    var status = await Permission.storage.request();
    if (await Permission.storage.request().isGranted) {
      final Directory tempDir = await getTemporaryDirectory();

      final Directory appDocumentsDir =
          await getApplicationDocumentsDirectory();

      bool dirDownloadExists = true;
      String directory;
      if (Platform.isIOS) {
        directory = (await getApplicationDocumentsDirectory()).path;
      } else {
        directory = "/storage/emulated/0/Download/";

        dirDownloadExists = await Directory(directory).exists();
        if (dirDownloadExists) {
          directory = "/storage/emulated/0/Download/";
        } else {
          directory = "/storage/emulated/0/Downloads/";
        }
      }
      var res = await FlutterDownloader.enqueue(
        url: url,

        headers: {}, // optional: header send with url (auth token etc)
        savedDir: directory,
        saveInPublicStorage: true,
        showNotification:
            true, // show download progress in status bar (for Android)
        openFileFromNotification:
            true, // click on notification to open downloaded file (for Android)
      );
    }
  }

  final ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();

    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      if (status == DownloadTaskStatus.complete) {
        print("file downloaded");
      }
      setState(() {});
    });

    FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
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
                index: 2,
              )
            : null,
        body: GetBuilder<ApplicationCompleteDetailsController>(builder: (_) {
          _.model.documents = _.model.documents ?? [];
          return _.loadingApplicationCompleteDetails.value == true
              ? Row(
                  children: [
                    if (displayMobileLayout == true)
                      CustomDrawer(
                        index: 2,
                      ),
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
                            if (_.model.stageID == 47 ||
                                _.model.stageID == 48 ||
                                _.model.stageID == 49 ||
                                _.model.stageID == 50 ||
                                _.model.stageID == 98 ||
                                _.model.stageID == 99)
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
                                            textColor:
                                                ThemeConstants.blackcolor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          const Spacer(),
                                          const Icon(Icons.keyboard_arrow_down),
                                        ],
                                      ),
                                    ),
                                    childrenBody: Column(
                                      children: [
                                        getTable(
                                            firstField: "Offer Status",
                                            secondField:
                                                "Acknowledgement Number",
                                            firstFiledName:
                                                ConstantsWithId.getOfferStatus(_
                                                    .model.offerStatus
                                                    .toString()),
                                            secondFieldName:
                                                _.model.acknowledgementNumber),
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "Acknowledgement Doc",
                                            textColor: ThemeConstants.bluecolor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            FileDownload(
                                                url: _
                                                    .model.acknowledgementFile),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor:
                                                    ThemeConstants.whitecolor,
                                                side: BorderSide(
                                                    color: ThemeConstants
                                                        .orangeColor),
                                                backgroundColor: ThemeConstants
                                                    .whitecolor, // foreground
                                              ),
                                              onPressed: () {
                                                getViewDocument(_
                                                    .model.acknowledgementFile);
                                              },
                                              child:
                                                  CustomAutoSizeTextMontserrat(
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
                              ),
                            if (_.model.stageID == 47 ||
                                _.model.stageID == 48 ||
                                _.model.stageID == 49 ||
                                _.model.stageID == 50 ||
                                _.model.stageID == 98 ||
                                _.model.stageID == 99)
                              Divider(
                                color: ThemeConstants.TextColor,
                              ),
                            //Offer Details
                            if (_.model.stageID == 48 ||
                                _.model.stageID == 49 ||
                                _.model.stageID == 50)
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
                                  childrenBody: Column(
                                    children: [
                                      getTable(
                                          firstField:
                                              "Application Submission Date",
                                          secondField: "Offer Date",
                                          firstFiledName:
                                              _.model.submissionDate,
                                          secondFieldName: _.model.offerDate),
                                      getTable(
                                          firstField: "Offer lapse Date",
                                          secondField: "Conditional offer date",
                                          firstFiledName:
                                              _.model.offerLapseDate,
                                          secondFieldName:
                                              _.model.conditionalOfferDate),
                                      getTable(
                                          firstField: "Fee Payment \nDeadline",
                                          secondField: "Course Start date",
                                          firstFiledName: _.model.feeDeadline,
                                          secondFieldName:
                                              _.model.courseStartDate),
                                      getTable(
                                          firstField:
                                              "Estimated Course Completion date",
                                          secondField: "Course Fees Currency",
                                          firstFiledName:
                                              _.model.completionDate,
                                          secondFieldName:
                                              _.model.currencyCode),
                                      getTable(
                                          firstField:
                                              "Course Fees in ${_.model.currencyCode}",
                                          secondField: "Course Fees in INR",
                                          firstFiledName:
                                              _.model.annualTutionFees,
                                          secondFieldName:
                                              _.model.annualTutionFeesInr),
                                      getTable(
                                          firstField: "OSHC Fees",
                                          secondField:
                                              "Total Fees in ${_.model.currencyCode}",
                                          firstFiledName: _.model.oSHCFees,
                                          secondFieldName: _.model.totalfees),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      getTable(
                                        firstField: "Total Fees in INR",
                                        secondField: "Reason of Rejected",
                                        firstFiledName: _.model.totalfeesInr,
                                        secondFieldName:
                                            _.model.offerRejectReason,
                                      ),

                                      if (getNUllChecker(_.model
                                              .SpecifyConditionsForConditionalOffer) ==
                                          false)
                                        const SizedBox(
                                          height: 5,
                                        ),
                                      if (getNUllChecker(_.model
                                              .SpecifyConditionsForConditionalOffer) ==
                                          false)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: CustomAutoSizeTextMontserrat(
                                            text:
                                                "Specify conditionals for conditional offer",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      if (getNUllChecker(_.model
                                              .SpecifyConditionsForConditionalOffer) ==
                                          false)
                                        Align(
                                            alignment:
                                                AlignmentDirectional.topStart,
                                            child: CustomAutoSizeTextMontserrat(
                                              text: _.model
                                                  .SpecifyConditionsForConditionalOffer,
                                              textColor:
                                                  ThemeConstants.TextColor,
                                              fontSize: 12,
                                            )),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      if (getNUllChecker(
                                              _.model.fullOfferDoc) ==
                                          false)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "FUll Offer Letter Documnet",
                                            textColor: ThemeConstants.bluecolor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      if (getNUllChecker(
                                              _.model.fullOfferDoc) ==
                                          false)
                                        Row(
                                          children: [
                                            FileDownload(
                                                url: _.model.fullOfferDoc),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor:
                                                    ThemeConstants.whitecolor,
                                                side: BorderSide(
                                                    color: ThemeConstants
                                                        .orangeColor),
                                                backgroundColor: ThemeConstants
                                                    .whitecolor, // foreground
                                              ),
                                              onPressed: () {
                                                getViewDocument(
                                                    _.model.fullOfferDoc);
                                              },
                                              child:
                                                  CustomAutoSizeTextMontserrat(
                                                text: "View",
                                                textColor:
                                                    ThemeConstants.orangeColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (getNUllChecker(
                                              _.model.reasonOfWithdraw) ==
                                          false)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "Rejection Document",
                                            textColor: ThemeConstants.bluecolor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      if (getNUllChecker(
                                              _.model.reasonOfWithdraw) ==
                                          false)
                                        Row(
                                          children: [
                                            FileDownload(
                                                url: _.model.rejectionDoc),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor:
                                                    ThemeConstants.whitecolor,
                                                side: BorderSide(
                                                    color: ThemeConstants
                                                        .orangeColor),
                                                backgroundColor: ThemeConstants
                                                    .whitecolor, // foreground
                                              ),
                                              onPressed: () {
                                                getViewDocument(
                                                    _.model.rejectionDoc);
                                              },
                                              child:
                                                  CustomAutoSizeTextMontserrat(
                                                text: "View",
                                                textColor:
                                                    ThemeConstants.orangeColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (getNUllChecker(
                                              _.model.conditionalOfferDoc) ==
                                          false)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "Conditional offer Document",
                                            textColor: ThemeConstants.bluecolor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      if (getNUllChecker(
                                              _.model.conditionalOfferDoc) ==
                                          false)
                                        Row(
                                          children: [
                                            FileDownload(
                                                url: _
                                                    .model.conditionalOfferDoc),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor:
                                                    ThemeConstants.whitecolor,
                                                side: BorderSide(
                                                    color: ThemeConstants
                                                        .orangeColor),
                                                backgroundColor: ThemeConstants
                                                    .whitecolor, // foreground
                                              ),
                                              onPressed: () {
                                                getViewDocument(_
                                                    .model.conditionalOfferDoc);
                                              },
                                              child:
                                                  CustomAutoSizeTextMontserrat(
                                                text: "View",
                                                textColor:
                                                    ThemeConstants.orangeColor,
                                              ),
                                            ),
                                          ],
                                        ),

                                      //
                                    ],
                                  ),
                                ),
                              ),
                            if (_.model.stageID == 48 ||
                                _.model.stageID == 49 ||
                                _.model.stageID == 50)
                              Divider(
                                color: ThemeConstants.TextColor,
                              ),
                            if (_.model.stageID == 48)
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
                                  childrenBody: Column(
                                    children: [
                                      getTable(
                                        firstField: "Offer Acceptance status",
                                        secondField: "Offer Acceptance Date",
                                        //TODO
                                        // firstFiledName: _.model.acceptanceStage,
                                        firstFiledName: "",
                                        secondFieldName: _.model.acceptanceDate,
                                      ),
                                      getTable(
                                        firstField: "Payment Option",
                                        secondField: "Amount Paid",
                                        firstFiledName:
                                            ConstantsWithId.getPaymentOption(_
                                                .model.paymentOption
                                                .toString()),
                                        secondFieldName:
                                            _.model.amountPaid.toString(),
                                      ),
                                      getTable(
                                        firstField: "Date of Payment",
                                        secondField: "Transacted by",
                                        firstFiledName: _.model.dateOfPayment,
                                        secondFieldName: _.model.transactedBy,
                                      ),
                                      getTable(
                                        firstField: "SIEC Person",
                                        secondField: "Mode of Payment",
                                        firstFiledName: _.model.siecEmployee,
                                        secondFieldName:
                                            ConstantsWithId.getPaymentMode(_
                                                .model.modeOfPayment
                                                .toString()),
                                      ),
                                      getTable(
                                        firstField: "Balance Fee",
                                        secondField: "COE/CAS/I-20 Receipt",
                                        firstFiledName: _.model.balanceFee,
                                        secondFieldName:
                                            _.model.coeCasI20Recipt,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      if (getNUllChecker(
                                              _.model.conditionalOfferDate) ==
                                          false)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: CustomAutoSizeTextMontserrat(
                                            text:
                                                "Confirmation Received Date/Time",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      if (getNUllChecker(
                                              _.model.conditionalOfferDate) ==
                                          false)
                                        Align(
                                            alignment:
                                                AlignmentDirectional.topStart,
                                            child: CustomAutoSizeTextMontserrat(
                                              text:
                                                  _.model.conditionalOfferDate,
                                              textColor:
                                                  ThemeConstants.TextColor,
                                              fontSize: 12,
                                            )),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      if (getNUllChecker(
                                              _.model.paymentReceipt) ==
                                          false)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "Payment Receipt Doc",
                                            textColor: ThemeConstants.bluecolor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      if (getNUllChecker(
                                              _.model.paymentReceipt) ==
                                          false)
                                        Row(
                                          children: [
                                            FileDownload(
                                                url: _.model.paymentReceipt),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor:
                                                    ThemeConstants.whitecolor,
                                                side: BorderSide(
                                                    color: ThemeConstants
                                                        .orangeColor),
                                                backgroundColor: ThemeConstants
                                                    .whitecolor, // foreground
                                              ),
                                              onPressed: () {
                                                getViewDocument(
                                                    _.model.paymentReceipt);
                                              },
                                              child:
                                                  CustomAutoSizeTextMontserrat(
                                                text: "View",
                                                textColor:
                                                    ThemeConstants.orangeColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (getNUllChecker(
                                              _.model.cas_i_20_coe_doc) ==
                                          false)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "CAS/I-20/COE Doc",
                                            textColor: ThemeConstants.bluecolor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      if (getNUllChecker(
                                              _.model.cas_i_20_coe_doc) ==
                                          false)
                                        Row(
                                          children: [
                                            FileDownload(
                                                url: _.model.cas_i_20_coe_doc),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor:
                                                    ThemeConstants.whitecolor,
                                                side: BorderSide(
                                                    color: ThemeConstants
                                                        .orangeColor),
                                                backgroundColor: ThemeConstants
                                                    .whitecolor, // foreground
                                              ),
                                              onPressed: () {
                                                getViewDocument(
                                                    _.model.cas_i_20_coe_doc);
                                              },
                                              child:
                                                  CustomAutoSizeTextMontserrat(
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
                            if (_.model.stageID == 48)
                              Divider(
                                color: ThemeConstants.TextColor,
                              ),
                            if (_.model.stageID == 49 || _.model.stageID == 99)
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
                                  childrenBody: Column(
                                    children: [
                                      getTable(
                                        firstField: "Reason for Defer",
                                        secondField: "Defer Till",
                                        firstFiledName: _.model.deferReason,
                                        secondFieldName: _.model.deferTill,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      if (getNUllChecker(
                                              _.model.defermentStatus) ==
                                          false)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "Deferment Status",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      if (getNUllChecker(
                                              _.model.defermentStatus) ==
                                          false)
                                        Align(
                                            alignment:
                                                AlignmentDirectional.topStart,
                                            child: CustomAutoSizeTextMontserrat(
                                              text: _.model.defermentStatus,
                                              textColor:
                                                  ThemeConstants.TextColor,
                                              fontSize: 12,
                                            )),
                                    ],
                                  ),
                                ),
                              ),
                            if (_.model.stageID == 49 || _.model.stageID == 99)
                              Divider(
                                color: ThemeConstants.TextColor,
                              ),
                            if (_.model.stageID == 98 || _.model.stageID == 50)
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
                                  childrenBody: Column(
                                    children: [
                                      getTable(
                                        firstField: "Reason for Withdraw",
                                        secondField: "Withdrawal Status",
                                        firstFiledName:
                                            _.model.reasonOfWithdraw,
                                        secondFieldName: _.model.withdrawStatus,
                                      ),
                                      getTable(
                                        firstField:
                                            "Applied for other University",
                                        //TODO
                                        secondField: "How did you apply?",
                                        firstFiledName: _
                                            .model.applied_for_other_university,
                                        secondFieldName: "",
                                      ),
                                      getTable(
                                        firstField: "Country Name",
                                        secondField: "University Name",
                                        firstFiledName: _.model.countryName,
                                        secondFieldName: _.model.universityname,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (_.model.stageID == 98 || _.model.stageID == 50)
                              Divider(
                                color: ThemeConstants.TextColor,
                              ),
                            if (_.model.documents!.isNotEmpty)
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
                                  childrenBody: Column(
                                    children: [
                                      ...documentList(_.model, context)
                                    ],
                                  ),
                                ),
                              ),
                            if (_.model.documents!.isNotEmpty)
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
  //create list of documetn
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
                      if (model.documents![i].viewLink != "test")
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
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
                                  controller.model.documents![i].viewLink =
                                      "test";
                                  getSourceSelected(
                                      callbackSelectedSource1,
                                      model.documents![i].id.toString(),
                                      i,
                                      Get.arguments);
                                  controller.update();
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
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: FileDownload(
                                      url: model.documents![i].viewLink)),

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
                                  getViewDocument(model.documents![i].viewLink);
                                },
                                child: CustomAutoSizeTextMontserrat(
                                  text: "View",
                                  textColor: ThemeConstants.orangeColor,
                                ),
                              ),
                          ],
                        ),
                      if (model.documents![i].viewLink == "test")
                        const Center(child: CircularProgressIndicator())
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

  //Funcation

  Future<bool> saveVideo(String url, String fileName) async {
    Directory directory;
    try {
      if (Platform.isAndroid) {
        download(url);
        // if (await _requestPermission(Permission.storage)) {
        //   directory = (await getExternalStorageDirectory())!;
        //   String newPath = "";
        //   List<String> paths = directory.path.split("/");
        //   for (int x = 1; x < paths.length; x++) {
        //     String folder = paths[x];
        //     if (folder != "Android") {
        //       newPath += "/$folder";
        //     } else {
        //       break;
        //     }
        //   }
        //   newPath = "$newPath/SIEC";
        //   directory = Directory(newPath);
        // } else {
        //   return false;
        // }
      } else {
        if (await _requestPermission(Permission.storage)) {
          directory = await getApplicationDocumentsDirectory();
          File saveFile = File("${directory.path}/$fileName");
          if (!await directory.exists()) {
            await directory.create(recursive: true);
          }
          if (await directory.exists()) {
            await dio.download(url, saveFile.path,
                onReceiveProgress: (value1, value2) {
              setState(() {
                progress = value1 / value2;
                print(progress);
              });
            });
            if (Platform.isIOS) {
              shareFile(saveFile.path);
            }
            return true;
          }
        } else {
          return false;
        }
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
      // if (Platform.isAndroid) {
      //   Get.snackbar("File download", "complete download",
      //       snackPosition: SnackPosition.BOTTOM);
      // }
    } else {
      print("Problem Downloading File");
    }
    setState(() {
      loading = false;
    });
  }

  Future<void> shareFile(String filepath) async {
    await FlutterShare.shareFile(
      title: filepath,
      filePath: filepath,
    );
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
        await Get.find<ApplicationCompleteDetailsController>()
            .uploadDocument(temp[1], int.parse(temp[2]));
        // await controller.uploadDocument();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  getViewDocument(String url) {
    print(url);
    if (url.contains("pdf")) {
      return Get.to(CustomDocumentViewer(
        url: url,
      ));
    } else if (url.contains("doc")) {
      Get.to(CustomDocumentViewer(
        url: url,
      ));
    } else if (url.contains("docx")) {
      Get.to(CustomDocumentViewer(
        url: url,
      ));
    } else {
      Get.to(CustomImageViewer(
        url: url,
      ));
    }
  }
}
