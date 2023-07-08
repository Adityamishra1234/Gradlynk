import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/screen/fund/check_fund_status.dart';
import 'package:studentpanel/ui/screen/fund/controller/fundPlanner.dart';
import 'package:studentpanel/ui/screen/fund/sponsorDetails.dart';
import 'package:studentpanel/ui/screen/fund/takepicturescreen.dart';
import 'package:studentpanel/ui/screen/test/takepicturescreen.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/Custom%20Dropdown/custom_dropdown.dart';
import 'package:studentpanel/widgets/Custom_icons_text/custom_icon_text_together.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/button/enableButton.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';
import 'package:studentpanel/widgets/customtextfield.dart';
import 'package:studentpanel/widgets/uploadDocument.dart';

class FundPlan extends StatelessWidget {
  FundPlan({super.key});

  static const routenamed = '/FundPlan';

  var controller = Get.put(FundPlannerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('title'),
      drawer: CustomDrawer(
        index: 7,
      ),
      body: controller.obx(
          onLoading: getLoading(context),
          (state) => SafeArea(
                child: controller.firstTime == true
                    ? InkWell(
                        onTap: () {
                          controller.firstTime = false;
                          controller.update();
                        },
                        child: Center(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.7,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 50),
                                child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height: 320,
                                  child: Column(
                                    children: [
                                      Image.asset("assets/images/empty.png"),
                                      CustomAutoSizeTextMontserrat(
                                          text: "No Sponsor Added"),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: CustomIconTextTogether(
                                            verticalPadding: 10,
                                            horizontelPadding: 10,
                                            showICOn: true,
                                            fontWeight: FontWeight.normal,
                                            textSize: 18,
                                            Bgcolor: ThemeConstants.bluecolor,
                                            iconData: Icon(Icons.add,
                                                color:
                                                    ThemeConstants.whitecolor),
                                            color: ThemeConstants.whitecolor,
                                            text: "Add a sponsor"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: CustomAutoSizeTextMontserrat(
                                    text: "Plan your Funds",
                                    textColor: ThemeConstants.bluecolor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  CustomAutoSizeTextMontserrat(
                                      text: "Sponsor Details",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      controller.getFundPlannerData();
                                    },
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "View Details",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      textColor: ThemeConstants.bluecolor,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: CustomAutoSizeTextMontserrat(
                                    text: "Relationship with Applicant",
                                    mandatory: true,
                                    fontSize: 14,
                                    textColor: ThemeConstants.blackcolor,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 30,
                                width: MediaQuery.sizeOf(context).width - 20,
                                child: customDropDownPlanFund(
                                  model: controller.relationShip,
                                  callback: (value) {
                                    controller.selectedRelationship =
                                        controller.relationShip[value];
                                    controller.update();
                                  },
                                  selectedValue:
                                      controller.selectedRelationship,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: CustomAutoSizeTextMontserrat(
                                      fontSize: 14,
                                      textColor: ThemeConstants.blackcolor,
                                      fontWeight: FontWeight.w400,
                                      mandatory: true,
                                      text: "Name of the Sponsor")),
                              const SizedBox(height: 10),
                              CustomTextField(
                                  hint: "",
                                  controller: controller.nameOfThePerson),
                              const SizedBox(
                                height: 15,
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: CustomAutoSizeTextMontserrat(
                                      fontSize: 14,
                                      textColor: ThemeConstants.blackcolor,
                                      fontWeight: FontWeight.w400,
                                      mandatory: true,
                                      text: "Occupation of Sponsor")),
                              const SizedBox(height: 5),
                              CustomDropDownSingle(
                                choosefieldtype: false,
                                bgColor: ThemeConstants.ultraLightgreyColor2,
                                model: controller.occupationName,
                                initialSelectedValue:
                                    controller.occupationNameSelect,
                                callbackFunction: (value) {
                                  print(value);
                                  for (var i = 0;
                                      i < controller.occupationName.length;
                                      i++) {
                                    if (controller.occupationName[i] == value) {
                                      controller.occupationNameSelect = value;
                                      controller.occupationIDSelect =
                                          controller.occupationID[i];
                                      break;
                                    }
                                  }
                                  controller.update();
                                },
                              ),

                              const SizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: CustomAutoSizeTextMontserrat(
                                  fontSize: 14,
                                  textColor: ThemeConstants.blackcolor,
                                  fontWeight: FontWeight.w400,
                                  mandatory: true,
                                  text: "Source of Incomes",
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 30,
                                width: MediaQuery.sizeOf(context).width - 20,
                                child: customDropDownPlanFund(
                                  model: controller.sourceIncomeName,
                                  callback: (value) {
                                    controller.selectedSourceOfIncome =
                                        controller.sourceIncomeName[value];
                                    controller.selectedSourceID = int.parse(
                                        controller.sourceIncomeID[value]);
                                    controller.update();
                                  },
                                  selectedValue:
                                      controller.selectedSourceOfIncome,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Align(
                                alignment: Alignment.topLeft,
                                child: CustomAutoSizeTextMontserrat(
                                    fontSize: 14,
                                    textColor: ThemeConstants.blackcolor,
                                    fontWeight: FontWeight.w400,
                                    mandatory: true,
                                    text:
                                        "Country of the Financial institution"),
                              ),
                              const SizedBox(height: 10),
                              CustomDropDownSingle(
                                choosefieldtype: false,
                                bgColor: ThemeConstants.ultraLightgreyColor2,
                                model: controller.loadingCountry == true
                                    ? controller.countryList
                                    : ["No Data"],
                                initialSelectedValue:
                                    controller.countrySelected,
                                callbackFunction: (value) async {
                                  print(value);
                                  for (var i = 0;
                                      i < controller.countryList.length;
                                      i++) {
                                    if (controller.countryList[i] == value) {
                                      controller.countrySelected = value;
                                      controller.countryId =
                                          int.parse(controller.countryCode[i]);
                                      break;
                                    }
                                  }
                                  controller.update();
                                  await controller.getBankByCountry(
                                      controller.countryId.toString());
                                },
                              ),

                              const SizedBox(height: 15),

                              CustomAutoSizeTextMontserrat(
                                  fontSize: 14,
                                  textColor: ThemeConstants.blackcolor,
                                  fontWeight: FontWeight.w400,
                                  mandatory: true,
                                  text: "Name of the Financial Institution"),
                              const SizedBox(height: 10),
                              CustomDropDownSingle(
                                choosefieldtype: false,
                                bgColor: ThemeConstants.ultraLightgreyColor2,
                                model: controller.loadingBank == true
                                    ? controller.bankName
                                    : ["No Data"],
                                initialSelectedValue:
                                    controller.selectedBankname,
                                callbackFunction: (value) {
                                  for (var i = 0;
                                      i < controller.bankName.length;
                                      i++) {
                                    if (controller.bankName[i] == value) {
                                      controller.selectedBankname = value;
                                      controller.selectedBankCode =
                                          controller.bankID[i].toString();
                                      break;
                                    }
                                  }
                                  controller.update();
                                },
                              ),

                              const SizedBox(height: 10),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: CustomAutoSizeTextMontserrat(
                                      fontSize: 14,
                                      textColor: ThemeConstants.blackcolor,
                                      fontWeight: FontWeight.w400,
                                      mandatory: true,
                                      text: "Type of Funds")),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 30,
                                width: MediaQuery.sizeOf(context).width - 20,
                                child: customDropDownPlanFund(
                                  model: controller.fundTypeName,
                                  callback: (value) {
                                    controller.selectedFundTypeName =
                                        controller.fundTypeName[value];
                                    controller.selectedFundTypeId =
                                        controller.fundTypeID[value].toString();
                                    controller.update();
                                  },
                                  selectedValue:
                                      controller.selectedFundTypeName,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                height: 60,
                                child: Row(
                                  children: [
                                    CustomAutoSizeTextMontserrat(
                                        fontSize: 14,
                                        textColor: ThemeConstants.blackcolor,
                                        fontWeight: FontWeight.w400,
                                        mandatory: true,
                                        text: "Are the funds 6 months old?"),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        controller.areFunds6MonthsOld = true;
                                        controller.update();
                                      },
                                      child: EnableButton(
                                        enabled: controller.areFunds6MonthsOld,
                                        text: 'Yes',
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.areFunds6MonthsOld = false;
                                        controller.update();
                                      },
                                      child: EnableButton(
                                        enabled: !controller.areFunds6MonthsOld,
                                        text: 'No',
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),

                              CustomAutoSizeTextMontserrat(
                                  fontSize: 14,
                                  textColor: ThemeConstants.blackcolor,
                                  fontWeight: FontWeight.w400,
                                  mandatory: true,
                                  text: "Amount (INR)"),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextField(
                                  hint: "Amount",
                                  keybord: TextInputType.number,
                                  controller: controller.amountData),

                              const SizedBox(
                                height: 10,
                              ),

                              // Padding(
                              //   padding: const EdgeInsets.only(top: 10),
                              //   child: SizedBox(
                              //     height: 185,
                              //     child: Container(
                              //       decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(10),
                              //         border: Border.all(
                              //             color: const Color(0xff1940b3)),
                              //       ),
                              //       child: SizedBox(
                              //         width: MediaQuery.of(context).size.height,
                              //         height: 200,
                              //         child: InkWell(
                              //           onTap: () {

                              //             // uploadDocument('2', 1);
                              //           },
                              //           child: Container(
                              //             padding: EdgeInsets.all(60),
                              //             child: CircleAvatar(
                              //               radius: 20,
                              //               child: Icon(
                              //                   Icons.file_upload_rounded,
                              //                   color:
                              //                       ThemeConstants.blackcolor,
                              //                   size: 30),
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),

                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 0, top: 10),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        getSourceSelected(
                                            callbackSelectedSource1,
                                            Get.find<BaseController>()
                                                .model1
                                                .id
                                                .toString(),
                                            0,
                                            0.toString());
                                      },
                                      child: CustomIconTextTogether(
                                        horizontelPadding: 20,
                                        textSize: 10,
                                        showICOn: true,
                                        color: ThemeConstants.whitecolor,
                                        Bgcolor: ThemeConstants.bluecolor,
                                        iconData: Icon(
                                          Icons.upload,
                                          size: 20,
                                          color: ThemeConstants.whitecolor,
                                        ),

                                        // enabled: !controller.areFunds6MonthsOld,
                                        text: 'Upload Document',
                                      ),
                                    ),
                                    // if (controller.filepath.isNotEmpty)
                                    Flexible(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: CustomAutoSizeTextMontserrat(
                                            text: controller.filepath
                                                .split("/")
                                                .last),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0.0,
                                    primary:
                                        ThemeConstants.bluecolor, // background
                                    onPrimary:
                                        ThemeConstants.bluecolor, // foreground
                                  ),
                                  onPressed: () {
                                    if (controller.filepath.isNotEmpty) {
                                      controller.uploadDocumentment();
                                    } else {
                                      controller.submitFundPlannerData();
                                    }
                                  },
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Submit",
                                    textColor: ThemeConstants.whitecolor,
                                  )),
                            ],
                          ),
                        ),
                      ),
              )),
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
        Get.to(TakePictureScreenFundPlanner(
          camera: firstCamera,
          id: temp[1],
          index: temp[2],
        ));
      } else {
        await uploadDocument('0', 1);
        // await controller.uploadDocument();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // callbackCitizenOf(data) {
  //   for (var i = 0; i < controller.bankName.length; i++) {
  //     if (i == 0) {
  //       controller.selectedBankname = null;
  //       controller.selectedBankCode = null;
  //     } else {
  //       if (controller.bankName[i] == data) {
  //         controller.selectedBankname = data;
  //         controller.selectedBankCode = controller.bankID[i];
  //       }
  //     }
  //   }
  //   controller.getBankByCountry();
  //   controller.update();
  // }
}

