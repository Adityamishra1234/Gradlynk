import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
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

import '../../../widgets/drawerfilter.dart';
import '../../controllers/basecontroller.dart';
import '../mark_attendance/qrCodeScreen.dart';

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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
      // var res = await FlutterDownloader.enqueue(
      //   url: url,

      //   headers: {}, // optional: header send with url (auth token etc)
      //   savedDir: directory,
      //   saveInPublicStorage: true,
      //   showNotification:
      //       true, // show download progress in status bar (for Android)
      //   openFileFromNotification:
      //       true, // click on notification to open downloaded file (for Android)
      // );
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
      // DownloadTaskStatus status = data[1];
      int progress = data[2];
      // if (status == DownloadTaskStatus.complete) {
      //   print("file downloaded");
      // }
      setState(() {});
    });

    // FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  // @pragma('vm:entry-point')
  // static void downloadCallback(
  //     String id, DownloadTaskStatus status, int progress) {
  //   final SendPort? send =
  //       IsolateNameServer.lookupPortByName('downloader_send_port');
  //   send!.send([id, status, progress]);
  // }

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
    double width = MediaQuery.of(context).size.width;
    if (displayMobileLayout == true) {
      width = MediaQuery.of(context).size.width - 240;
    }
    return Scaffold(
      key: _scaffoldKey,
        appBar:  AppBar(
          elevation: 2.5,
          automaticallyImplyLeading: false,
          actions: [
            if (displayMobileLayout == true)
              IconButton(
                icon: const Icon(Icons.arrow_back,
                    color: Colors.black),
                onPressed: () => Get.back(),
              ),
            if (displayMobileLayout == false)
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child:  IconButton(
                  // icon: Image.asset("assets/images/gradlynk lense.png"),
                  icon: const Icon(Icons.arrow_back, color: Colors.black,),
                  // icon: const Icon(Icons.menu,color: Colors.black,),
                  onPressed: () {
                    // Get.find<BaseController>().profileDataValidator();
                    Get.deleteAll();
                    Get.back();

                    DrawerFilter();
                  },
                ),
              ),
            // svgImage("work", Colors.transparent, 32, 32),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Image.network(
                "https://sieceducation.in/assets/assets/images/logo.png",
                width: 130,
                height: 30,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 10),
            //   child: Row(
            //     children: [
            //     Text("Hi, ", style: GoogleFonts.abhayaLibre(textStyle: const TextStyle(
            //                         fontSize: 24,
            //                         fontWeight: FontWeight.w700,
            //                         color: Colors.black,
            //                       ),)),
            //       Text(
            //             style: GoogleFonts.abhayaLibre(textStyle: const TextStyle(
            //               fontSize: 24,
            //               fontWeight: FontWeight.w700,
            //               color: Colors.black,
            //             ),),
            //           "${firstLetterChaptial(controller.personalModal.enquiryName) ?? firstLetterChaptial(controller.model1.enquiryName)}"
            //         ),
            //     ],
            //   ),
            // ),
            const Spacer(),
            if (Get.find<BaseController>()
                .meetingZoneStatus
                .qrCodeGenerated ==
                true)
              IconButton(
                icon: svgImage(
                    "qr code", ThemeConstants.IconColor, 25, 25),
                onPressed: () {
                  showAnimatedDialog(
                      animationType: DialogTransitionType.slideFromBottomFade,
                      curve: Curves.easeInOutQuart,
                      context: context,
                      builder: (_) => QRScreen(
                          Url: Get.find<BaseController>()
                              .meetingZoneStatus
                              .qrCodeView!,
                          code: Get.find<BaseController>()
                              .meetingZoneStatus
                              .student_code!));
                },
              ),

            // IconButton(
            //   icon: SvgPicture.asset(
            //     "assets/icons/profile.svg",
            //     height: 30,
            //     color: const Color.fromARGB(255, 99, 99, 99),
            //   ),
            //   onPressed: () {
            //     Get.toNamed(ProfilePage.routeNamed);
            //   },
            // ),

            const SizedBox(
              width: 5,
            )
          ],
          // title: Text(
          //   title,
          //   style: const TextStyle(color: Colors.black),
          // ),
          backgroundColor: Colors.white,
        ),
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
                              padding: const EdgeInsets.only(left:10, top: 50),
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
                                child: ConfigurableExpansionTile(
                                  header:
                                      (isExpanded, iconTurns, heightFactor) {
                                    return SizedBox(
                                      width: width-20,
                                      height: 60,
                                      child: Row(
                                        children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: "Application Submission Details",
                                            textColor:
                                                ThemeConstants.blackcolor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          const Spacer(),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.withOpacity(0.5),
                                                    spreadRadius: -2, // Negative value to contain the shadow within the border
                                                    blurRadius: 9,
                                                    offset: const Offset(0, 5),
                                                  )
                                                ]
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Icon(
                                                  Icons.keyboard_arrow_down),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
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
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 50,
                                              child: FileDownload(
                                                  url: _.model
                                                      .acknowledgementFile),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                getViewDocument(_.model
                                                    .acknowledgementFile);
                                              },
                                              child: Container(
                                                height: 35,
                                                width: 55,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: ThemeConstants
                                                            .bluecolor),
                                                    borderRadius:
                                                        const BorderRadius
                                                            .all(
                                                            Radius.circular(
                                                                20))),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.remove_red_eye,
                                                    size: 18,
                                                    color: ThemeConstants
                                                        .bluecolor,
                                                  ),
                                                  // child: CustomAutoSizeTextMontserrat(
                                                  //   text: "View",
                                                  //   fontSize: 10,
                                                  //   fontWeight: FontWeight.w500,
                                                  //   textColor: ThemeConstants.orangeColor,
                                                  // ),
                                                ),
                                              ),
                                            ),
                                            // ElevatedButton(
                                            //   style: ElevatedButton.styleFrom(
                                            //     foregroundColor:
                                            //         ThemeConstants.whitecolor,
                                            //     side: BorderSide(
                                            //         color: ThemeConstants
                                            //             .orangeColor),
                                            //     backgroundColor: ThemeConstants
                                            //         .whitecolor, // foreground
                                            //   ),
                                            //   onPressed: () {
                                            //     getViewDocument(_
                                            //         .model.acknowledgementFile);
                                            //   },
                                            //   child:
                                            //       CustomAutoSizeTextMontserrat(
                                            //     text: "View",
                                            //     textColor:
                                            //         ThemeConstants.orangeColor,
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      )
                                    ],
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
                                  header:
                                      (isExpanded, iconTurns, heightFactor) {
                                    return SizedBox(
                                      width: width - 20,
                                      height: 60,
                                      child: Row(
                                        children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: "Offer Details",
                                            textColor:
                                                ThemeConstants.blackcolor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          const Spacer(),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.withOpacity(0.5),
                                                    spreadRadius: -2, // Negative value to contain the shadow within the border
                                                    blurRadius: 9,
                                                    offset: const Offset(0, 5),
                                                  )
                                                ]
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Icon(
                                                  Icons.keyboard_arrow_down),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  childrenBody: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        getTable(
                                            firstField:
                                                "Submission Date",
                                            secondField: "Offer Date",
                                            firstFiledName:
                                                _.model.submissionDate,
                                            secondFieldName: _.model.offerDate),
                                        const SizedBox(height: 10,),
                                        getTable(
                                            firstField: "Offer lapse Date",
                                            secondField: "Conditional offer date",
                                            firstFiledName:
                                                _.model.offerLapseDate,
                                            secondFieldName:
                                                _.model.conditionalOfferDate),
                                        const SizedBox(height: 10,),
                                        getTable(
                                            firstField: "Fee Payment \nDeadline",
                                            secondField: "Course Start date",
                                            firstFiledName: _.model.feeDeadline,
                                            secondFieldName:
                                                _.model.courseStartDate),
                                        const SizedBox(height: 10,),
                                        getTable(
                                            firstField:
                                                "Course Completion date",
                                            secondField: "Course Fees Currency",
                                            firstFiledName:
                                                _.model.completionDate,
                                            secondFieldName:
                                                _.model.currencyCode),
                                        const SizedBox(height: 10,),
                                        getTable(
                                            firstField:
                                                "Course Fees in ${_.model.currencyCode}",
                                            secondField: "Course Fees in INR",
                                            firstFiledName:
                                                _.model.annualTutionFees,
                                            secondFieldName:
                                                _.model.annualTutionFeesInr),
                                        const SizedBox(height: 10,),
                                        getTable(
                                            firstField: "OSHC Fees",
                                            secondField:
                                                "Total Fees in ${_.model.currencyCode}",
                                            firstFiledName: _.model.oSHCFees,
                                            secondFieldName: _.model.totalfees),

                                        const SizedBox(
                                          height: 10,
                                        ),
                                        getTable(
                                          firstField: "Total Fees in INR",
                                          secondField: "Reason for Rejection",
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
                                                  "Requirements", //"Specify conditionals for conditional offer"
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
                                        if (getNUllChecker(_.model.fullOfferDoc) == false)
                                          const SizedBox(height: 10,),
                                          Align(
                                            alignment:
                                                AlignmentDirectional.topStart,
                                            child: CustomAutoSizeTextMontserrat(
                                              text: "Offer Letter Document",
                                              textColor: ThemeConstants.bluecolor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        if (getNUllChecker(_.model.fullOfferDoc) == false)
                                          Row(
                                            children: [
                                              FileDownload(
                                                  url: _.model.fullOfferDoc),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  elevation: 5,
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .GreenColor),
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
                                                      ThemeConstants.GreenColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        if (getNUllChecker(
                                                _.model.reasonOfWithdraw) ==
                                            false)
                                          const SizedBox(
                                            height: 10,
                                          ),
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
                                                  elevation: 4,
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .GreenColor),
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
                                                      ThemeConstants.GreenColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        if (getNUllChecker(
                                                _.model.conditionalOfferDoc) ==
                                            false)
                                          const SizedBox(
                                            height: 10,
                                          ),
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
                                                  elevation: 4,
                                                  foregroundColor:
                                                      ThemeConstants.whitecolor,
                                                  side: BorderSide(
                                                      color: ThemeConstants
                                                          .GreenColor),
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
                                                      ThemeConstants.GreenColor,
                                                ),
                                              ),
                                            ],
                                          ),

                                        //
                                      ],
                                    ),
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
                                  header:
                                      (isExpanded, iconTurns, heightFactor) {
                                    return SizedBox(
                                      width: width - 20,
                                      height: 60,
                                      child: Row(
                                        children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: "Offer Acceptance",
                                            textColor:
                                                ThemeConstants.blackcolor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          const Spacer(),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.withOpacity(0.5),
                                                    spreadRadius: -2, // Negative value to contain the shadow within the border
                                                    blurRadius: 9,
                                                    offset: const Offset(0, 5),
                                                  )
                                                ]
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Icon(
                                                  Icons.keyboard_arrow_down),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
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
                                  header:
                                      (isExpanded, iconTurns, heightFactor) {
                                    return SizedBox(
                                      width: width - 20,
                                      height: 60,
                                      child: Row(
                                        children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: "Defer Information",
                                            textColor:
                                                ThemeConstants.blackcolor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          const Spacer(),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.withOpacity(0.5),
                                                    spreadRadius: -2, // Negative value to contain the shadow within the border
                                                    blurRadius: 9,
                                                    offset: const Offset(0, 5),
                                                  )
                                                ]
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Icon(
                                                  Icons.keyboard_arrow_down),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
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
                                  header:
                                      (isExpanded, iconTurns, heightFactor) {
                                    return SizedBox(
                                      width: width - 20,
                                      height: 60,
                                      child: Row(
                                        children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: "Withdraw Information",
                                            textColor:
                                                ThemeConstants.blackcolor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          const Spacer(),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.withOpacity(0.5),
                                                    spreadRadius: -2, // Negative value to contain the shadow within the border
                                                    blurRadius: 9,
                                                    offset: const Offset(0, 5),
                                                  )
                                                ]
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Icon(
                                                  Icons.keyboard_arrow_down),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
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
                                      const SizedBox(height: 10,),
                                      getTable(
                                        firstField: "Country Name",
                                        secondField: "University Name",
                                        firstFiledName: _.model.countryName,
                                        secondFieldName: _.model.universityname,
                                      ),
                                      const SizedBox(height: 10,),
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
                                  header:
                                      (isExpanded, iconTurns, heightFactor) {
                                    return SizedBox(
                                      width: width-10,
                                      height: 60,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomAutoSizeTextMontserrat(
                                              text: "Document",
                                              textColor:
                                                  ThemeConstants.blackcolor,
                                              fontWeight: FontWeight.bold,
                                            ),

                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8),
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey.withOpacity(0.5),
                                                      spreadRadius: -2,
                                                      blurRadius: 9,
                                                      offset: const Offset(0, 5),
                                                    )
                                                  ]
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Icon(
                                                    Icons.keyboard_arrow_down),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
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
  //create list of document
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
          list[j].entries.first.value.add(
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 8,
                  shadowColor: Colors.blue.withAlpha(500),
                  shape: RoundedRectangleBorder(
                    // side: BorderSide(
                    //     color: ThemeConstants.lightgreycolor, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAutoSizeTextMontserrat(
                          text: model.documents![i].documentName,
                          textColor: ThemeConstants.bluecolor,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(height: 25,),
                        Table(
                          children: [
                            TableRow(children: [
                              CustomAutoSizeTextMontserrat(
                                text: "Mandatory/Non-Mandatory: ",
                                fontSize: 10,
                                maxLines: 2,
                                fontWeight: FontWeight.bold,
                              ),
                              CustomAutoSizeTextMontserrat(
                                text: "Required By:",
                                fontSize: 10,
                                maxLines: 2,
                                fontWeight: FontWeight.bold,
                              ),
                            ]),
                            rowSpacer2,
                            rowSpacer2,
                            rowSpacer2,
                            TableRow(children: [
                              CustomAutoSizeTextMontserrat(
                                text: model.documents![i].mandatoryStatus,
                                textColor: ThemeConstants.TextColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                maxLines: 2,
                              ),
                              CustomAutoSizeTextMontserrat(
                                text: model.documents![i].requiredBy,
                                textColor: ThemeConstants.TextColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                maxLines: 2,
                              ),
                            ]),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomAutoSizeTextMontserrat(text: "Uploaded By:", fontSize: 8, fontWeight: FontWeight.w500,),
                        CustomAutoSizeTextMontserrat(
                          text: model.documents![i].uploadedBy,
                          textColor: ThemeConstants.TextColor,
                        ),
                        if (model.documents![i].viewLink != "test")
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                //Upload
                                if (getNUllChecker(
                                        model.documents![i].viewLink) ==
                                    true)
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 4,
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
                                if (getNUllChecker(
                                        model.documents![i].viewLink) ==
                                    true)
                                  const SizedBox(
                                    width: 20,
                                  ),
                                //Download
                                if (getNUllChecker(
                                        model.documents![i].viewLink) ==
                                    false)
                                  SizedBox(
                                    width: 50,
                                    child: FileDownload(
                                        url: model.documents![i].viewLink),
                                  ),

                                if (getNUllChecker(
                                        model.documents![i].viewLink) ==
                                    false)
                                  const SizedBox(
                                    width: 20,
                                  ),
                                //View
                                if (getNUllChecker(
                                        model.documents![i].viewLink) ==
                                    false)
                                  InkWell(
                                    onTap: () {
                                      getViewDocument(
                                          model.documents![i].viewLink);
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 65,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 1,
                                              blurRadius: 5,
                                              offset: const Offset(0, 4.5),
                                            )
                                          ],
                                          // border: Border.all(
                                          //     color: ThemeConstants.bluecolor),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Center(
                                        child: Icon(
                                          Icons.remove_red_eye,
                                          size: 18,
                                          color: ThemeConstants.bluecolor,
                                        ),
                                        // child: CustomAutoSizeTextMontserrat(
                                        //   text: "View",
                                        //   fontSize: 10,
                                        //   fontWeight: FontWeight.w500,
                                        //   textColor: ThemeConstants.orangeColor,
                                        // ),
                                      ),
                                    ),
                                  ),
                                // ElevatedButton(
                                //   style: ElevatedButton.styleFrom(
                                //     foregroundColor: ThemeConstants.whitecolor,
                                //     side: BorderSide(
                                //         color: ThemeConstants.orangeColor),
                                //     backgroundColor:
                                //         ThemeConstants.whitecolor, // foreground
                                //   ),
                                //   onPressed: () {
                                //     getViewDocument(model.documents![i].viewLink);
                                //   },
                                //   child: CustomAutoSizeTextMontserrat(
                                //     text: "View",
                                //     textColor: ThemeConstants.orangeColor,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        if (model.documents![i].viewLink == "test")
                          const Center(child: CircularProgressIndicator())
                      ],
                    ),
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
            textColor: ThemeConstants.bluecolor.withOpacity(0.8),
            fontSize: 16,
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
    String extension = url.split('.').last;
    print(extension);
    if (extension == "pdf") {
      return Get.to(CustomDocumentViewer(
        url: url,
      ));
    } else if (extension == "doc") {
      Get.to(CustomDocumentViewer(
        url: url,
      ));
    } else if (extension == "docx") {
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
