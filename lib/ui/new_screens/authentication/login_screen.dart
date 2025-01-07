import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:studentpanel/new_widgets/app_text_field.dart';
import 'package:studentpanel/new_widgets/custom_button.dart';
import 'package:studentpanel/ui/new_screens/authentication/registration_screen.dart';
import '../../../BlocData/Bloc/AuthBloc/login_bloc.dart';
import '../../../BlocData/Repositories/auth_repo/login_repo.dart';
import '../../../new_widgets/text_fields.dart';
import '../../../utils/theme.dart';
import 'otp_verification_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeNamed = '/LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc bloc;
  TextEditingController mobileController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNode);
      LoginBloc(context.read<LoginRepo>());
    });
  }
  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }



  GlobalKey<FormState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          alignment: Alignment.bottomCenter,
          width: width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/white_bg.png",
                  ),
                  fit: BoxFit.fill)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0,top: 10),
                child: BackButton(    color: ThemeConstants.greenColor,
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Form(
                    key: key,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Text('Login',
                              overflow: TextOverflow.ellipsis,
                              textScaler: TextScaler.noScaling,
                              style: buttonStyleOpenSans(
                                  ThemeConstants.greenColor, FontWeight.bold, 44)),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('Enter your Credentials to access your account',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textScaler: TextScaler.noScaling,
                              style: buttonStyleOpenSans(
                                  ThemeConstants.blackcolor, FontWeight.w400, 18)),
                          const SizedBox(
                            height: 50,
                          ),
                          AppTextField(
                            controller: mobileController,
                            mandatory: true,
                            title: "Mobile Number",focusNode: focusNode,
                            keyboardType: TextInputType.phone,
                            borderRadius: 10,
                            hint: "Enter Mobile Number",
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: Validator.phone,
                            icon: Icon(
                              Icons.call,
                              color: ThemeConstants.greenColor,
                              size: 25,
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          CustomButton3(
                            text: "Verify Number",
                            height: 50,
                            containerColor: ThemeConstants.greenColor,
                            buttonTextSize: 16,
                            fw: FontWeight.w500,
                            onTap: () {
                              Get.toNamed(OTPVerificationScreen.routeNamed);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  "Don't have an Account? ",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  textScaler: TextScaler.noScaling,
                                  style: buttonStyleOpenSans(
                                      ThemeConstants.blackcolor,
                                      FontWeight.w400,
                                      18),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.offNamed(RegistrationScreen.routeNamed);
                                },
                                child: Text('Register Now',
                                    overflow: TextOverflow.ellipsis,
                                    textScaler: TextScaler.noScaling,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: ThemeConstants.greenColor,
                                        decoration: TextDecoration.underline,
                                        decorationColor: ThemeConstants.greenColor,
                                        decorationThickness: 2)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
