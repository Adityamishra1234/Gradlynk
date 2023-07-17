import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nice_loading_button/nice_loading_button.dart';
import 'package:studentpanel/ui/screen/login%20copy.dart';
import 'package:studentpanel/ui/screen/login.dart';
import 'package:studentpanel/ui/screen/registeration/registeration_controller.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/constants/registerationINputDecoration.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/Custom%20Dropdown/custom_dropdown.dart';
import 'package:studentpanel/widgets/customRichTextWidget.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/custombutton.dart';
import 'package:studentpanel/widgets/customdropdownprofilepage.dart';
import 'package:studentpanel/widgets/customtextfield.dart';

class RegisterationFormWidget extends StatefulWidget {
  RegisterationFormWidget({super.key});

  @override
  State<RegisterationFormWidget> createState() =>
      _RegisterationFormWidgetState();
}

class _RegisterationFormWidgetState extends State<RegisterationFormWidget> {
  var controller = Get.put(RegisterationCopntroller());

  TextEditingController otpcontroller = TextEditingController();

  String? otpCode;

  signature() async {
    // String? smsCode = await AndroidSmsRetriever.listenForOneTimeConsent(senderPhoneNumber: );

    otpCode = await AltSmsAutofill().listenForSms!;

    var d = otpCode!.split(' ');

    // print(match);

    // var d = int.parse();

    otpcontroller.text = d[8];

    setState(() {});
    // print('otpCode)');

    // print(odtpCode);
    // await SmsAutoFill().getAppSignature.then((signature) {
    //   setState(() {
    //     appSignature = signature;
    //   });
    // });

    // await SmsAutoFill().listenForCode();
    // print(appSignature);
  }

  void initState() {
    controller.initialized;
    super.initState();
    // _focusNode.addListener(_onFocusChange);
    // MobileNumber.listenPhonePermission((isPermissionGranted) {
    //   if (isPermissionGranted) {
    //     // initMobileNumberState();
    //   } else {}
    // });

    // _checkVersion();
  }

