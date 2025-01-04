import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nice_loading_button/nice_loading_button.dart';
import 'package:pinput/pinput.dart';
// import 'package:studentpanel/ui/screen/login%20copy.dart';
// import 'package:studentpanel/ui/screen/login.dart';
import 'package:studentpanel/ui/screen/registeration/registeration_controller.dart';
import 'package:studentpanel/utils/constants.dart';
// import 'package:studentpanel/utils/constants/registerationINputDecoration.dart';
// import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/Custom%20Dropdown/custom_dropdown.dart';
import 'package:studentpanel/widgets/customRichTextWidget.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
// import 'package:studentpanel/widgets/custombutton.dart';
// import 'package:studentpanel/widgets/customdropdownprofilepage.dart';
import 'package:studentpanel/widgets/customtextfield.dart';

class RegisterationFormWidget extends StatefulWidget {
  RegisterationFormWidget({super.key});

  @override
  State<RegisterationFormWidget> createState() =>
      _RegisterationFormWidgetState();
}

class _RegisterationFormWidgetState extends State<RegisterationFormWidget> {
  var controller = Get.put(RegisterationCopntroller());
  final FocusNode _focusNode = FocusNode();

  TextEditingController otpcontroller = TextEditingController();

  String? otpCode;

  final defaultPinTheme = PinTheme(
    width: 58,
    height: 58,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(0, 0, 0, 0.827),
    ),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(255, 255, 255, 0.349),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: const Color.fromRGBO(32, 32, 32, 0.345)),
    ),
  );

  @override
  void initState() {
    controller.initialized;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        onLoading: getLoading(context),
        (state) => Container(
              constraints: const BoxConstraints(maxHeight: 500, minHeight: 300),
              // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(41, 0, 0, 0),
                        blurRadius: 4,
                        spreadRadius: 2)
                  ],
                  color: ThemeConstants.whitecolor,
                  borderRadius: BorderRadius.circular(20)),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (controller.showOtp == false) ...[
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              alignment: Alignment.topLeft,
                              child: CustomAutoSizeTextMontserrat(
                                mandatory: true,
                                text: 'Name',
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 7),
                              child: CustomTextField(
                                key: const Key('registration_name_field'),
                                fieldFontWeight: FontWeight.w400,
                                hintFontWeight: FontWeight.w500,
                                borderRadius: 10,
                                hint: '',
                                backgroundCOlour:
                                    ThemeConstants.ultraLightgreyColor2,
                                validator: Validator.notEmpty,
                                controller: controller.nameController,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // SizedBox(
                            //   height: 40,
                            //   child: TextFormField(
                            //     decoration: CustomInputDecoration.textFieldStyle(
                            //         labelTextStr: 'Phone Number'),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 40,
                            //   child: TextFormField(
                            //     decoration: CustomInputDecoration.textFieldStyle(
                            //         labelTextStr: 'Phone Number'),
                            //   ),
                            // ),
                          ],
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            alignment: Alignment.topLeft,
                            child: CustomAutoSizeTextMontserrat(
                              text: 'Phone Number',
                              mandatory: true,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: CustomTextField(
                              key: const Key('registration_phoneNumber_field'),
                              fieldFontWeight: FontWeight.w400,
                              borderRadius: 10,
                              hint: '',
                              readOrEdit: controller.showOtp,
                              validator: Validator.phone,
                              controller: controller.phoneNumberController,
                              // decoration: CustomInputDecoration.textFieldStyle(
                              //     labelTextStr: 'Phone Number'),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          if (controller.showOtp == false) ...[
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              alignment: Alignment.topLeft,
                              child: CustomAutoSizeTextMontserrat(
                                text: 'Email',
                                mandatory: true,
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 7),
                              child: CustomTextField(
                                key: const Key('registration_email_field'),
                                fieldFontWeight: FontWeight.w400,
                                borderRadius: 10,
                                backgroundCOlour:
                                    ThemeConstants.ultraLightgreyColor2,

                                // validator: (value) {
                                //   return getEmailvaliation(value);
                                // },
                                hint: '',
                                validator: Validator.email,
                                controller: controller.emailIdController,
                                // decoration: CustomInputDecoration.textFieldStyle(
                                //     labelTextStr: 'Email ID'),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              alignment: Alignment.topLeft,
                              child: CustomAutoSizeTextMontserrat(
                                text: 'Nearest Siec Branch',
                                mandatory: true,
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                                child: CustomDropDownSingle(
                              key: const Key('registration_siec_branch'),
                              selectedValue: controller.selectedBranchName,
                              bgColor: ThemeConstants.ultraLightgreyColor2,
                              model: controller.branchListName,
                              choosefieldtype: false,
                              initialSelectedValue: controller.selectedBranchName,
                              callbackFunction: callBackSelectedBranch,
                            )),

                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              alignment: Alignment.topLeft,
                              child: CustomAutoSizeTextMontserrat(
                                mandatory: true,
                                text: 'Target Service',
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                                child: CustomDropDownSingle(
                              selectedValue: controller.selectedTargetSericeName,
                              key: const Key('registration_target_service'),
                              bgColor: ThemeConstants.ultraLightgreyColor2,
                              model: controller.targetServiceNameList,
                              choosefieldtype: false,
                              initialSelectedValue:
                                  controller.selectedTargetSericeName,
                              callbackFunction: callBackSelectedTargetService,
                            )),

                            if (controller.selectedTargetServiceId == '3') ...[
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                alignment: Alignment.topLeft,
                                child: CustomAutoSizeTextMontserrat(
                                  mandatory: true,
                                  text: 'Target Test',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                  child: CustomDropDownSingle(
                                selectedValue:
                                    controller.selectedTargetServiceSubName,
                                key: const Key('registration_target_test'),
                                bgColor: ThemeConstants.ultraLightgreyColor2,
                                model: controller.subServiceDropDownListName,
                                choosefieldtype: false,
                                initialSelectedValue:
                                    controller.selectedTargetServiceSubName,
                                callbackFunction:
                                    callBackSubSelectedTargetService,
                              )),
                              // SizedBox(
                            ],
                            //   child: TextFormField(
                            //     validator: (value) {
                            //       return getEmptyValidation(value);
                            //     },
                            //     controller: controller.targetDestinationController,
                            //     decoration: CustomInputDecoration.textFieldStyle(
                            //         labelTextStr: 'Target Destination'),
                            //   ),
                            // ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              alignment: Alignment.topLeft,
                              child: CustomAutoSizeTextMontserrat(
                                mandatory: true,
                                text: 'Target Destination',
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                                child: CustomDropDownSingle(
                              selectedValue: controller.selectedCountryName,
                              key: const Key('registration_target_destination'),
                              bgColor: ThemeConstants.ultraLightgreyColor2,
                              model: controller.countryListName,
                              choosefieldtype: false,
                              initialSelectedValue:
                                  controller.selectedCountryName,
                              callbackFunction: callBackSelectedDestination,
                            )),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              alignment: Alignment.topLeft,
                              child: CustomAutoSizeTextMontserrat(
                                mandatory: true,
                                text: 'How did you hear about us?',
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                                child: CustomDropDownSingle(
                              selectedValue: controller.selectedLeadSourcesName,
                              key: const Key('registration_hear_about_us'),
                              bgColor: ThemeConstants.ultraLightgreyColor2,
                              model: controller.leadSourcesListName,
                              choosefieldtype: false,
                              initialSelectedValue:
                                  controller.selectedLeadSourcesName,
                              callbackFunction: callBackSelectedLeadSource,
                            )),
                            // SizedBox(
                            //   child: TextFormField(
                            //     controller: controller.nearestSiecBranch,
                            //     validator: (value) {
                            //       return getEmptyValidation(value);
                            //     },
                            //     decoration: CustomInputDecoration.textFieldStyle(
                            //         labelTextStr: 'Nearest SIEC Branch'),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            // SizedBox(
                            //   child: TextFormField(
                            //     controller: controller.howDidYouHearAboutUsController,
                            //     validator: (value) {
                            //       return getEmptyValidation(value);
                            //     },
                            //     decoration: CustomInputDecoration.textFieldStyle(
                            //         labelTextStr: 'How did you hear about us?'),
                            //   ),
                            // ),
                            // CustomTextField(hint: '', controller: controller.nameController),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: CustomAutoSizeTextMontserrat(
                            //     text: 'Phone Number',
                            //     fontWeight: FontWeight.w500,
                            //   ),
                            // ),
                            // CustomTextField(hint: '', controller: controller.nameController),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: CustomAutoSizeTextMontserrat(
                            //     text: 'Email ID',
                            //     fontWeight: FontWeight.w500,
                            //   ),
                            // ),
                            // CustomTextField(hint: '', controller: controller.nameController),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: CustomAutoSizeTextMontserrat(
                            //     text: 'Target Destination',
                            //     fontWeight: FontWeight.w500,
                            //   ),
                            // ),
                            // CustomTextField(hint: '', controller: controller.nameController),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: CustomAutoSizeTextMontserrat(
                            //     text: 'How did you hear about us?',
                            //     fontWeight: FontWeight.w500,
                            //   ),
                            // ),
                            // CustomTextField(hint: '', controller: controller.nameController),

                            const SizedBox(
                              height: 20,
                            ),
                            LoadingButton(
                              animate: true,
                              loader: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: SizedBox(
                                  // padding: EdgeInsets.all(10),
                                  width: 40,
                                  height: 40,
                                  child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white)),
                                ),
                              ),
                              borderRadius: 10,
                              color: ThemeConstants.bluecolor,
                              onTap:
                                  (startLoading, stopLoading, buttonState) async {
                                // if( b )

                                if (buttonState == ButtonState.idle) {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    // controller.buttonClickEnabled = false;
                                    print('object');
                                    controller.update();
                                    startLoading();

                                    if (controller.selectedTargetServiceId ==
                                        '0') {
                                      getToast('Please Select Target Service');
                                    } else if (controller
                                                .selectedTargetServiceId ==
                                            '3' &&
                                        controller.selectedTargetServiceSubId ==
                                            '0') {
                                      getToast('Please Select Target Test');
                                    } else if (controller.selectedBranchCode ==
                                        "") {
                                      getToast('Please Select Branch');
                                    } else if (controller.selectedCountryID ==
                                        "") {
                                      getToast('Please Select Country');
                                    } else if (controller
                                            .selectedLeadSourcesCode ==
                                        "") {
                                      getToast(
                                          'Please select how you heard about us');
                                    } else {
                                      print('ee');
                                      var res = await controller.regsiter();

                                      // if (res == true) {
                                      //   signature();
                                      // }
                                    }
                                    // controller.buttonClickEnabled = true;
                                    stopLoading();
                                    controller.update();
                                    // Get.toNamed(LoginCopy.routeNamed);
                                  }
                                }
                              },
                              height: 30,
                              width: 200,
                              child: CustomAutoSizeTextMontserrat(
                                  textColor: ThemeConstants.whitecolor,
                                  text: "Get OTP"),
                            ),
                            // CustomButton(
                            //     backgroundColor: ThemeConstants.bluecolor,
                            //     horizontelPadding: 20,
                            //     radius: 8,
                            //     text: 'Get OTP',
                            //     onPressed: () async {
                            //       print('object');
                            //       if (controller.formKey.currentState!.validate()) {
                            //         if (controller.selectedBranchCode == null) {
                            //           return getToast('Please Select Branch');
                            //         } else if (controller.selectedCountryID == null) {
                            //           return getToast('Please Select Country');
                            //         } else if (controller.leadSourcesListID == null) {
                            //           return getToast('Please select leadsource');
                            //         }
                            //         var res = await controller.regsiter();

                            //         if (res == true) {
                            //           signature();
                            //         }
                            //         // Get.toNamed(LoginCopy.routeNamed);
                            //       }
                            //     }),
                          ],
                          if (controller.showOtp == true) ...[
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Pinput(
                                length: 6,
                                controller: otpcontroller,
                                focusNode: _focusNode,

                                androidSmsAutofillMethod:
                                    AndroidSmsAutofillMethod.smsUserConsentApi,
                                listenForMultipleSmsOnAndroid: true,
                                // defaultPinTheme: defaultPinTheme,
                                separatorBuilder: (index) =>
                                    const SizedBox(width: 8),
                                // validator: (value) {
                                //   return value == '2222'
                                //       ? null
                                //       : 'Pin is incorrect';
                                // },
                                // onClipboardFound: (value) {
                                //   debugPrint('onClipboardFound: $value');
                                //   pinController.setText(value);
                                // },
                                hapticFeedbackType:
                                    HapticFeedbackType.lightImpact,
                                onCompleted: (pin) {
                                  debugPrint('onCompleted: $pin');
                                },
                                onChanged: (value) {
                                  debugPrint('onChanged: $value');
                                },
                                cursor: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 9),
                                      width: 22,
                                      height: 1,
                                      // color: focusedBorderColor,
                                    ),
                                  ],
                                ),
                                defaultPinTheme: defaultPinTheme,
                                // focusedPinTheme:
                                //     defaultPinTheme.copyWith(
                                //         decoration: BoxDecoration(
                                //   borderRadius:
                                //       BorderRadius.circular(8),
                                //   border: Border.all(
                                //       color: ThemeConstants.whitecolor),
                                // )),
                                // submittedPinTheme:
                                //     defaultPinTheme.copyWith(
                                //   decoration: defaultPinTheme
                                //       .decoration!
                                //       .copyWith(
                                //     color: ThemeConstants.whitecolor,
                                //     borderRadius:
                                //         BorderRadius.circular(19),
                                //     border: Border.all(
                                //         color:
                                //             ThemeConstants.whitecolor),
                                //   ),
                                // ),
                                // errorPinTheme:
                                //     defaultPinTheme.copyBorderWith(
                                //   border: Border.all(
                                //       color: Colors.redAccent),
                                // ),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //       top: 20, left: 10, right: 10),
                            //   child: TextFormField(
                            //       autovalidateMode:
                            //           AutovalidateMode.onUserInteraction,
                            //       controller: otpcontroller,
                            //       keyboardType: TextInputType.number,
                            //       inputFormatters: [
                            //         FilteringTextInputFormatter.digitsOnly
                            //       ],
                            //       decoration:
                            //           CustomInputDecoration.textFieldStyle(
                            //               labelTextStr: 'OTP'),
                            //       validator: (value) {
                            //         if (value != null) {
                            //           if (value.length != 6) {
                            //             return SnackBarConstants.OTPError;
                            //           }
                            //         }
                            //         return null;
                            //       }),
                            // ),
                            const SizedBox(
                              height: 10,
                            ),
                            // InkWell(
                            //   onTap: () {
                            //     controller.startResend();
                            //   },
                            //   child: Container(
                            //     padding: EdgeInsets.only(left: 15),
                            //     alignment: Alignment.bottomLeft,
                            //     child: CustomAutoSizeTextMontserrat(
                            //       fontWeight: FontWeight.w500,
                            //       fontSize: 8,
                            //       text: 'Resend OTP',
                            //       textColor: ThemeConstants.bluecolor,
                            //     ),
                            //   ),
                            // ),
                            Obx(
                              () => GestureDetector(
                                onTap: () {
                                  if (controller.resendOTP == 1) {
                                    controller.startResend();
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: Container(
                                    width: double.infinity,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      controller.timer.value == 0 ? 'Resend OTP' : 'Resend OTP in ${controller.timer.value} sec',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: controller.resendOTP == 1
                                              ? FontWeight.w500
                                              : FontWeight.bold,
                                          color: controller.resendOTP == 1
                                              ? ThemeConstants.GreenColor
                                              : ThemeConstants.TextColor),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            LoadingButton(
                              animate: true,
                              loader: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: SizedBox(
                                  // padding: EdgeInsets.all(10),
                                  width: 40,
                                  height: 40,
                                  child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white)),
                                ),
                              ),
                              borderRadius: 10,
                              color: ThemeConstants.bluecolor,
                              onTap:
                                  (startLoading, stopLoading, buttonState) async {
                                // if( b )

                                print('object');
                                if (controller.formKey.currentState!.validate() &&
                                    controller.buttonClickEnabled) {
                                  startLoading();
                                  controller.buttonClickEnabled = false;
                                  controller.update();

                                  await controller.verifyOtp(otpcontroller.text);
                                  controller.buttonClickEnabled = true;
                                  controller.update();
                                  stopLoading();
                                  // Get.toNamed(LoginCopy.routeNamed);
                                }
                              },
                              height: 30,
                              width: 200,
                              child: CustomAutoSizeTextMontserrat(
                                  textColor: ThemeConstants.whitecolor,
                                  text: "Verify OTP"),
                            ),
                            // CustomButton(
                            //     backgroundColor: ThemeConstants.bluecolor,
                            //     horizontelPadding: 10,
                            //     radius: 8,
                            //     text: 'Verify OTP',
                            //     onPressed: () async {
                            //       print('object');
                            //       if (controller.formKey.currentState!
                            //               .validate() &&
                            //           controller.buttonClickEnabled == true) {
                            //         // if (controller.selectedBranchCode == null) {
                            //         //   return getToast('Please Select Branch');
                            //         // } else if (controller.selectedCountryID == null) {
                            //         //   return getToast('Please Select Country');
                            //         // } else if (controller.leadSourcesListID == null) {
                            //         //   return getToast('Please select leadsource');
                            //         // }
                            //         // var res = await controller.regsiter();

                            //         // if (res == true) {
                            //         //   signature();
                            //         // }
                            //         controller.verifyOtp(otpcontroller.text);
                            //         // Get.toNamed(LoginCopy.routeNamed);
                            //       }
                            //     }),
                          ],
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: CustomRichTextWidget(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              text: ' Login now',
                              text1: 'Already have Account?',
                            ),
                          )
                        ]),
                  ),
                ),
              ),
            ));
  }

  callBackSelectedDestination(data) {
    for (var i = 0; i < controller.countryListName.length; i++) {
      if (i == 0) {
        controller.selectedCountryName = null;
        controller.selectedCountryID = '';
      } else {
        if (controller.countryListName[i] == data) {
          controller.selectedCountryName = data;
          controller.selectedCountryID = controller.countryListID[i].toString();

          // controller.getCareerOutComes();
        }
      }
    }
    controller.update();
  }

  callBackSubSelectedTargetService(data) {
    for (var i = 0; i < controller.subServiceDropDownListName.length; i++) {
      if (controller.subServiceDropDownListName[i] == data) {
        controller.selectedTargetServiceSubName = data;
        controller.selectedTargetServiceSubId =
            controller.subServiceDropDownListCode[i].toString();

        // controller.getCareerOutComes();
      }
    }
    controller.update();
  }

  callBackSelectedTargetService(data) {
    for (var i = 0; i < controller.targetServiceNameList.length; i++) {
      if (i == 0) {
        controller.selectedTargetSericeName = 'Kindly Select';
        controller.selectedTargetServiceId = '0';
      } else {
        if (controller.targetServiceNameList[i] == data) {
          controller.selectedTargetSericeName = data;
          controller.selectedTargetServiceId =
              controller.targetServiceCodeList[i].toString();

          // controller.getCareerOutComes();
        }
      }

      if (controller.selectedTargetServiceId != '3') {
        controller.selectedTargetServiceSubId = '0';
      }
    }
    controller.update();
  }

  callBackSelectedBranch(data) {
    for (var i = 0; i < controller.branchListName.length; i++) {
      if (i == 0) {
        controller.selectedBranchName = null;
        controller.selectedBranchCode = '';
      } else {
        if (controller.branchListName[i] == data) {
          controller.selectedBranchName = data;
          controller.selectedBranchCode = controller.branchListID[i];

          // controller.getCareerOutComes();
        }
      }
    }
    controller.update();
  }

  callBackSelectedLeadSource(data) {
    for (var i = 0; i < controller.leadSourcesListName.length; i++) {
      if (controller.leadSourcesListName[i] == data) {
        controller.selectedLeadSourcesName = data;
        controller.selectedLeadSourcesCode = controller.leadSourcesListID[i];

        // controller.getCareerOutComes();
      }
    }
    controller.update();
  }
}
