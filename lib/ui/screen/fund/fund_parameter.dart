import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/fund/controller/fundrequirementcontroller.dart';
import 'package:studentpanel/ui/screen/fund/model/dataneedfundcalculator.dart';
import 'package:studentpanel/ui/screen/fund/plan_fund.dart';
import 'package:studentpanel/utils/conditionals/iconStringFromField.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/custombutton.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

import '../../controllers/basecontroller.dart';
import '../mark_attendance/qrCodeScreen.dart';
import 'fund_requiremen.dart';

class FundParameter extends StatelessWidget {
  FundParameter({
    Key? key,
  }) : super(key: key);

  var controller = Get.put(FundRequirementController());
  static const routeNamed = '/FundParameter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(
          elevation: 2.5,
          automaticallyImplyLeading: false,
          actions: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child:  IconButton(
                  // icon: Image.asset("assets/images/gradlynk lense.png"),
                  icon: const Icon(Icons.arrow_back, color: Colors.black,),
                  // icon: const Icon(Icons.menu,color: Colors.black,),
                  onPressed: () {
                    // Get.find<BaseController>().profileDataValidator();
                  Get.back();
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
        drawer: CustomDrawer(),
        body: controller.obx(
          onLoading: getLoading(context),
          (state) => SafeArea(
            child: Container(
              padding: const EdgeInsets.all(0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 15),
                      child: Row(
                        children: [
                          CustomAutoSizeTextMontserrat(
                            text: "Fund Parameter",
                            textColor: ThemeConstants.bluecolor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          const Spacer(),
                          ElevatedButton(
                            //use long press to show a pop up for anything, in the future updates
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              elevation: 2,
                              backgroundColor: ThemeConstants.bluecolor
                            ),
                              onPressed: () {
                                Get.to(Fundrequirement());
                                },
                              child: CustomAutoSizeTextMontserrat(text: "Edit", textalingCentre: true, textColor: Colors.white,),

                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                    ...getlist(controller.dataNeedFundCalulator)
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  getlist(DataNeedFundCalulator model) {
    List<Widget> data = [];

    for (var i = 0; i < model.tableData!.length; i++) {
      data.add(FundparameterSubWidget(
        iconColor:
            i % 2 == 0 ? ThemeConstants.bluecolor : ThemeConstants.yellow,
        oddEven: i % 2 == 0,
        title: model.tableData![i].nameOfFiled,
        individual_Expenses: model.tableData![i].expenses,
        partcipants: model.tableData![i].participants,
        total_Expenses: model.tableData![i].total,
        total_Expenses_ind: model.tableData![i].total,
        iconPath:
            getIconStringForFundParameter(model.tableData![i].nameOfFiled!),
      ));
    }

    return data;
  }
}

class FundparameterSubWidget extends StatelessWidget {
  String? title;
  String? individual_Expenses;
  String? partcipants;
  String? total_Expenses;
  String? iconPath;
  bool? oddEven;
  Color? iconColor;

  String? total_Expenses_ind;

  FundparameterSubWidget(
      {Key? key,
      this.iconColor,
      this.oddEven,
      this.iconPath,
      required this.title,
      this.individual_Expenses,
      this.partcipants,
      this.total_Expenses,
      this.total_Expenses_ind})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding:
                  const EdgeInsets.only(left: 20, right: 10, top: 30, bottom: 20),
              margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
              decoration: BoxDecoration(
                  boxShadow: [
                    const BoxShadow(
                        blurRadius: 2,
                        spreadRadius: 0.1,
                        color: Color.fromARGB(97, 0, 0, 0))
                  ],
                  color: ThemeConstants.whitecolor,

                  // color: ThemeConstants.lightblueColor,
                  border: Border.all(
                      color: oddEven == true
                          ? ThemeConstants.bluecolor
                          : ThemeConstants.yellow),
                  borderRadius: const BorderRadius.all(Radius.circular(15.0))),
              child: Column(
                children: [
                  FundParameterWidget(
                    text1: "Individual Expenses(AUD)",
                    text2: individual_Expenses ?? "",
                  ),
                  FundParameterWidget(
                    text1: "Partcipants",
                    text2: partcipants ?? "",
                  ),
                  FundParameterWidget(
                    text1: "Total Expenses(AUD)",
                    text2: total_Expenses ?? "",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 15, top: 15, bottom: 10),
                    child: DottedLine(
                      dashColor: ThemeConstants.blackcolor,
                      lineThickness: 0.5,
                      dashLength: 10,
                      dashGapLength: 5,
                    ),
                  ),
                  FundParameterWidget(
                    fw: FontWeight.w700,
                    text1: "Total Expenses(INR)",
                    text2: total_Expenses_ind ?? "",
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              // top: -20,
              left: 30,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  children: [
                    svgImage("$iconPath", iconColor!, 20, 20),
                    // SvgPicture.asset(
                    //   '$iconPath',
                    //   width: 30,
                    // ),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomAutoSizeTextMontserrat(
                      fontSize: 14,
                      text: title,
                      textColor: ThemeConstants.blackcolor,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                height: 35,
                decoration: BoxDecoration(
                    color: oddEven == true
                        ? ThemeConstants.lightblueColor
                        : ThemeConstants.lightYellow,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        width: 1,
                        color: oddEven == true
                            ? ThemeConstants.bluecolor
                            : ThemeConstants.yellow)),
              )),
        ],
      ),
    );
  }
}

class FundParameterWidget extends StatelessWidget {
  String text1;
  String text2;
  FontWeight? fw;

  FundParameterWidget(
      {Key? key, this.fw, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Table(
            children: [
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: text1,
                  maxLines: 2,
                  fontSize: 10,
                  fontWeight: fw ?? FontWeight.w500,
                  textColor: ThemeConstants.blackcolor,
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomAutoSizeTextMontserrat(
                  text: text2,
                  fontWeight: fw ?? FontWeight.w500,
                  maxLines: 2,
                  fontSize: 10,
                  textColor: ThemeConstants.TextColor,
                ),
              ]),
            ],
          ),
        ),
      );
    }
  }
}