class customDropDownPlanFund extends StatelessWidget {
  Function callback;
  List model;
  String? selectedValue;
  customDropDownPlanFund({
    Key? key,
    required this.model,
    required this.callback,
    this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[...getlist(model)],
    );
  }

  getlist(List model) {
    List<Widget> data = [];
    for (var i = 0; i < model.length; i++) {
      if (selectedValue == model[i]) {
        data.add(
          InkWell(
            onTap: () {
              callback(i);
            },
            child: VerticalListForDropdown(
              text: model[i],
              selected: true,
            ),
          ),
        );
      } else {
        data.add(
          InkWell(
            onTap: () {
              callback(i);
            },
            child: VerticalListForDropdown(
              text: model[i],
              selected: false,
            ),
          ),
        );
      }
    }

    return data;
  }
}

class VerticalListForDropdown extends StatelessWidget {
  String text;
  bool selected;

  VerticalListForDropdown(
      {Key? key, required this.text, required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        height: 25,
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: selected == true
              ? ThemeConstants.bluecolor
              : ThemeConstants.ultraLightgreyColor2,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: CustomAutoSizeTextMontserrat(
          text: text,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          textColor: selected == true
              ? ThemeConstants.whitecolor
              : ThemeConstants.blackcolor,
        )),
      ),
    );
  }
}
