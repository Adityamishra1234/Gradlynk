import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/contactinformationcontroller.dart';
import 'package:studentpanel/utils/config/size_config.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/Custom%20Dropdown/custom_dropdown.dart';
import 'package:studentpanel/widgets/Custom_time_widgets.dart/custom_timer_widget.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customtextfield.dart';

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

  List gender = ["Select gender", "Male", "Female", "Other"];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool tabOrLand = MediaQuery.of(context).size.width > 600;
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
                padding: const EdgeInsets.all(0),
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
                              textColor: ThemeConstants.TextColor,
                              fontSize: SizeConfig.fontLabelSize,
                              fontWeight: SizeConfig.fontLabelWeight,
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

                      child: CustomTextField(
                        hint: "Enter your First Name",
                        controller: ContactInformationController.firstName,
                        validator: Validator.notEmpty,
                        readOrEdit: saveAndEdit,
                      ),
                      // child: TextFormField(
                      //   autovalidateMode: AutovalidateMode.onUserInteraction,
                      //
                      //   controller: ContactInformationController.firstName,
                      //   scrollPadding: EdgeInsets.only(
                      //       bottom:
                      //           MediaQuery.of(context).viewInsets.bottom + 40),
                      //   readOnly: saveAndEdit,
                      //
                      //   decoration: InputDecoration(
                      //     hintText: "Enter your First Name",
                      //     hintStyle:
                      //         ThemeConstants.montserrattextstyleForPlaceHolder,
                      //     filled: true,
                      //     fillColor: ThemeConstants.lightblueColor,
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide.none,
                      //       borderRadius: BorderRadius.circular(15.0),
                      //     ),
                      //   ),
                      //   style: saveAndEdit
                      //       ? ThemeConstants
                      //           .montserrattextstyleForFilledTextEnableEdit
                      //       : ThemeConstants.montserrattextstyleForFilledText,
                      //   // onChanged: (value) {
                      //   //   if (controller.firstNameKey.currentState!
                      //   //       .validate()) {
                      //   //     controller.firstNameKey.currentState!.save();
                      //   //   }
                      //   // },
                      //   validator: (value) {
                      //     if (value == "") {
                      //       return "Please enter First Name";
                      //     } else {
                      //       return null;
                      //     }
                      //   },
                      // ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Last Name",
                          mandatory: true,
                          textColor: ThemeConstants.TextColor,
                          fontSize: SizeConfig.fontLabelSize,
                          fontWeight: SizeConfig.fontLabelWeight,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: CustomTextField(
                        hint: "Enter your Last Name",
                        controller: ContactInformationController.lastName,
                        validator: Validator.notEmpty,
                        readOrEdit: saveAndEdit,
                      ),
                      // child: TextFormField(
                      //   autovalidateMode: AutovalidateMode.onUserInteraction,
                      //
                      //   controller: ContactInformationController.lastName,
                      //   scrollPadding: EdgeInsets.only(
                      //       bottom:
                      //           MediaQuery.of(context).viewInsets.bottom + 40),
                      //   readOnly: saveAndEdit,
                      //   decoration: InputDecoration(
                      //     hintText: "Enter your Last Name",
                      //     filled: true,
                      //     fillColor: ThemeConstants.lightblueColor,
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide.none,
                      //       borderRadius: BorderRadius.circular(15.0),
                      //     ),
                      //   ),
                      //   style: saveAndEdit
                      //       ? ThemeConstants
                      //           .montserrattextstyleForFilledTextEnableEdit
                      //       : ThemeConstants.montserrattextstyleForFilledText,
                      //   // onChanged: (value) {
                      //   //   if (controller.lastNameKey.currentState!.validate()) {
                      //   //     controller.lastNameKey.currentState!.save();
                      //   //   }
                      //   // },
                      //   validator: (value) {
                      //     if (value == "") {
                      //       return "Please enter Last Name";
                      //     } else {
                      //       return null;
                      //     }
                      //   },
                      // ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Date of Birth",
                          mandatory: true,
                          textColor: ThemeConstants.TextColor,
                          fontSize: SizeConfig.fontLabelSize,
                          fontWeight: SizeConfig.fontLabelWeight,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IgnorePointer(
                      ignoring: saveAndEdit,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: SizedBox(
                          height: 40,
                          child: CustomTimerWidget(
                            isBlank: true,
                            initialTime: controller.dob,
                            // enableField: saveAndEdit,
                            // date: getNUllChecker(controller.dob) == false
                            //     ? controller.dob
                            //     : "",
                            callback: callbackDOB,
                          ),
                        ),
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
                          textColor: ThemeConstants.TextColor,
                          fontSize: SizeConfig.fontLabelSize,
                          fontWeight: SizeConfig.fontLabelWeight,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomDropDownSingle(
                      selectedValue: controller.genderSelected,
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
                          textColor: ThemeConstants.TextColor,
                          fontSize: SizeConfig.fontLabelSize,
                          fontWeight: SizeConfig.fontLabelWeight,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomDropDownSingle(
                      selectedValue: controller.maritalStatusSelected,
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
                            textColor: ThemeConstants.TextColor,
                            fontSize: SizeConfig.fontLabelSize,
                            fontWeight: SizeConfig.fontLabelWeight,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    if (controller.maritalStatusIdSelected == 1 ||
                        controller.maritalStatusIdSelected == 3)
                      CustomDropDownSingle(
                        selectedValue:
                            controller.childrenCountSelected.toString(),
                        model: const ['0', "1", "2", "3", "4"],
                        callbackFunction: callbackChildrenCount,
                        initialSelectedValue:
                            controller.childrenCountSelected != null
                                ? controller.childrenCountSelected.toString()
                                : "0",
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
                          textColor: ThemeConstants.TextColor,
                          fontSize: SizeConfig.fontLabelSize,
                          fontWeight: SizeConfig.fontLabelWeight,
                          // fontWeight: FontWeight.bold,
                          //textColor: ThemeConstants.TextColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: CustomTextField(
                        hint: "Mobile Number",
                        controller: ContactInformationController.mobileNumber,
                        validator: Validator.phone,
                        keybord: TextInputType.phone,
                        readOrEdit: true,
                      ),
                      // child: TextFormField(
                      //   autovalidateMode: AutovalidateMode.onUserInteraction,
                      //
                      //   controller: ContactInformationController.mobileNumber,
                      //   keyboardType: TextInputType.number,
                      //   scrollPadding: EdgeInsets.only(
                      //       bottom:
                      //           MediaQuery.of(context).viewInsets.bottom + 40),
                      //   readOnly: true,
                      //   decoration: InputDecoration(
                      //     hintText: "Mobile Number",
                      //     filled: true,
                      //     fillColor: ThemeConstants.lightblueColor,
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide.none,
                      //       borderRadius: BorderRadius.circular(15.0),
                      //     ),
                      //   ),
                      //   style: saveAndEdit
                      //       ? ThemeConstants
                      //           .montserrattextstyleForFilledTextEnableEdit
                      //       : ThemeConstants.montserrattextstyleForFilledText,
                      //   // onChanged: (value) {
                      //   //   // RenderObject? object =
                      //   //   //     globalKey.currentContext!.findRenderObject();
                      //   //   // object!.showOnScreen();
                      //   //   if (controller.mobileNameKey.currentState!
                      //   //       .validate()) {
                      //   //     controller.mobileNameKey.currentState!.save();
                      //   //   }
                      //   // },
                      //   validator: (value) {
                      //     return getPhoneNumbervalidation(value);
                      //   },
                      // ),
                    ),

                    Row(children: [
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
                        width: tabOrLand == true
                            ? 150
                            : MediaQuery.sizeOf(context).width * 0.6,
                        child: CustomAutoSizeTextMontserrat(
                          maxLines: 5,
                          text: "This number is Whatsapp number",
                          //textColor: ThemeConstants.TextColor,
                          textColor: ThemeConstants.TextColor,
                          fontSize: SizeConfig.fontLabelSize,
                          fontWeight: SizeConfig.fontLabelWeight,
                        ),
                      ),
                    ]),

                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Whatsapp Number",
                          textColor: ThemeConstants.TextColor,
                          fontSize: SizeConfig.fontLabelSize,
                          fontWeight: SizeConfig.fontLabelWeight,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: CustomTextField(
                        hint: "Enter your Whatsapp Number",
                        controller: ContactInformationController.whatsappNumber,
                        keybord: TextInputType.phone,
                        readOrEdit: saveAndEdit,
                      ),
                      // child: TextFormField(
                      //   autovalidateMode: AutovalidateMode.onUserInteraction,
                      //
                      //   controller: ContactInformationController.whatsappNumber,
                      //   keyboardType: TextInputType.number,
                      //   scrollPadding: EdgeInsets.only(
                      //       bottom:
                      //           MediaQuery.of(context).viewInsets.bottom + 40),
                      //   readOnly: saveAndEdit,
                      //   decoration: InputDecoration(
                      //     hintText: "Enter your Whatsapp Number",
                      //     filled: true,
                      //     fillColor: ThemeConstants.lightblueColor,
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide.none,
                      //       borderRadius: BorderRadius.circular(15.0),
                      //     ),
                      //   ),
                      //   style: saveAndEdit
                      //       ? ThemeConstants
                      //           .montserrattextstyleForFilledTextEnableEdit
                      //       : ThemeConstants.montserrattextstyleForFilledText,
                      //   // onChanged: (value) {
                      //   //   if (controller.whatsappNumberkey.currentState!
                      //   //       .validate()) {
                      //   //     controller.whatsappNumberkey.currentState!.save();
                      //   //   }
                      //   // },
                      //   validator: (value) {
                      //     return getPhoneNumbervalidation(value);
                      //   },
                      // ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Alternate Number",
                          textColor: ThemeConstants.TextColor,
                          fontSize: SizeConfig.fontLabelSize,
                          fontWeight: SizeConfig.fontLabelWeight,
                          // mandatory: true,

                          // fontWeight: FontWeight.bold,
                          //textColor: ThemeConstants.TextColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: CustomTextField(
                        hint: "Alternate Number",
                        controller: ContactInformationController.alt_Number,
                        keybord: TextInputType.phone,
                        validator: Validator.phone,
                        readOrEdit: saveAndEdit,
                      ),
                      // child: TextFormField(
                      //   autovalidateMode: AutovalidateMode.onUserInteraction,
                      //
                      //   controller: ContactInformationController.alt_Number,
                      //   keyboardType: TextInputType.number,
                      //   scrollPadding: EdgeInsets.only(
                      //       bottom:
                      //           MediaQuery.of(context).viewInsets.bottom + 40),
                      //   readOnly: saveAndEdit,
                      //   decoration: InputDecoration(
                      //     hintText: "Alternate Number",
                      //     filled: true,
                      //     fillColor: ThemeConstants.lightblueColor,
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide.none,
                      //       borderRadius: BorderRadius.circular(15.0),
                      //     ),
                      //   ),
                      //   style: saveAndEdit
                      //       ? ThemeConstants
                      //           .montserrattextstyleForFilledTextEnableEdit
                      //       : ThemeConstants.montserrattextstyleForFilledText,
                      //   // onChanged: (value) {
                      //   //   if (controller.alternateNumberKey.currentState!
                      //   //       .validate()) {
                      //   //     controller.alternateNumberKey.currentState!.save();
                      //   //   }
                      //   // },
                      //   validator: (value) {
                      //     return getPhoneNumbervalidation(value);
                      //   },
                      // ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Email",
                          textColor: ThemeConstants.TextColor,
                          fontSize: SizeConfig.fontLabelSize,
                          fontWeight: SizeConfig.fontLabelWeight,
                          mandatory: true,
                          //textColor: ThemeConstants.TextColor,

                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: CustomTextField(
                        hint: "Enter your email",
                        controller: ContactInformationController.email,
                        validator: Validator.email,
                        keybord: TextInputType.emailAddress,
                        readOrEdit: saveAndEdit,
                      ),
                      // child: TextFormField(
                      //   autovalidateMode: AutovalidateMode.onUserInteraction,
                      //   controller: ContactInformationController.email,
                      //   scrollPadding: EdgeInsets.only(
                      //       bottom:
                      //           MediaQuery.of(context).viewInsets.bottom + 40),
                      //   readOnly: saveAndEdit,
                      //   decoration: InputDecoration(
                      //     hintText: "Enter your email",
                      //     filled: true,
                      //     fillColor: ThemeConstants.lightblueColor,
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide.none,
                      //       borderRadius: BorderRadius.circular(15.0),
                      //     ),
                      //   ),
                      //   style: saveAndEdit
                      //       ? ThemeConstants
                      //           .montserrattextstyleForFilledTextEnableEdit
                      //       : ThemeConstants.montserrattextstyleForFilledText,
                      //   // onChanged: (value) {
                      //   //   if (controller.emailKey.currentState!.validate()) {
                      //   //     controller.emailKey.currentState!.save();
                      //   //   }
                      //   // },
                      //   validator: (value) {
                      //     return getEmailvaliation(value);
                      //   },
                      // ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Secondary Email",
                          textColor: ThemeConstants.TextColor,
                          fontSize: SizeConfig.fontLabelSize,
                          fontWeight: SizeConfig.fontLabelWeight,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: CustomTextField(
                        hint: "Enter your Secondary Email",
                        controller: ContactInformationController.secondaryEmail,
                        readOrEdit: saveAndEdit,
                        keybord: TextInputType.emailAddress,
                      ),
                      // child: TextFormField(
                      //   autovalidateMode: AutovalidateMode.onUserInteraction,
                      //
                      //   controller: ContactInformationController.secondaryEmail,
                      //   scrollPadding: EdgeInsets.only(
                      //       bottom:
                      //           MediaQuery.of(context).viewInsets.bottom + 40),
                      //   readOnly: saveAndEdit,
                      //   decoration: InputDecoration(
                      //     hintText: "Enter your Secondary Email",
                      //     filled: true,
                      //     fillColor: ThemeConstants.lightblueColor,
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide.none,
                      //       borderRadius: BorderRadius.circular(15.0),
                      //     ),
                      //   ),
                      //   style: saveAndEdit
                      //       ? ThemeConstants
                      //           .montserrattextstyleForFilledTextEnableEdit
                      //       : ThemeConstants.montserrattextstyleForFilledText,
                      //   // onChanged: (value) {
                      //   //   if (controller.secondaryemailKey.currentState!
                      //   //       .validate()) {
                      //   //     controller.secondaryemailKey.currentState!.save();
                      //   //   }
                      //   // },
                      //   validator: (value) {
                      //     return getEmailvaliation(value);
                      //   },
                      // ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Zip Code",
                          textColor: ThemeConstants.TextColor,
                          fontSize: SizeConfig.fontLabelSize,
                          fontWeight: SizeConfig.fontLabelWeight,
                          mandatory: true,
                          //textColor: ThemeConstants.TextColor,

                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: CustomTextField(
                        hint: "Enter your Zip Code",
                        controller: ContactInformationController.zipCode,
                        validator: Validator.notEmpty,
                        keybord: TextInputType.number,
                        readOrEdit: saveAndEdit,
                      ),
                      // child: TextFormField(
                      //   autovalidateMode: AutovalidateMode.onUserInteraction,
                      //
                      //   controller: ContactInformationController.zipCode,
                      //   keyboardType: TextInputType.number,
                      //   scrollPadding: EdgeInsets.only(
                      //       bottom:
                      //           MediaQuery.of(context).viewInsets.bottom + 40),
                      //   readOnly: saveAndEdit,
                      //   decoration: InputDecoration(
                      //     hintText: "Enter your Zip Code",
                      //     filled: true,
                      //     fillColor: ThemeConstants.lightblueColor,
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide.none,
                      //       borderRadius: BorderRadius.circular(15.0),
                      //     ),
                      //   ),
                      //   style: saveAndEdit
                      //       ? ThemeConstants
                      //           .montserrattextstyleForFilledTextEnableEdit
                      //       : ThemeConstants.montserrattextstyleForFilledText,
                      //   // onChanged: (value) {
                      //   //   if (controller.zipcodekey.currentState!.validate()) {
                      //   //     controller.zipcodekey.currentState!.save();
                      //   //   }
                      //   // },
                      //   onFieldSubmitted: (Value) {
                      //     controller.idsFromZipCode(int.parse(Value));
                      //   },
                      //   validator: (value) {
                      //     if (value == "") {
                      //       return "Please enter Zip code";
                      //     } else {
                      //       return null;
                      //     }
                      //   },
                      // ),
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
                          textColor: ThemeConstants.TextColor,
                          fontSize: SizeConfig.fontLabelSize,
                          fontWeight: SizeConfig.fontLabelWeight,
                          mandatory: true,
                          //textColor: ThemeConstants.TextColor,

                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomDropDownSingle(
                      selectedValue: controller.countrySelected,
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
                          textColor: ThemeConstants.TextColor,
                          fontSize: SizeConfig.fontLabelSize,
                          fontWeight: SizeConfig.fontLabelWeight,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomDropDownSingle(
                      selectedValue: controller.stateSelected,
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
                          textColor: ThemeConstants.TextColor,
                          fontSize: SizeConfig.fontLabelSize,
                          fontWeight: SizeConfig.fontLabelWeight,
                          mandatory: true,
                          //textColor: ThemeConstants.TextColor,

                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomDropDownSingle(
                      selectedValue: controller.citySelected,
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
                          textColor: ThemeConstants.TextColor,
                          fontSize: SizeConfig.fontLabelSize,
                          fontWeight: SizeConfig.fontLabelWeight,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: CustomTextField(
                        hint: "Enter your Street",
                        controller: ContactInformationController.street,
                        readOrEdit: saveAndEdit,
                      ),
                      // child: TextFormField(
                      //   autovalidateMode: AutovalidateMode.onUserInteraction,
                      //
                      //   controller: ContactInformationController.street,
                      //   scrollPadding: EdgeInsets.only(
                      //       bottom:
                      //           MediaQuery.of(context).viewInsets.bottom + 40),
                      //   readOnly: saveAndEdit,
                      //   decoration: InputDecoration(
                      //     hintText: "Enter your Street",
                      //     filled: true,
                      //     fillColor: ThemeConstants.lightblueColor,
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide.none,
                      //       borderRadius: BorderRadius.circular(15.0),
                      //     ),
                      //   ),
                      //   style: saveAndEdit
                      //       ? ThemeConstants
                      //           .montserrattextstyleForFilledTextEnableEdit
                      //       : ThemeConstants.montserrattextstyleForFilledText,
                      //   //   if (controller.streetkey.currentState!.validate()) {
                      //   //     controller.streetkey.currentState!.save();
                      //   //   }
                      //   // },
                      //   validator: (value) {
                      //     if (value == "") {
                      //       return "Please enter street";
                      //     } else {
                      //       return null;
                      //     }
                      //   },
                      // ),
                    ),
                    CheckboxListTile(
                      title: CustomAutoSizeTextMontserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          textColor: ThemeConstants.TextColor,
                          text: "Are you available on Social Media"),
                      value: controller.socialMedia,
                      onChanged: (newValue) {
                        setState(() {
                          controller.socialMedia = newValue!;
                          controller.update();
                        });
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                    if (controller.socialMedia == true)
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 20, right: 10),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: CustomAutoSizeTextMontserrat(
                            text: "Instagram Id",

                            fontWeight: SizeConfig.fontLabelWeight,
                            textColor: ThemeConstants.TextColor,

                            //textColor: ThemeConstants.TextColor,
                            fontSize: SizeConfig.fontLabelSize,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    if (controller.socialMedia == true)
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: CustomTextField(
                          hint: "Enter your Instagram Id",
                          controller: ContactInformationController.instagramId,
                          readOrEdit: saveAndEdit,
                        ),
                        // child: TextFormField(
                        //   autovalidateMode: AutovalidateMode.onUserInteraction,
                        //
                        //   controller: ContactInformationController.instagramId,
                        //   scrollPadding: EdgeInsets.only(
                        //       bottom: MediaQuery.of(context).viewInsets.bottom +
                        //           40),
                        //   readOnly: saveAndEdit,
                        //   decoration: InputDecoration(
                        //     hintText: "Enter your Instagram Id",
                        //     filled: true,
                        //     fillColor: ThemeConstants.lightblueColor,
                        //     border: OutlineInputBorder(
                        //       borderSide: BorderSide.none,
                        //       borderRadius: BorderRadius.circular(15.0),
                        //     ),
                        //   ),
                        //   style: saveAndEdit
                        //       ? ThemeConstants
                        //           .montserrattextstyleForFilledTextEnableEdit
                        //       : ThemeConstants.montserrattextstyleForFilledText,
                        //   // onChanged: (value) {
                        //   //   if (controller.instragramkey.currentState!
                        //   //       .validate()) {
                        //   //     controller.instragramkey.currentState!.save();
                        //   //   }
                        //   // },
                        //   validator: (value) {
                        //     if (value == "") {
                        //       return "Please enter Instagram";
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        // ),
                      ),
                    if (controller.socialMedia == true)
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 20, right: 10),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: CustomAutoSizeTextMontserrat(
                            text: "Facebook Id",
                            fontWeight: SizeConfig.fontLabelWeight,
                            textColor: ThemeConstants.TextColor,
                            //textColor: ThemeConstants.TextColor,
                            fontSize: SizeConfig.fontLabelSize,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    if (controller.socialMedia == true)
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: CustomTextField(
                          hint: "Enter your Facebook Id",
                          controller: ContactInformationController.facebookId,
                          readOrEdit: saveAndEdit,
                        ),
                        // child: TextFormField(
                        //   autovalidateMode: AutovalidateMode.onUserInteraction,
                        //
                        //   controller: ContactInformationController.facebookId,
                        //   scrollPadding: EdgeInsets.only(
                        //       bottom: MediaQuery.of(context).viewInsets.bottom +
                        //           40),
                        //   readOnly: saveAndEdit,
                        //   decoration: InputDecoration(
                        //     hintText: "Enter your Facebook Id",
                        //     filled: true,
                        //     fillColor: ThemeConstants.lightblueColor,
                        //     border: OutlineInputBorder(
                        //       borderSide: BorderSide.none,
                        //       borderRadius: BorderRadius.circular(15.0),
                        //     ),
                        //   ),
                        //   style: saveAndEdit
                        //       ? ThemeConstants
                        //           .montserrattextstyleForFilledTextEnableEdit
                        //       : ThemeConstants.montserrattextstyleForFilledText,
                        //   // onChanged: (value) {
                        //   //   if (controller.facebookkey.currentState!
                        //   //       .validate()) {
                        //   //     controller.facebookkey.currentState!.save();
                        //   //   }
                        //   // },
                        //   validator: (value) {
                        //     if (value == "") {
                        //       return "Please enter Facebook";
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        // ),
                      ),
                    if (controller.socialMedia == true)
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 20, right: 10),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: CustomAutoSizeTextMontserrat(
                            text: "Snapchat Id",
                            fontWeight: SizeConfig.fontLabelWeight,
                            textColor: ThemeConstants.TextColor,
                            //textColor: ThemeConstants.TextColor,
                            fontSize: SizeConfig.fontLabelSize,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    if (controller.socialMedia == true)
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: CustomTextField(
                          hint: "Enter your Snapchat Id",
                          controller: ContactInformationController.snapchatId,
                          readOrEdit: saveAndEdit,
                        ),
                        // child: TextFormField(
                        //   autovalidateMode: AutovalidateMode.onUserInteraction,
                        //
                        //   controller: ContactInformationController.snapchatId,
                        //   scrollPadding: EdgeInsets.only(
                        //       bottom: MediaQuery.of(context).viewInsets.bottom +
                        //           40),
                        //   readOnly: saveAndEdit,
                        //   decoration: InputDecoration(
                        //     hintText: "Enter your Snapchat Id",
                        //     filled: true,
                        //     fillColor: ThemeConstants.lightblueColor,
                        //     border: OutlineInputBorder(
                        //       borderSide: BorderSide.none,
                        //       borderRadius: BorderRadius.circular(15.0),
                        //     ),
                        //   ),
                        //   style: saveAndEdit
                        //       ? ThemeConstants
                        //           .montserrattextstyleForFilledTextEnableEdit
                        //       : ThemeConstants.montserrattextstyleForFilledText,
                        //   // onChanged: (value) {
                        //   //   if (controller.firstNameKey.currentState!
                        //   //       .validate()) {
                        //   //     controller.firstNameKey.currentState!.save();
                        //   //   }
                        //   // },
                        //   validator: (value) {
                        //     if (value == "") {
                        //       return "Please enter snapchat";
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        // ),
                      ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Assigned Advisors",
                          textColor: ThemeConstants.TextColor,
                          fontSize: SizeConfig.fontLabelSize,
                          fontWeight: SizeConfig.fontLabelWeight,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: CustomTextField(
                        hint: ContactInformationController
                            .assignedAdvisors.text,
                        controller: ContactInformationController
                        .assignedAdvisors,
                        readOrEdit: true,
                      ),
                      // child: TextField(
                      //   onTap: () {
                      //     getToast("Auto Selected");
                      //   },
                      //   scrollPadding: EdgeInsets.symmetric(
                      //       vertical:
                      //           MediaQuery.of(context).viewInsets.bottom + 30),
                      //   readOnly: true,
                      //   decoration: InputDecoration(
                      //     hintStyle: saveAndEdit
                      //         ? ThemeConstants
                      //             .montserrattextstyleForFilledTextEnableEdit
                      //         : ThemeConstants.montserrattextstyleForFilledText,
                      //     hintText: ContactInformationController
                      //         .assignedAdvisors.text,
                      //     filled: true,
                      //     fillColor: ThemeConstants.lightblueColor,
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide.none,
                      //       borderRadius: BorderRadius.circular(15.0),
                      //     ),
                      //   ),
                      //   style: saveAndEdit
                      //       ? ThemeConstants
                      //           .montserrattextstyleForFilledTextEnableEdit
                      //       : ThemeConstants.montserrattextstyleForFilledText,
                      // ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Assigned Branch",
                          textColor: ThemeConstants.TextColor,
                          fontSize: SizeConfig.fontLabelSize,
                          fontWeight: SizeConfig.fontLabelWeight,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: CustomTextField(
                        hint: controller.assignedBranch.text,
                        controller: controller.assignedBranch,
                        readOrEdit: true,
                      ),
                      // child: TextField(
                      //   onTap: () {
                      //     getToast("Auto Selected");
                      //   },
                      //   scrollPadding: EdgeInsets.symmetric(
                      //       vertical:
                      //           MediaQuery.of(context).viewInsets.bottom + 30),
                      //   readOnly: true,
                      //   decoration: InputDecoration(
                      //     hintStyle: saveAndEdit
                      //         ? ThemeConstants
                      //             .montserrattextstyleForFilledTextEnableEdit
                      //         : ThemeConstants.montserrattextstyleForFilledText,
                      //     hintText: controller.assignedBranch.text,
                      //     filled: true,
                      //     fillColor: ThemeConstants.lightblueColor,
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide.none,
                      //       borderRadius: BorderRadius.circular(15.0),
                      //     ),
                      //   ),
                      //   style: saveAndEdit
                      //       ? ThemeConstants
                      //           .montserrattextstyleForFilledTextEnableEdit
                      //       : ThemeConstants.montserrattextstyleForFilledText,
                      // ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Service",
                          textColor: ThemeConstants.TextColor,
                          fontSize: SizeConfig.fontLabelSize,
                          fontWeight: SizeConfig.fontLabelWeight,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: CustomTextField(
                        hint: ContactInformationController.service.text,
                        controller: ContactInformationController.service,
                        readOrEdit: true,
                      ),
                      // child: TextField(
                      //   onTap: () {
                      //     getToast("Auto Selected");
                      //   },
                      //   scrollPadding: EdgeInsets.symmetric(
                      //       vertical:
                      //           MediaQuery.of(context).viewInsets.bottom + 30),
                      //   readOnly: true,
                      //   decoration: InputDecoration(
                      //     hintStyle: saveAndEdit
                      //         ? ThemeConstants
                      //             .montserrattextstyleForFilledTextEnableEdit
                      //         : ThemeConstants.montserrattextstyleForFilledText,
                      //     hintText: ContactInformationController.service.text,
                      //     filled: true,
                      //     fillColor: ThemeConstants.lightblueColor,
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide.none,
                      //       borderRadius: BorderRadius.circular(15.0),
                      //     ),
                      //   ),
                      //   style: saveAndEdit
                      //       ? ThemeConstants
                      //           .montserrattextstyleForFilledTextEnableEdit
                      //       : ThemeConstants.montserrattextstyleForFilledText,
                      // ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "First Country of Interest",
                          textColor: ThemeConstants.TextColor,
                          fontSize: SizeConfig.fontLabelSize,
                          fontWeight: SizeConfig.fontLabelWeight,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: CustomTextField(
                        hint: ContactInformationController
                            .firstCountryInterest.text,
                        controller: ContactInformationController
                            .firstCountryInterest,
                        readOrEdit: true,
                      ),
                      // child: TextField(
                      //   onTap: () {
                      //     getToast("Auto Selected");
                      //   },
                      //   scrollPadding: EdgeInsets.symmetric(
                      //       vertical:
                      //           MediaQuery.of(context).viewInsets.bottom + 30),
                      //   readOnly: true,
                      //   decoration: InputDecoration(
                      //     hintStyle: saveAndEdit
                      //         ? ThemeConstants
                      //             .montserrattextstyleForFilledTextEnableEdit
                      //         : ThemeConstants.montserrattextstyleForFilledText,
                      //     hintText: ContactInformationController
                      //         .firstCountryInterest.text,
                      //     filled: true,
                      //     fillColor: ThemeConstants.lightblueColor,
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide.none,
                      //       borderRadius: BorderRadius.circular(15.0),
                      //     ),
                      //   ),
                      //   style: saveAndEdit
                      //       ? ThemeConstants
                      //           .montserrattextstyleForFilledTextEnableEdit
                      //       : ThemeConstants.montserrattextstyleForFilledText,
                      // ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Other country interested",
                          textColor: ThemeConstants.TextColor,
                          fontSize: SizeConfig.fontLabelSize,
                          fontWeight: SizeConfig.fontLabelWeight,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: CustomTextField(
                        hint: ContactInformationController
                            .otherCountryinterested.text,
                        controller:ContactInformationController
                            .otherCountryinterested,
                        readOrEdit: true,
                      ),
                      // child: TextField(
                      //   onTap: () {
                      //     getToast("Auto Selected");
                      //   },
                      //   // controller: otherCountryinterested,
                      //   scrollPadding: EdgeInsets.symmetric(
                      //       vertical:
                      //           MediaQuery.of(context).viewInsets.bottom + 30),
                      //   readOnly: true,
                      //   decoration: InputDecoration(
                      //     hintStyle: saveAndEdit
                      //         ? ThemeConstants
                      //             .montserrattextstyleForFilledTextEnableEdit
                      //         : ThemeConstants.montserrattextstyleForFilledText,
                      //     hintText: ContactInformationController
                      //         .otherCountryinterested.text,
                      //     filled: true,
                      //     fillColor: ThemeConstants.lightblueColor,
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide.none,
                      //       borderRadius: BorderRadius.circular(15.0),
                      //     ),
                      //   ),
                      //   style: saveAndEdit
                      //       ? ThemeConstants
                      //           .montserrattextstyleForFilledTextEnableEdit
                      //       : ThemeConstants.montserrattextstyleForFilledText,
                      // ),
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
          controller.getCity(controller.stateCode[i]);
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
        controller.genderIdSelected = i;
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

    if (controller.maritalStatusIdSelected == 2) {
      controller.childrenCountSelected = 0;
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
    // String temp = data.toString().split(' ')[0];
    // List<String> date = temp.split('-');
    // controller.dob = date[0] + "-" + date[1] + '-' + date[2];
    controller.dob = data;

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
