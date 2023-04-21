import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/controllers/relativeinformation.dart';
import 'package:studentpanel/ui/models/realtion.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';

class RelativeInformationWidget extends StatelessWidget {
  int? index;
  bool updatForEdit;
  // bool interestedCountry;
  Function callbackAnyRelativeCountryInterested;
  Function callbackCountry;
  Function callbackCitizenShip;
  Function callbackRelation;
  RelativeInformationWidget(
      {Key? key,
      this.index,
      // required this.interestedCountry,
      required this.updatForEdit,
      required this.callbackAnyRelativeCountryInterested,
      required this.callbackCountry,
      required this.callbackCitizenShip,
      required this.callbackRelation})
      : super(key: key);

  var controller = Get.put(RelativeInformationController());

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      try {
        if (updatForEdit == false) {
          RelativeInformationController.realtiveEmail.value.text =
              controller.modelList[index!].relativeEmailId ?? "";
          RelativeInformationController.contactOfRelative.value.text =
              getNUllChecker(controller.modelList[index!].contactOfRelative
                          .toString()) ==
                      false
                  ? controller.modelList[index!].contactOfRelative.toString()
                  : "";
          RelativeInformationController.addresOfrelative.value.text =
              controller.modelList[index!].addressOfRelative ?? "";
          controller.countryNameSelected =
              controller.modelList[index!].countryName ??
                  controller.countryList[0];

          controller.citizenShipStatusSelected =
              controller.modelList[index!].citizenshipStatus ??
                  controller.citizenShipStatus[0];
          controller.relationSelected =
              controller.modelList[index!].relationWithRelative;
          controller.anyRelativeCountryInterestedSelected =
              controller.modelList[index!].anyRelativeCountryInterested;
          controller.countryNameCodeSelected =
              controller.modelList[index!].relativeCountry.toString();
        }
      } catch (e) {
        print(e.toString());
      }

