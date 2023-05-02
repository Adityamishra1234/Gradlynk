import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/realtion.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/relativeinformation.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';
import 'package:studentpanel/widgets/Custom%20Dropdown/custom_dropdown.dart';

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
      // try {
      //   if (updatForEdit == false) {
      //     controller.realtiveEmail.value.text =
      //         controller.modelList[index!].relativeEmailId ?? "";
      //     controller.contactOfRelative.value.text = getNUllChecker(controller
      //                 .modelList[index!].contactOfRelative
      //                 .toString()) ==
      //             false
      //         ? controller.modelList[index!].contactOfRelative.toString()
      //         : "";
      //     controller.addresOfrelative.value.text =
      //         controller.modelList[index!].addressOfRelative ?? "";
      //     controller.countryNameSelected =
      //         controller.modelList[index!].countryName ??
      //             controller.countryList[0];

      //     controller.citizenShipStatusSelected =
      //         controller.modelList[index!].citizenshipStatus ??
      //             controller.citizenShipStatus[0];
      //     controller.relationSelected =
      //         controller.modelList[index!].relationWithRelative;
      //     controller.anyRelativeCountryInterestedSelected =
      //         controller.modelList[index!].anyRelativeCountryInterested;
      //     controller.countryNameCodeSelected =
      //         controller.modelList[index!].relativeCountry.toString();
      //   }
      // } catch (e) {
      //   print(e.toString());
      // }

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
              CustomDropDownSingle(
                model: const ["Yes", "No"],
                initialSelectedValue: getNUllChecker(
                            controller.anyRelativeCountryInterestedSelected) ==
                        true
                    ? "No"
                    : controller.anyRelativeCountryInterestedSelected == "1"
                        ? "Yes"
                        : "No",
                choosefieldtype: false,
                callbackFunction: callbackAnyRelativeCountryInterested,
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
    print(controller.countryNameSelected);
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
      CustomDropDownSingle(
        model: getDropdownModel(controller.loadingCountry.value,
            controller.countryNameSelected, controller.countryList),
        initialSelectedValue: getSelectedDropDown(
            controller.loadingCountry.value,
            controller.countryNameSelected,
            controller.countryList),
        choosefieldtype: false,
        callbackFunction: callbackCountry,
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
      CustomDropDownSingle(
        model: getDropdownModel(controller.loadingCitizen.value,
            controller.citizenShipStatusSelected, controller.citizenShipStatus),
        initialSelectedValue: getSelectedDropDown(
            controller.loadingCitizen.value,
            controller.citizenShipStatusSelected,
            controller.citizenShipStatus),
        choosefieldtype: false,
        callbackFunction: callbackCitizenShip,
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
      CustomDropDownSingle(
        model: getDropdownModel(controller.loadingRealtion.value,
            controller.relationSelected, controller.realtion),
        initialSelectedValue: getSelectedDropDown(
            controller.loadingRealtion.value,
            controller.relationSelected,
            controller.realtion),
        choosefieldtype: false,
        callbackFunction: callbackRelation,
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
              controller: controller.realtiveEmail.value,
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
            text: "Contact of Relative",
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

            controller: controller.contactOfRelative.value,
            keyboardType: TextInputType.number,
            scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 40),
            decoration: InputDecoration(
              hintText: "Enter Contact of Relative",
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
            text: "Address of Relative",
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
            controller: controller.addresOfrelative.value,
            scrollPadding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).viewInsets.bottom + 30),
            decoration: InputDecoration(
              hintText: "Enter Contact of Relative",
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

                    if (controller.countryNameSelected == null) {
                      getToast(SnackBarConstants.countrySelect!);
                    } else if (controller.relativePageKey.currentState!
                            .validate() ==
                        false) {
                      getToast(SnackBarConstants
                          .contactInformationErrorForAllFields!);
                    } else if (controller.citizenShipStatusSelected == null) {
                      getToast(SnackBarConstants.citizenSelectError!);
                    } else if (controller.relationSelected == null) {
                      getToast(SnackBarConstants.relationSelectError!);
                    } else if (controller.realtiveEmail.value.text.isEmpty) {
                      getToast(SnackBarConstants.relationEmailError!);
                    } else if (controller
                        .contactOfRelative.value.text.isEmpty) {
                      getToast(SnackBarConstants.contactnumberError!);
                    } else if (controller.addresOfrelative.value.text.isEmpty) {
                      getToast(SnackBarConstants.addressError!);
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
                        relativeEmailId: controller.realtiveEmail.value.text,
                        contactOfRelative:
                            int.parse(controller.contactOfRelative.value.text),
                        addressOfRelative:
                            controller.addresOfrelative.value.text,
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
                      getToast(SnackBarConstants.countrySelect!);
                    } else if (controller.relativePageKey.currentState!
                            .validate() ==
                        false) {
                      getToast(SnackBarConstants
                          .contactInformationErrorForAllFields!);
                    } else if (controller.citizenShipStatusSelected == null) {
                      getToast(SnackBarConstants.citizenSelectError!);
                    } else if (controller.relationSelected == null) {
                      getToast(SnackBarConstants.relationSelectError!);
                    } else if (controller.realtiveEmail.value.text.isEmpty) {
                      getToast(SnackBarConstants.relationEmailError!);
                    } else if (controller
                        .contactOfRelative.value.text.isEmpty) {
                      getToast(SnackBarConstants.contactnumberError!);
                    } else if (controller.addresOfrelative.value.text.isEmpty) {
                      getToast(SnackBarConstants.addressError!);
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
                        relativeEmailId: controller.realtiveEmail.value.text,
                        contactOfRelative:
                            int.parse(controller.contactOfRelative.value.text),
                        addressOfRelative:
                            controller.addresOfrelative.value.text,
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

  List getDropdownModel(bool loading, String? selected, List model) {
    if (loading == true) {
      return model;
    } else {
      return ["No data"];
    }
  }

  String getSelectedDropDown(bool loading, String? selected, List model) {
    if (loading == true) {
      if (selected == null) {
        return model[0].toString();
      } else {
        return selected;
      }
    } else {
      return "No data";
    }
  }
}