  @override
  void dispose() {
    AltSmsAutofill().unregisterListener();
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        onLoading: getLoading(context),
        (state) => Container(
              // elevation: 5,

              constraints: BoxConstraints(maxHeight: 500, minHeight: 300),

              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                padding: EdgeInsets.only(top: 10),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: CustomAutoSizeTextMontserrat(
                        //     text: 'Name',
                        //     fontWeight: FontWeight.w500,
                        //   ),
                        // ),

                        if (controller.showOtp == false) ...[
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            alignment: Alignment.topLeft,
                            child: CustomAutoSizeTextMontserrat(
                              mandatory: true,
                              text: 'Name',
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 7),
                            child: CustomTextField(
                              fieldFontWeight: FontWeight.w400,
                              hintFontWeight: FontWeight.w500,
                              borderRadius: 10,

                              hint: '',
                              backgroundCOlour:
                                  ThemeConstants.ultraLightgreyColor2,
                              validator: Validator.notEmpty,
                              // autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: controller.nameController,
                              // decoration: CustomInputDecoration.textFieldStyle(
                              //     labelTextStr: 'Name'),
                            ),
                          ),
                          SizedBox(
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
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.topLeft,
                          child: CustomAutoSizeTextMontserrat(
                            text: 'Phone Number',
                            mandatory: true,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 7),
                          child: CustomTextField(
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
                            padding: EdgeInsets.only(left: 10),
                            alignment: Alignment.topLeft,
                            child: CustomAutoSizeTextMontserrat(
                              text: 'Email',
                              mandatory: true,
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 7),
                            child: CustomTextField(
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
                            padding: EdgeInsets.only(left: 10),
                            alignment: Alignment.topLeft,
                            child: CustomAutoSizeTextMontserrat(
                              text: 'Nearest Siec Branch',
                              mandatory: true,
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                              child: CustomDropDownSingle(
                            bgColor: ThemeConstants.ultraLightgreyColor2,
                            model: controller.branchListName,
                            choosefieldtype: false,
                            initialSelectedValue: controller.selectedBranchName,
                            callbackFunction: callBackSelectedBranch,
                          )),

                          SizedBox(
                            height: 20,
                          ),
                          // SizedBox(

                          //   child: TextFormField(
                          //     validator: (value) {
                          //       return getEmptyValidation(value);
                          //     },
                          //     controller: controller.targetDestinationController,
                          //     decoration: CustomInputDecoration.textFieldStyle(
                          //         labelTextStr: 'Target Destination'),
                          //   ),
                          // ),

                          Container(
                            padding: EdgeInsets.only(left: 10),
                            alignment: Alignment.topLeft,
                            child: CustomAutoSizeTextMontserrat(
                              mandatory: true,
                              text: 'Target Destination',
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                              child: CustomDropDownSingle(
                            bgColor: ThemeConstants.ultraLightgreyColor2,
                            model: controller.countryListName,
                            choosefieldtype: false,
                            initialSelectedValue:
                                controller.selectedCountryName,
                            callbackFunction: callBackSelectedDestination,
                          )),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            alignment: Alignment.topLeft,
                            child: CustomAutoSizeTextMontserrat(
                              mandatory: true,
                              text: 'How did you hear about us?',
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                              child: CustomDropDownSingle(
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

                          SizedBox(
                            height: 20,
                          ),
                          LoadingButton(
                            loader: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: ThemeConstants.whitecolor,
                              ),
                            ),
                            borderRadius: 10,
                            color: ThemeConstants.bluecolor,
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            onTap:
                                (startLoading, stopLoading, buttonState) async {
                              // if( b )

                              if (controller.formKey.currentState!.validate() &&
                                  controller.buttonClickEnabled == true) {
                                print('object');
                                controller.buttonClickEnabled = false;
                                controller.update();
                                startLoading();
                                if (controller.selectedBranchCode == "") {
                                  getToast('Please Select Branch');
                                } else if (controller.selectedCountryID == "") {
                                  getToast('Please Select Country');
                                } else if (controller.selectedLeadSourcesCode ==
                                    "") {
                                  getToast('Please select leadsource');
                                } else {
                                  await Future.delayed(Duration(seconds: 20));
                                  var res = await controller.regsiter();

                                  if (res == true) {
                                    signature();
                                  }
                                }
                                controller.buttonClickEnabled = true;
                                stopLoading();
                                controller.update();
                                // Get.toNamed(LoginCopy.routeNamed);
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
                            padding: const EdgeInsets.only(
                                top: 20, left: 10, right: 10),
                            child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: otpcontroller,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration:
                                    CustomInputDecoration.textFieldStyle(
                                        labelTextStr: 'OTP'),
                                validator: (value) {
                                  if (value != null) {
                                    if (value.length != 6) {
                                      return SnackBarConstants.OTPError;
                                    }
                                  }
                                  return null;
                                }),
                          ),
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
                                if (controller.resendOTP == 1)
                                  controller.startResend();
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    " ${controller.timer.value == 0 ? 'Resend OTP' : 'Wait for ${controller.timer.value}'}",
                                    style: TextStyle(
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
                            loader: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: ThemeConstants.whitecolor,
                              ),
                            ),
                            borderRadius: 10,
                            color: ThemeConstants.bluecolor,
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
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
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(LoginCopy.routeNamed);
                          },
                          child: CustomRichTextWidget(
                            fontWeight: FontWeight.w500,
                            fontSize: 8,
                            text: ' Login now',
                            text1: 'Already have Account?',
                          ),
                        )
                      ]),
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
      if (i == 0) {
        controller.selectedLeadSourcesName = null;
        controller.selectedLeadSourcesCode = '';
      } else {
        if (controller.leadSourcesListName[i] == data) {
          controller.selectedLeadSourcesName = data;
          controller.selectedLeadSourcesCode = controller.leadSourcesListID[i];

          // controller.getCareerOutComes();
        }
      }
    }
    controller.update();
  }
}
