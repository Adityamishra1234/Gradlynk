import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/personalinformation.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/contactinformationcontroller.dart';

import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/Custom%20Dropdown/custom_dropdown.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customDatePicker.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

class ContactInformationCopy extends StatefulWidget {
  ContactInformationCopy({Key? key, this.editButton}) : super(key: key);
  static const routeNamed = '/ContactInformationCopy';
  bool? editButton = false;

  @override
  State<ContactInformationCopy> createState() => _ContactInformationCopyState();
}

class _ContactInformationCopyState extends State<ContactInformationCopy> {
  bool saveAndEdit = true;

  var controller = Get.put(ContactInformationController());

  bool socialMedia = false;
  List gender = ["Select gender", "Male", "Female", "Other"];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.editButton == true) {
      saveAndEdit = false;
      setState(() {});
    }
    return Scaffold(

        // appBar: const CustomAppBar("title"),
        // drawer: CustomDrawer(),
        body: controller.obx((state) {
      return controller.loadingStudentPanelData.value == 3
          ? Form(
              key: controller.profilePageKey,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(0),
                reverse: false,
                child: Column(
                  children: [
                    // Center(
                    //     child: InkWell(
                    //   onTap: () {
                    //     // Get.snackbar(
                    //     //     "Image Upload Process ", "Image Upload Process",
                    //     //     snackPosition: SnackPosition.BOTTOM);
                    //   },
                    //   child: CircleAvatar(
                    //     onBackgroundImageError: (exception, stackTrace) {
                    //       print(exception);
                    //       print(stackTrace.toString());
                    //     },
                    //     // onForegroundImageError: (exception, stackTrace) {
                    //     //   print(exception);
                    //     //   print(stackTrace.toString());
                    //     // },
                    //     radius: 80.0,
                    //     backgroundImage: const NetworkImage(
                    //         "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250"),
                    //     backgroundColor: Colors.transparent,
                    //   ),
                    // )),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Row(
                          children: [
                            CustomAutoSizeTextMontserrat(
                              text: "First Name",
                              //textColor: ThemeConstants.TextColor,
                              mandatory: true,
                              fontSize: 16,
                              // fontWeight: FontWeight.bold,
                            ),
                            // const Spacer(),
                            // if (saveAndEdit == false)
                            //   TextButton(
                            //       onPressed: () {
                            //         try {
                            //           if (getNUllChecker(firstName.text) ==
                            //               true) {
                            //             getToast(
                            //                 SnackBarConstants.firstNameError!);
                            //           } else if (profilePageKey.currentState!
                            //                   .validate() !=
                            //               true) {
                            //             getToast(SnackBarConstants
                            //                 .contactInformationErrorForAllFields!);
                            //           } else if (getNUllChecker(lastName.text) ==
                            //               true) {
                            //             getToast(
                            //                 SnackBarConstants.lastNameError!);
                            //           } else if (getNUllChecker(
                            //               controller.dob)) {
                            //             getToast(SnackBarConstants.dobError!);
                            //           } else if (getNUllChecker(
                            //                   controller.genderIdSelected) ==
                            //               true) {
                            //             getToast(
                            //                 SnackBarConstants.genderError!);
                            //           } else if (getNUllChecker(controller
                            //                   .maritalStatusSelected) ==
                            //               true) {
                            //             getToast(SnackBarConstants
                            //                 .maritalStatusError!);
                            //           } else if (getNUllChecker(
                            //                   mobileNumber.text) ==
                            //               true) {
                            //             getToast(SnackBarConstants
                            //                 .mobileNumberError!);
                            //           } else if (getNUllChecker(
                            //                   alt_Number.text) ==
                            //               true) {
                            //             getToast(SnackBarConstants
                            //                 .alternateNumberError!);
                            //           } else if (getNUllChecker(email.text)) {
                            //             getToast(SnackBarConstants.emailError!);
                            //           } else if (getNUllChecker(
                            //               controller.countrySelected)) {
                            //             getToast(
                            //                 SnackBarConstants.countryError!);
                            //           } else if (getNUllChecker(
                            //               controller.stateSelected)) {
                            //             getToast(SnackBarConstants.stateError!);
                            //           } else if (getNUllChecker(
                            //               controller.citySelected)) {
                            //             getToast(SnackBarConstants.cityError!);
                            //           } else if (getNUllChecker(zipCode.text)) {
                            //             getToast(
                            //                 SnackBarConstants.zipCodeError!);
                            //           } else {
                            //             updatePesonalDetail(
                            //                 Get.find<BaseController>()
                            //                     .model1
                            //                     .id!,
                            //                 firstName.text,
                            //                 lastName.text,
                            //                 controller.dob,
                            //                 controller.genderIdSelected!,
                            //                 controller.maritalStatusIdSelected!,
                            //                 controller.childrenCountSelected!,
                            //                 mobileNumber.text,
                            //                 email.text,
                            //                 int.parse(whatsappNumber.text),
                            //                 int.parse(alt_Number.text),
                            //                 controller.countryIdSelected!,
                            //                 controller.stateIdSelected!,
                            //                 controller.cityIdSelected!,
                            //                 street.text,
                            //                 int.parse(zipCode.text),
                            //                 facebookId.text,
                            //                 snapchatId.text,
                            //                 instagramId.text,
                            //                 secondaryEmail.text);
                            //             saveAndEdit = true;
                            //             setState(() {});
                            //           }
                            //         } catch (e) {
                            //           print(StackTrace.current);
                            //           getToast(SnackBarConstants.errorMsg!);
                            //         }
                            //       },
                            //       child: CustomAutoSizeTextMontserrat(
                            //         text: "save",
                            //         // fontWeight: FontWeight.bold,
                            //         fontSize: 18,
                            //         textColor: ThemeConstants.bluecolor,
                            //       )),
                            // if (saveAndEdit)
                            //   TextButton(
                            //       onPressed: () {
                            //         saveAndEdit = false;
                            //         setState(() {});
                            //       },
                            //       child: CustomAutoSizeTextMontserrat(
                            //         text: "Edit",
                            //         // fontWeight: FontWeight.bold,
                            //         fontSize: 18,
                            //         textColor: ThemeConstants.bluecolor,
                            //       ))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,

                        controller: ContactInformationController.firstName,
                        scrollPadding: EdgeInsets.only(
                            bottom:
                                MediaQuery.of(context).viewInsets.bottom + 40),
                        readOnly: saveAndEdit,
                        decoration: InputDecoration(
                          hintText: "Enter your First Name",
                          filled: true,
                          fillColor: ThemeConstants.lightblueColor,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        style: ThemeConstants.montserrattextstyle2,
                        // onChanged: (value) {
                        //   if (controller.firstNameKey.currentState!
                        //       .validate()) {
                        //     controller.firstNameKey.currentState!.save();
                        //   }
                        // },
                        validator: (value) {
                          if (value == "") {
                            return "Please enter First Name";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Last Name",
                          mandatory: true,
                          // textColor: ThemeConstants.blackcolor,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,

                        controller: ContactInformationController.lastName,
                        scrollPadding: EdgeInsets.only(
                            bottom:
                                MediaQuery.of(context).viewInsets.bottom + 40),
                        readOnly: saveAndEdit,
                        decoration: InputDecoration(
                          hintText: "Enter your Last Name",
                          filled: true,
                          fillColor: ThemeConstants.lightblueColor,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        style: ThemeConstants.montserrattextstyle2,
                        // onChanged: (value) {
                        //   if (controller.lastNameKey.currentState!.validate()) {
                        //     controller.lastNameKey.currentState!.save();
                        //   }
                        // },
                        validator: (value) {
                          if (value == "") {
                            return "Please enter Last Name";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Date of Birth",
                          mandatory: true,
                          //textColor: ThemeConstants.TextColor,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: DatePickerExample(
                        enableField: saveAndEdit,
                        date: getNUllChecker(controller.dob) == false
                            ? controller.dob
                            : "",
                        callbackDate: callbackDOB,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Gender",
                          mandatory: true,
                          //textColor: ThemeConstants.TextColor,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomDropDownSingle(
                      model: getDropdownModel(
                          true, controller.genderSelected, gender),
                      callbackFunction: callbackGender,
                      initialSelectedValue: getSelectedDropDown(
                          true, controller.genderSelected, gender),
                      choosefieldtype: saveAndEdit,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Marital status",
                          mandatory: true,
                          //textColor: ThemeConstants.TextColor,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomDropDownSingle(
                      model: getDropdownModel(
                          controller.loadingmartialStatus.value,
                          controller.maritalStatusSelected,
                          controller.martialStatusList),
                      callbackFunction: callbackMaritalStatus,
                      initialSelectedValue: getSelectedDropDown(
                          controller.loadingmartialStatus.value,
                          controller.maritalStatusSelected,
                          controller.martialStatusList),
                      choosefieldtype: saveAndEdit,
                    ),
                    if (controller.maritalStatusIdSelected == 1 ||
                        controller.maritalStatusIdSelected == 3)
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 20, right: 10),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: CustomAutoSizeTextMontserrat(
                            text: "Children Count",
                            //textColor: ThemeConstants.TextColor,
                            fontSize: 16,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    if (controller.maritalStatusIdSelected == 1 ||
                        controller.maritalStatusIdSelected == 3)
                      CustomDropDownSingle(
                        model: const ["1", "2", "3", "4"],
                        callbackFunction: callbackChildrenCount,
                        initialSelectedValue:
                            controller.childrenCountSelected != null
                                ? controller.childrenCountSelected.toString()
                                : "1",
                        choosefieldtype: saveAndEdit,
                      ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Mobile Number",
                          mandatory: true,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                          //textColor: ThemeConstants.TextColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,

                        controller: ContactInformationController.mobileNumber,
                        keyboardType: TextInputType.number,
                        scrollPadding: EdgeInsets.only(
                            bottom:
                                MediaQuery.of(context).viewInsets.bottom + 40),
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: "Mobile Number",
                          filled: true,
                          fillColor: ThemeConstants.lightblueColor,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        style: ThemeConstants.montserrattextstyle2,
                        // onChanged: (value) {
                        //   // RenderObject? object =
                        //   //     globalKey.currentContext!.findRenderObject();
                        //   // object!.showOnScreen();
                        //   if (controller.mobileNameKey.currentState!
                        //       .validate()) {
                        //     controller.mobileNameKey.currentState!.save();
                        //   }
                        // },
                        validator: (value) {
                          return getPhoneNumbervalidation(value);
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Whatsapp Number",
                          //textColor: ThemeConstants.TextColor,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      child: Row(children: [
                        Checkbox(
                            value:
                                controller.whatsappNumberIsSameAsMobileNumber,
                            onChanged: (val) {
                              controller.whatsappNumberIsSameAsMobileNumber =
                                  val!;

                              if (val == true) {
                                ContactInformationController
                                        .whatsappNumber.value =
                                    ContactInformationController
                                        .mobileNumber.value;
                              } else {
                                ContactInformationController.whatsappNumber
                                    .clear();
                              }
                              controller.update();
                            }),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.6,
                          child: CustomAutoSizeTextMontserrat(
                            text: "This number is Whatsapp number",
                            //textColor: ThemeConstants.TextColor,
                            fontSize: 16,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,

                        controller: ContactInformationController.whatsappNumber,
                        keyboardType: TextInputType.number,
                        scrollPadding: EdgeInsets.only(
                            bottom:
                                MediaQuery.of(context).viewInsets.bottom + 40),
                        readOnly: saveAndEdit,
                        decoration: InputDecoration(
                          hintText: "Enter your Whatsapp Number",
                          filled: true,
                          fillColor: ThemeConstants.lightblueColor,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        style: ThemeConstants.montserrattextstyle2,
                        // onChanged: (value) {
                        //   if (controller.whatsappNumberkey.currentState!
                        //       .validate()) {
                        //     controller.whatsappNumberkey.currentState!.save();
                        //   }
                        // },
                        validator: (value) {
                          return getPhoneNumbervalidation(value);
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Alternate Number",
                          mandatory: true,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                          //textColor: ThemeConstants.TextColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,

                        controller: ContactInformationController.alt_Number,
                        keyboardType: TextInputType.number,
                        scrollPadding: EdgeInsets.only(
                            bottom:
                                MediaQuery.of(context).viewInsets.bottom + 40),
                        readOnly: saveAndEdit,
                        decoration: InputDecoration(
                          hintText: "Alternate Number",
                          filled: true,
                          fillColor: ThemeConstants.lightblueColor,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        style: ThemeConstants.montserrattextstyle2,
                        // onChanged: (value) {
                        //   if (controller.alternateNumberKey.currentState!
                        //       .validate()) {
                        //     controller.alternateNumberKey.currentState!.save();
                        //   }
                        // },
                        validator: (value) {
                          return getPhoneNumbervalidation(value);
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Email",
                          mandatory: true,
                          //textColor: ThemeConstants.TextColor,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: ContactInformationController.email,
                        scrollPadding: EdgeInsets.only(
                            bottom:
                                MediaQuery.of(context).viewInsets.bottom + 40),
                        readOnly: saveAndEdit,
                        decoration: InputDecoration(
                          hintText: "Enter your email",
                          filled: true,
                          fillColor: ThemeConstants.lightblueColor,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        style: ThemeConstants.montserrattextstyle2,
                        // onChanged: (value) {
                        //   if (controller.emailKey.currentState!.validate()) {
                        //     controller.emailKey.currentState!.save();
                        //   }
                        // },
                        validator: (value) {
                          return getEmailvaliation(value);
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Secondary Email",
                          //textColor: ThemeConstants.TextColor,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,

                        controller: ContactInformationController.secondaryEmail,
                        scrollPadding: EdgeInsets.only(
                            bottom:
                                MediaQuery.of(context).viewInsets.bottom + 40),
                        readOnly: saveAndEdit,
                        decoration: InputDecoration(
                          hintText: "Enter your Secondary Email",
                          filled: true,
                          fillColor: ThemeConstants.lightblueColor,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        style: ThemeConstants.montserrattextstyle2,
                        // onChanged: (value) {
                        //   if (controller.secondaryemailKey.currentState!
                        //       .validate()) {
                        //     controller.secondaryemailKey.currentState!.save();
                        //   }
                        // },
                        validator: (value) {
                          return getEmailvaliation(value);
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Zip Code",
                          mandatory: true,
                          //textColor: ThemeConstants.TextColor,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,

                        controller: ContactInformationController.zipCode,
                        keyboardType: TextInputType.number,
                        scrollPadding: EdgeInsets.only(
                            bottom:
                                MediaQuery.of(context).viewInsets.bottom + 40),
                        readOnly: saveAndEdit,
                        decoration: InputDecoration(
                          hintText: "Enter your Zip Code",
                          filled: true,
                          fillColor: ThemeConstants.lightblueColor,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        style: ThemeConstants.montserrattextstyle2,
                        // onChanged: (value) {
                        //   if (controller.zipcodekey.currentState!.validate()) {
                        //     controller.zipcodekey.currentState!.save();
                        //   }
                        // },
                        onFieldSubmitted: (Value) {
                          controller.idsFromZipCode(int.parse(Value));
                        },
                        validator: (value) {
                          if (value == "") {
                            return "Please enter Zip code";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    // InkWell(
                    //   child: Text('Fetch Details From Zip Code'),
                    // ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Country of residence",
                          mandatory: true,
                          //textColor: ThemeConstants.TextColor,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomDropDownSingle(
                      model: getDropdownModel(controller.loadingCountry.value,
                          controller.countrySelected, controller.countryList),
                      callbackFunction: callbackCountry,
                      initialSelectedValue: getSelectedDropDown(
                          controller.loadingCountry.value,
                          controller.countrySelected,
                          controller.countryList),
                      choosefieldtype: saveAndEdit,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "State",
                          mandatory: true,
                          //textColor: ThemeConstants.TextColor,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomDropDownSingle(
                      model: getDropdownModel(controller.loadingState.value,
                          controller.stateSelected, controller.stateList),
                      callbackFunction: calllbackState,
                      initialSelectedValue: getSelectedDropDown(
                          controller.loadingState.value,
                          controller.stateSelected,
                          controller.stateList),
                      choosefieldtype: saveAndEdit,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "City",
                          mandatory: true,
                          //textColor: ThemeConstants.TextColor,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomDropDownSingle(
                      model: getDropdownModel(controller.loadingCity.value,
                          controller.citySelected, controller.cityList),
                      callbackFunction: callbackCity,
                      initialSelectedValue: getSelectedDropDown(
                          controller.loadingCity.value,
                          controller.citySelected,
                          controller.cityList),
                      choosefieldtype: saveAndEdit,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Street",
                          //textColor: ThemeConstants.TextColor,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,

                        controller: ContactInformationController.street,
                        scrollPadding: EdgeInsets.only(
                            bottom:
                                MediaQuery.of(context).viewInsets.bottom + 40),
                        readOnly: saveAndEdit,
                        decoration: InputDecoration(
                          hintText: "Enter your Street",
                          filled: true,
                          fillColor: ThemeConstants.lightblueColor,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        style: ThemeConstants.montserrattextstyle2,
                        // onChanged: (value) {
                        //   if (controller.streetkey.currentState!.validate()) {
                        //     controller.streetkey.currentState!.save();
                        //   }
                        // },
                        validator: (value) {
                          if (value == "") {
                            return "Please enter street";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    CheckboxListTile(
                      title: CustomAutoSizeTextMontserrat(
                          text: "Are you available on Social Media"),
                      value: socialMedia,
                      onChanged: (newValue) {
                        setState(() {
                          socialMedia = newValue!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                    if (socialMedia == true)
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 20, right: 10),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: CustomAutoSizeTextMontserrat(
                            text: "Instagram Id",
                            //textColor: ThemeConstants.TextColor,
                            fontSize: 16,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    if (socialMedia == true)
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,

                          controller: ContactInformationController.instagramId,
                          scrollPadding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom +
                                  40),
                          readOnly: saveAndEdit,
                          decoration: InputDecoration(
                            hintText: "Enter your Instagram Id",
                            filled: true,
                            fillColor: ThemeConstants.lightblueColor,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          style: ThemeConstants.montserrattextstyle2,
                          // onChanged: (value) {
                          //   if (controller.instragramkey.currentState!
                          //       .validate()) {
                          //     controller.instragramkey.currentState!.save();
                          //   }
                          // },
                          validator: (value) {
                            if (value == "") {
                              return "Please enter Instagram";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    if (socialMedia == true)
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 20, right: 10),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: CustomAutoSizeTextMontserrat(
                            text: "Facebook Id",
                            //textColor: ThemeConstants.TextColor,
                            fontSize: 16,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    if (socialMedia == true)
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,

                          controller: ContactInformationController.facebookId,
                          scrollPadding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom +
                                  40),
                          readOnly: saveAndEdit,
                          decoration: InputDecoration(
                            hintText: "Enter your Facebook Id",
                            filled: true,
                            fillColor: ThemeConstants.lightblueColor,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          style: ThemeConstants.montserrattextstyle2,
                          // onChanged: (value) {
                          //   if (controller.facebookkey.currentState!
                          //       .validate()) {
                          //     controller.facebookkey.currentState!.save();
                          //   }
                          // },
                          validator: (value) {
                            if (value == "") {
                              return "Please enter Facebook";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    if (socialMedia == true)
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 20, right: 10),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: CustomAutoSizeTextMontserrat(
                            text: "Snapchat Id",
                            //textColor: ThemeConstants.TextColor,
                            fontSize: 16,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    if (socialMedia == true)
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,

                          controller: ContactInformationController.snapchatId,
                          scrollPadding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom +
                                  40),
                          readOnly: saveAndEdit,
                          decoration: InputDecoration(
                            hintText: "Enter your Snapchat Id",
                            filled: true,
                            fillColor: ThemeConstants.lightblueColor,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          style: ThemeConstants.montserrattextstyle2,
                          // onChanged: (value) {
                          //   if (controller.firstNameKey.currentState!
                          //       .validate()) {
                          //     controller.firstNameKey.currentState!.save();
                          //   }
                          // },
                          validator: (value) {
                            if (value == "") {
                              return "Please enter snapchat";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Assigned Advisors",
                          //textColor: ThemeConstants.TextColor,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        onTap: () {
                          getToast("Auto Selected");
                        },
                        scrollPadding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).viewInsets.bottom + 30),
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: ThemeConstants.montserrattextstyle2,
                          hintText: ContactInformationController
                              .assignedAdvisors.text,
                          filled: true,
                          fillColor: ThemeConstants.lightblueColor,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        style: ThemeConstants.montserrattextstyle2,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Assigned Branch",
                          //textColor: ThemeConstants.TextColor,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        onTap: () {
                          getToast("Auto Selected");
                        },
                        scrollPadding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).viewInsets.bottom + 30),
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: ThemeConstants.montserrattextstyle2,
                          hintText:
                              ContactInformationController.assignedBranch.text,
                          filled: true,
                          fillColor: ThemeConstants.lightblueColor,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        style: ThemeConstants.montserrattextstyle2,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Service",
                          //textColor: ThemeConstants.TextColor,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        onTap: () {
                          getToast("Auto Selected");
                        },
                        scrollPadding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).viewInsets.bottom + 30),
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: ThemeConstants.montserrattextstyle2,
                          hintText: ContactInformationController.service.text,
                          filled: true,
                          fillColor: ThemeConstants.lightblueColor,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        style: ThemeConstants.montserrattextstyle2,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "First Country of Interest",
                          //textColor: ThemeConstants.TextColor,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        onTap: () {
                          getToast("Auto Selected");
                        },
                        scrollPadding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).viewInsets.bottom + 30),
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: ThemeConstants.montserrattextstyle2,
                          hintText: ContactInformationController
                              .firstCountryInterest.text,
                          filled: true,
                          fillColor: ThemeConstants.lightblueColor,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        style: ThemeConstants.montserrattextstyle2,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Other country interested",
                          //textColor: ThemeConstants.TextColor,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        onTap: () {
                          getToast("Auto Selected");
                        },
                        // controller: otherCountryinterested,
                        scrollPadding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).viewInsets.bottom + 30),
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: ThemeConstants.montserrattextstyle2,
                          hintText: ContactInformationController
                              .otherCountryinterested.text,
                          filled: true,
                          fillColor: ThemeConstants.lightblueColor,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        style: ThemeConstants.montserrattextstyle2,
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 15),
                    //   child: Row(
                    //     children: [
                    //       const Spacer(),
                    //       if (saveAndEdit)
                    //         Padding(
                    //           padding: const EdgeInsets.only(right: 15),
                    //           child: SizedBox(
                    //             width: 100,
                    //             height: 35,
                    //             child: ElevatedButton(
                    //               style: ElevatedButton.styleFrom(
                    //                 foregroundColor: ThemeConstants.whitecolor,
                    //                 side: BorderSide(
                    //                     color: ThemeConstants.bluecolor),
                    //                 backgroundColor:
                    //                     ThemeConstants.whitecolor, // foreground
                    //               ),
                    //               onPressed: () {
                    //                 saveAndEdit = false;
                    //                 setState(() {});
                    //               },
                    //               child: CustomAutoSizeTextMontserrat(
                    //                 text: "Edit",
                    //                 textColor: ThemeConstants.bluecolor,
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       if (saveAndEdit == false)
                    //         Padding(
                    //           padding: const EdgeInsets.only(right: 15),
                    //           child: SizedBox(
                    //             width: 100,
                    //             height: 35,
                    //             child: ElevatedButton(
                    //               style: ElevatedButton.styleFrom(
                    //                 foregroundColor: ThemeConstants.whitecolor,
                    //                 side: BorderSide(
                    //                     color: ThemeConstants.bluecolor),
                    //                 backgroundColor:
                    //                     ThemeConstants.whitecolor, // foreground
                    //               ),
                    //               onPressed: () {},
                    //               child: CustomAutoSizeTextMontserrat(
                    //                 text: "Save",
                    //                 textColor: ThemeConstants.bluecolor,
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //     ],
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 30,
                    // ),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom)),
                  ],
                ),
              ),
            )
          : Center(
              child: getLoading(context),
            );
    }, onLoading: getLoading(context)));
  }

  // Funcation

  callbackCity(varTopic) {
    for (var i = 0; i < controller.cityList.length; i++) {
      if (i == 0) {
        controller.citySelected = null;
        controller.cityIdSelected = null;
      } else {
        if (controller.cityList[i] == varTopic) {
          controller.citySelected = controller.cityList[i];
          controller.cityIdSelected = int.parse(controller.cityCode[i]);
          // controller.getCity("${controller.cityCode[i]}");
        }
      }
    }
    controller.update();
    // setState(() {});
  }

  calllbackState(varTopic) {
    for (var i = 0; i < controller.stateList.length; i++) {
      if (i == 0) {
        controller.stateSelected = null;
        controller.stateIdSelected = null;
      } else {
        if (controller.stateList[i] == varTopic) {
          controller.stateSelected = varTopic;
          controller.stateIdSelected = int.parse(controller.stateCode[i]);
          controller.getState(controller.stateCode[i]);
        }
      }
    }
    controller.update();
  }

  callbackCountry(varTopic) {
    for (var i = 0; i < controller.countryList.length; i++) {
      if (i == 0) {
        controller.countryIdSelected = null;
        controller.countryIdSelected = null;
      } else {
        if (controller.countryList[i] == varTopic) {
          controller.countrySelected = varTopic;
          controller.countryIdSelected = int.parse(controller.countryCode[i]);
          controller.getState(controller.countryCode[i]);
        }
      }
    }
    controller.update();
  }

  callbackGender(varTopic) {
    for (var i = 0; i < gender.length; i++) {
      if (i == 0) {
        controller.genderSelected = null;
        controller.genderIdSelected = null;
      } else if (gender[i].toString() == varTopic.toString()) {
        controller.genderSelected = gender[i];
        controller.genderIdSelected = i + 1;
      }
    }
    controller.update();
  }

  callbackMaritalStatus(varTopic) {
    for (var i = 1; i < controller.martialStatusList.length; i++) {
      if (i == 0) {
        controller.maritalStatusSelected = null;
        controller.maritalStatusIdSelected = null;
      }
      if (controller.martialStatusList[i].toString() == varTopic.toString()) {
        controller.maritalStatusSelected = controller.martialStatusList[i];
        controller.maritalStatusIdSelected = i;
      }
    }
    controller.update();
  }

  callbackChildrenCount(varTopic) {
    if (getNUllChecker(varTopic) == false) {
      if (varTopic == "No") {
        controller.childrenCountSelected = int.parse("0");
      } else {
        controller.childrenCountSelected = int.parse(varTopic);
      }
    }
    controller.update();
  }

  callbackDOB(data) {
    String temp = data.toString().split(' ')[0];
    List<String> date = temp.split('-');
    controller.dob = date[0] + "-" + date[1] + '-' + date[2];
    controller.update();
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
