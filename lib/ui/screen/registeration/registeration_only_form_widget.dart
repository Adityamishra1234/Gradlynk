import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/registeration/registeration_controller.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/custombutton.dart';
import 'package:studentpanel/widgets/customtextfield.dart';

class RegisterationFormWidget extends StatelessWidget {
  RegisterationFormWidget({super.key});

  var controller = Get.put(RegisterationCopntroller());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ThemeConstants.whitecolor,
          borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomAutoSizeTextMontserrat(
                text: 'Name',
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomTextField(hint: '', controller: controller.nameController),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomAutoSizeTextMontserrat(
                text: 'Phone Number',
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomTextField(hint: '', controller: controller.nameController),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomAutoSizeTextMontserrat(
                text: 'Email ID',
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomTextField(hint: '', controller: controller.nameController),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomAutoSizeTextMontserrat(
                text: 'Target Destination',
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomTextField(hint: '', controller: controller.nameController),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomAutoSizeTextMontserrat(
                text: 'How did you hear about us?',
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomTextField(hint: '', controller: controller.nameController),
            SizedBox(
              height: 10,
            ),
            CustomButton(
                backgroundColor: ThemeConstants.bluecolor,
                horizontelPadding: 50,
                text: 'text',
                onPressed: () {})
          ]),
    );
  }
}
