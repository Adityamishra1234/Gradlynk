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
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: ThemeConstants.whitecolor,
                borderRadius: BorderRadius.circular(20)),
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 35),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: ThemeConstants.yellow,
                      borderRadius: BorderRadius.circular(20)),
                  width: 200,
                  height: 30,
                  child: CustomAutoSizeTextMontserrat(
                    text: 'Welcome to Gradlynk',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  child: CustomAutoSizeTextMontserrat(
                    text: 'Create a New Account',
                    textColor: ThemeConstants.blackcolor,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    textalingCentre: true,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/images/registerBgImage.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150), //will change here(16th april 2024)
            child: RegisterationFormWidget(),
          ),
        ]),
      ),
    );
  }
}
