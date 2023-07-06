import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/login%20copy.dart';
import 'package:studentpanel/ui/screen/login.dart';
import 'package:studentpanel/ui/screen/registeration/registeration_controller.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/constants/registerationINputDecoration.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customRichTextWidget.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/custombutton.dart';
import 'package:studentpanel/widgets/customdropdownprofilepage.dart';
import 'package:studentpanel/widgets/customtextfield.dart';

class RegisterationFormWidget extends StatelessWidget {
  RegisterationFormWidget({super.key});

  var controller = Get.put(RegisterationCopntroller());

  @override
  Widget build(BuildContext context) {
    return Container(
      // elevation: 5,

      height: 500,

      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
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
                Container(
                  child: TextFormField(
                    validator: (value) {
                      return getEmptyValidation(value);
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.nameController,
                    decoration: CustomInputDecoration.textFieldStyle(
                        labelTextStr: 'Name'),
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
                Container(
                  child: TextFormField(
                    validator: (value) {
                      return getPhoneNumbervalidation(value);
                    },
                    controller: controller.phoneNumberController,
                    decoration: CustomInputDecoration.textFieldStyle(
                        labelTextStr: 'Phone Number'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: TextFormField(
                    validator: (value) {
                      return getEmailvaliation(value);
                    },
                    controller: controller.emailIdController,
                    decoration: CustomInputDecoration.textFieldStyle(
                        labelTextStr: 'Email ID'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(child: CustomDropDownProfilePage()),
                SizedBox(
                  child: TextFormField(
                    validator: (value) {
                      return getEmptyValidation(value);
                    },
                    controller: controller.targetDestinationController,
                    decoration: CustomInputDecoration.textFieldStyle(
                        labelTextStr: 'Target Destination'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: TextFormField(
                    controller: controller.nearestSiecBranch,
                    validator: (value) {
                      return getEmptyValidation(value);
                    },
                    decoration: CustomInputDecoration.textFieldStyle(
                        labelTextStr: 'Nearest SIEC Branch'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: TextFormField(
                    controller: controller.howDidYouHearAboutUsController,
                    validator: (value) {
                      return getEmptyValidation(value);
                    },
                    decoration: CustomInputDecoration.textFieldStyle(
                        labelTextStr: 'How did you hear about us?'),
                  ),
                ),
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
                  height: 10,
                ),
                CustomButton(
                    backgroundColor: ThemeConstants.bluecolor,
                    horizontelPadding: 100,
                    radius: 8,
                    text: 'Register Now',
                    onPressed: () {
                      print('object');
                      if (controller.formKey.currentState!.validate()) {
                        Get.toNamed(LoginCopy.routeNamed);
                      }
                    }),

                InkWell(
                  onTap: () {},
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
    );
  }
}
