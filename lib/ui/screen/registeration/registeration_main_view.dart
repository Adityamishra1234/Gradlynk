import 'package:flutter/material.dart';
import 'package:studentpanel/ui/screen/registeration/registeration_only_form_widget.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class RegisterationMainView extends StatelessWidget {
  static const routeNmaed = '/RegisterationMainView';
  const RegisterationMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        width: double.infinity,
        decoration: BoxDecoration(color: ThemeConstants.bluecolor),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: ThemeConstants.yellow,
                    borderRadius: BorderRadius.circular(20)),
                width: 200,
                height: 30,
                child: CustomAutoSizeTextMontserrat(
                  text: 'Welcome to Gradlynk',
                ),
              ),
              SizedBox(
                child: CustomAutoSizeTextMontserrat(
                  text: 'Create a New Account',
                  textColor: ThemeConstants.whitecolor,
                  fontSize: 45,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RegisterationFormWidget()
            ]),
      ),
    );
  }
}