      return Form(
        key: controller.relativePageKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: CustomAutoSizeTextMontserrat(
                    text: "Any relatives residing in the Interested Country",
                    textColor: ThemeConstants.TextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: CustomDropDownSingle(
                  model: const ["Yes", "No"],
                  initialSelectedValue: getNUllChecker(controller
                              .anyRelativeCountryInterestedSelected) ==
                          true
                      ? "No"
                      : controller.anyRelativeCountryInterestedSelected == "1"
                          ? "Yes"
                          : "No",
                  choosefieldtype: false,
                  callbackFunction: callbackAnyRelativeCountryInterested,
                ),
              ),
              if (controller.anyRelativeCountryInterestedSelected == "1")
                ...interestedCountry(controller, context),
            ],
          ),
        ),
      );
    }, onLoading: getLoading(context));
  }

  //Funcation
  List<Widget> interestedCountry(
      RelativeInformationController controller, BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Country Name",
            mandatory: true,
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        child: CustomDropDownSingle(
          model: controller.loadingCountry.value == true
              ? controller.countryList
              : ["No data"],
          initialSelectedValue: controller.loadingCountry.value == true
              ? updatForEdit == false
                  ? controller.countryNameSelected
                  : controller.countryList[0]
              : "No data",
          choosefieldtype: false,
          callbackFunction: callbackCountry,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Citizenship Status",
            mandatory: true,
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        child: CustomDropDownSingle(
          model: controller.loadingCitizen.value == true
              ? controller.citizenShipStatus
              : ["No data"],
          initialSelectedValue: controller.loadingCitizen.value == true
              ? updatForEdit == false
                  ? controller.citizenShipStatusSelected
                  : controller.citizenShipStatus[0]
              : "No data",
          choosefieldtype: false,
          callbackFunction: callbackCitizenShip,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Relation",
            mandatory: true,
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        child: CustomDropDownSingle(
          model: controller.loadingRealtion.value == true
              ? controller.realtion
              : ["No data"],
          initialSelectedValue: controller.loadingRealtion.value == true
              ? updatForEdit == false
                  ? controller.relationSelected
                  : controller.realtion[0]
              : "No data",
          choosefieldtype: false,
          callbackFunction: callbackRelation,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Relative Email",
            mandatory: true,
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Obx(() => Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextFormField(
              autofocus: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: RelativeInformationController.realtiveEmail.value,
              scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 40),
              decoration: InputDecoration(
                hintText: "Enter Relative Email",
                filled: true,
                fillColor: ThemeConstants.lightblueColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              style: ThemeConstants.montserrattextstyle,
              // onChanged: (value) {
              //   if (relativeemailkey.currentState!.validate()) {
              //     relativeemailkey.currentState!.save();
              //   }
              // },
              validator: (value) {
                print(value);
                return getEmailvaliation(value);
              },
            ),
          )),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Contact Of Relative",
            mandatory: true,
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Obx(
        () => Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextFormField(
            autofocus: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,

            controller: RelativeInformationController.contactOfRelative.value,
            keyboardType: TextInputType.number,
            scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 40),
            decoration: InputDecoration(
              hintText: "Enter Contact Of Relative",
              filled: true,
              fillColor: ThemeConstants.lightblueColor,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            style: ThemeConstants.montserrattextstyle,
            // onChanged: (value) {
            //   if (contactkey.currentState!.validate()) {
            //     contactkey.currentState!.save();
            //   }
            // },
            validator: (value) {
              return getPhoneNumbervalidation(value);
            },
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Address Of Relative",
            mandatory: true,
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Obx(
        () => Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextField(
            autofocus: true,
            controller: RelativeInformationController.addresOfrelative.value,
            scrollPadding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).viewInsets.bottom + 30),
            decoration: InputDecoration(
              hintText: "Enter Contact Of Relative",
              filled: true,
              fillColor: ThemeConstants.lightblueColor,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            style: ThemeConstants.montserrattextstyle,
          ),
        ),
      ),
      if (updatForEdit == true)
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: SizedBox(
              width: 90,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: ThemeConstants.bluecolor, elevation: 0.0,
                    backgroundColor: ThemeConstants.bluecolor, // foreground
                  ),
                  onPressed: () async {
                    //country, citizenship,relation,relative email,contact,address.
                    print(controller.relativePageKey.currentState!.validate());
                    if (controller.countryNameSelected == null) {
                      getToast("please select country");
                    } else if (controller.relativePageKey.currentState!
                        .validate()) {
                      getToast("Please check fileds");
                    } else if (controller.citizenShipStatusSelected == null) {
                      getToast("please select citizenShip Status");
                    } else if (controller.relationSelected == null) {
                      getToast("please select relation");
                    } else if (RelativeInformationController
                        .realtiveEmail.value.text.isEmpty) {
                      getToast("please enter  relative email");
                    } else if (RelativeInformationController
                        .contactOfRelative.value.text.isEmpty) {
                      getToast("please enter  relative contact number");
                    } else if (RelativeInformationController
                        .addresOfrelative.value.text.isEmpty) {
                      getToast("please enter  address of relative");
                    } else {
                      controller.modelList.add(RealtionModel(
                        countryName: controller.countryNameSelected,
                        relationWithRelative: controller.relationSelected,
                        id: "",
                        anyRelativeCountryInterested:
                            controller.anyRelativeCountryInterestedSelected,
                        citizenshipStatus: controller.citizenShipStatusSelected,
                        relativeCountry:
                            int.parse(controller.countryNameCodeSelected!),
                        relativeEmailId: RelativeInformationController
                            .realtiveEmail.value.text,
                        contactOfRelative: int.parse(
                            RelativeInformationController
                                .contactOfRelative.value.text),
                        addressOfRelative: RelativeInformationController
                            .addresOfrelative.value.text,
                      ));

                      controller.updateRelativeInformation(
                          Get.find<BaseController>().model1.id.toString(),
                          "1",
                          "add");

                      controller.update();
                    }
                  },
                  child: CustomAutoSizeTextMontserrat(
                    text: "Add",
                    textColor: ThemeConstants.whitecolor,
                  )),
            ),
          ),
        ),
      if (updatForEdit == false)
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: SizedBox(
              width: 110,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: ThemeConstants.bluecolor, elevation: 0.0,
                    backgroundColor: ThemeConstants.bluecolor, // foreground
                  ),
                  onPressed: () async {
                    if (controller.countryNameSelected == null) {
                      getToast("please select country");
                    } else if (controller.relativePageKey.currentState!
                        .validate()) {
                      getToast("Please check fileds");
                    } else if (controller.citizenShipStatusSelected == null) {
                      getToast("please select citizenShip Status");
                    } else if (controller.relationSelected == null) {
                      getToast("please select relation");
                    } else if (RelativeInformationController
                        .realtiveEmail.value.text.isEmpty) {
                      getToast("please enter  relative email");
                    } else if (RelativeInformationController
                        .contactOfRelative.value.text.isEmpty) {
                      getToast("please enter  relative contact number");
                    } else if (RelativeInformationController
                        .addresOfrelative.value.text.isEmpty) {
                      getToast("please enter  address of relative");
                    } else {
                      RealtionModel model = RealtionModel();

                      model = RealtionModel(
                        countryName: controller.countryNameSelected,
                        relationWithRelative: controller.relationSelected,
                        id: "",
                        anyRelativeCountryInterested:
                            controller.anyRelativeCountryInterestedSelected,
                        citizenshipStatus: controller.citizenShipStatusSelected,
                        relativeCountry:
                            int.parse(controller.countryNameCodeSelected!),
                        relativeEmailId: RelativeInformationController
                            .realtiveEmail.value.text,
                        contactOfRelative: int.parse(
                            RelativeInformationController
                                .contactOfRelative.value.text),
                        addressOfRelative: RelativeInformationController
                            .addresOfrelative.value.text,
                      );
                      controller.modelList[index!] = model;
                      controller.updateRelativeInformation(
                          Get.find<BaseController>().model1.id.toString(),
                          "1",
                          "Updated");
                    }
                  },
                  child: CustomAutoSizeTextMontserrat(
                    text: "Update",
                    textColor: ThemeConstants.whitecolor,
                  )),
            ),
          ),
        ),
      const SizedBox(
        height: 30,
      ),
      SizedBox(
        height: MediaQuery.of(context).viewInsets.bottom,
      )
    ];
  }
}
