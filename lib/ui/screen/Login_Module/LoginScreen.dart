import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/logincontroller.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({super.key});
  static const routeNamed = '/LoginScreen';

  var controller = Get.put(LoginController());

  static TextEditingController phoneNumber = TextEditingController();
  static TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.obx(
            (state) => Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: Image.asset("assets/icons/login.png"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,

                            controller: phoneNumber,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0)),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: ThemeConstants
                                        .bluelightgreycolor), //<-- SEE HERE
                              ),
                              // focusedBorder: OutlineInputBorder(
                              //   borderRadius:
                              //       const BorderRadius.all(Radius.circular(15.0)),
                              //   borderSide: BorderSide(
                              //       width: 1,
                              //       color: ThemeConstants
                              //           .bluelightgreycolor), //<-- SEE HERE
                              // ),
                              // errorBorder: OutlineInputBorder(
                              //   borderRadius:
                              //       const BorderRadius.all(Radius.circular(15.0)),
                              //   borderSide: BorderSide(
                              //       width: 1,
                              //       color: ThemeConstants
                              //           .bluelightgreycolor), //<-- SEE HERE
                              // ),
                              // disabledBorder: OutlineInputBorder(
                              //   borderRadius:
                              //       const BorderRadius.all(Radius.circular(15.0)),
                              //   borderSide: BorderSide(
                              //       width: 1,
                              //       color: ThemeConstants
                              //           .bluelightgreycolor), //<-- SEE HERE
                              // )
                              hintText: "Phone number",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0)),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: ThemeConstants
                                        .bluelightgreycolor), //<-- SEE HERE
                              ),
                            ),
                            // onChanged: (value) {
                            //   if (phonenumber.currentState!.validate()) {
                            //     phonenumber.currentState!.save();
                            //   }
                            // },
                            validator: (value) {
                              return getPhoneNumbervalidation(value);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15),
                          child: TextFormField(
                            controller: password,
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0)),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: ThemeConstants
                                        .bluelightgreycolor), //<-- SEE HERE
                              ),
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: "Password",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0)),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: ThemeConstants
                                        .bluelightgreycolor), //<-- SEE HERE
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 55,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ThemeConstants.bluecolor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                                onPressed: () async {
                                  if (getNUllChecker(phoneNumber.text) ==
                                      true) {
                                    getToast(
                                        SnackBarConstants.phoneNumberError1!);
                                  } else if (getNUllChecker(password.text) ==
                                      true) {
                                    getToast(SnackBarConstants.passwordError!);
                                  } else {
                                    controller.login(
                                        phoneNumber.text, password.text);
                                  }
                                },
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Login",
                                  textColor: ThemeConstants.whitecolor,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            onLoading: getLoading(context)));
  }
}
