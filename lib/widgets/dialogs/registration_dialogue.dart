import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/registeration/registeration_main_view.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/button/custom_button.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class RegistrationDialogue extends StatelessWidget {
  const RegistrationDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        contentPadding:
            const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 20),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      padding: EdgeInsets.all(0),
                      splashRadius: 10,
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.close,
                        size: 20,
                      ))
                ],
              ),
              CustomAutoSizeTextMontserrat(
                textalingCentre: true,
                text: 'No account linked with this number!',
                textColor: ThemeConstants.bluecolor,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButtonWidget(
                  borderColor: ThemeConstants.whitecolor,
                  textColor: ThemeConstants.whitecolor,
                  backgroundColor: ThemeConstants.bluecolor,
                  selectedColor: ThemeConstants.whitecolor,
                  onTap: () {
                    Get.toNamed(RegisterationMainView.routeNmaed);
                  },
                  text: 'Register now!'),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ));
  }
}
