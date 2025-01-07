import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:studentpanel/new_widgets/custom_text.dart';
import 'package:studentpanel/new_widgets/multiselect_dropdown.dart';
import 'package:studentpanel/ui/new_screens/authentication/login_screen.dart';
import 'package:studentpanel/utils/theme.dart';

import '../../../new_widgets/app_text_field.dart';
import '../../../new_widgets/custom_button.dart';
import '../../../new_widgets/text_fields.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  static const routeNamed = '/RegistrationScreen';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  GlobalKey<FormState> key = GlobalKey();

  int currentStep = 0;
  List<String> background = [
    "assets/images/white_bg.png",
    "assets/images/registration_bg2.png",
    "assets/images/registration_bg3.png",
    "assets/images/white_bg.png"
  ];
  List<Widget> pages = [
    const Fragment1(),
    const Fragment2(),
    const Fragment3(),
    const Fragment4()
  ];

  void incrementCounter() {
    if (currentStep < 3) {
      setState(() {
        currentStep++;
      });

    }
  }

  void decrementCounter() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
    }
  }

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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                background[currentStep],
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: BackButton(
                  color: currentStep == 2
                      ? ThemeConstants.yellowColor
                      : ThemeConstants.greenColor,
                  onPressed: () {
                    if (currentStep == 0) {
                      Get.back();
                    } else {
                      decrementCounter();
                    }
                  },
                ),

              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(
                    begin: 0.0,
                    end: (currentStep) / 4, // Convert step to percentage
                  ),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  builder: (context, value, child) {
                    return Container(
                      height: 10,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ThemeConstants.progressBar.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          FractionallySizedBox(
                            widthFactor: value,
                            child: Container(
                              decoration: BoxDecoration(
                                color: ThemeConstants.progressBar,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Flexible(
                child: pages[currentStep],

              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: CustomButton3(
                  borderColor: ThemeConstants.blackcolor,
                  text: currentStep == 3 ? "Submit" : "Next",
                  height: 50,
                  onTap: incrementCounter,
                  containerColor: currentStep == 2
                      ? ThemeConstants.yellowColor
                      : ThemeConstants.greenColor,
                  buttonTextSize: 16,
                  fw: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}


class Fragment1 extends StatefulWidget {
  const Fragment1({super.key});

  @override
  State<Fragment1> createState() => _Fragment1State();
}

class _Fragment1State extends State<Fragment1> {
  GlobalKey<FormState> key = GlobalKey();
  List<String> gender = [
    "Male",
    "Female",
    "Others",
  ];

  TextEditingController firstNameController = TextEditingController(),
      lastNameController = TextEditingController(),
      mobileNoController = TextEditingController(),
      emailIdController = TextEditingController();

  dynamic selectedGender;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Form(
        key: key,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              Text('Create your account',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textScaler: TextScaler.noScaling,
                  style: buttonStyleOpenSans(
                      ThemeConstants.greenColor, FontWeight.w700, 32)),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      "Already have an Account? ",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textScaler: TextScaler.noScaling,
                      style: buttonStyleOpenSans(
                          ThemeConstants.blackcolor, FontWeight.w400, 16),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.offNamed(LoginScreen.routeNamed);
                    },
                    child: Text('Login',
                        overflow: TextOverflow.ellipsis,
                        textScaler: TextScaler.noScaling,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: ThemeConstants.greenColor,
                            decoration: TextDecoration.underline,
                            decorationColor: ThemeConstants.greenColor,
                            decorationThickness: 2)),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              AppTextField(
                borderColor: ThemeConstants.greenColor,
                controller: firstNameController,
                mandatory: true,
                title: "First Name",
                keyboardType: TextInputType.name,
                borderRadius: 10,
                hint: "Enter First Name",
                validator: Validator.notEmpty,
                icon: Icon(
                  Icons.person_2_outlined,
                  color: ThemeConstants.blackcolor,
                  size: 25,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              AppTextField(
                borderColor: ThemeConstants.greenColor,
                controller: lastNameController,
                title: "Last Name",
                mandatory: false,
                keyboardType: TextInputType.name,
                borderRadius: 10,
                hint: "Enter Last Name",
                validator: Validator.notEmpty,
                icon: Icon(
                  Icons.person_2_outlined,
                  color: ThemeConstants.blackcolor,
                  size: 25,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              AppTextField(
                borderColor: ThemeConstants.greenColor,
                controller: mobileNoController,
                mandatory: true,
                title: "Mobile Number",
                keyboardType: TextInputType.phone,
                borderRadius: 10,
                hint: "Enter Mobile Number",
                validator: Validator.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                icon: Icon(
                  Icons.phone,
                  color: ThemeConstants.blackcolor,
                  size: 25,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              AppTextField(
                borderColor: ThemeConstants.greenColor,
                controller: emailIdController,
                title: "Email Id",
                mandatory: true,
                keyboardType: TextInputType.emailAddress,
                borderRadius: 10,
                hint: "Enter Email Id",
                validator: Validator.email,
                icon: Icon(
                  Icons.email_outlined,
                  color: ThemeConstants.blackcolor,
                  size: 25,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomMandatoryText(
                text: 'Gender',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 55,
                    width: width - 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: gender.length,
                      itemBuilder: (context, index) {
                        return customChip(index);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  customChip(index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedGender = gender[index];
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Chip(
            backgroundColor: ThemeConstants.whitecolor,
            elevation: 1.5,
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: BorderSide(
                    color: selectedGender == gender[index]
                        ? ThemeConstants.greenColor
                        : ThemeConstants.TextColor,
                    width: selectedGender == gender[index] ? 2 : 1)),
            label: SizedBox(
              width: MediaQuery.of(context).size.width / 4.7,
              child: Text(
                textAlign: TextAlign.center,
                gender[index],
                overflow: TextOverflow.ellipsis,
                textScaler: TextScaler.noScaling,
                style: buttonStyleOpenSans(
                    ThemeConstants.blackcolor, FontWeight.w500, 16),
              ),
            )),
      ),
    );
  }
}

class Fragment2 extends StatefulWidget {
  const Fragment2({super.key});

  @override
  State<Fragment2> createState() => _Fragment2State();
}

class _Fragment2State extends State<Fragment2> {
  GlobalKey<FormState> key = GlobalKey();
  List<String> serviceIcon = [
    "assets/images/service_icon1.png",
    "assets/images/service_icon2.png",
    "assets/images/service_icon3.png",
    "assets/images/service_icon4.png",
  ];
  List<String> iconText = [
    "Course & University",
    "Test Prep",
    "Visa",
    "Migration",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              CustomMandatoryText(
                text: 'What all services are you interested in?',
                maxLines: 3,
                fontSize: 32,
                fontWeight: FontWeight.w700,
                textColor: ThemeConstants.greenColor,
                textAlignCentre: true,
                mandatory: true,
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: height / 2.4,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0.0,
                      crossAxisSpacing: 0.0,
                      childAspectRatio: 1),
                  itemCount: serviceIcon.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ThemeConstants.whitecolor),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            serviceIcon[index],
                            scale: 1.2,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(iconText[index],
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              textScaler: TextScaler.noScaling,
                              style: buttonStyleOpenSans(
                                  ThemeConstants.blackcolor,
                                  FontWeight.w600,
                                  16)),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Fragment3 extends StatefulWidget {
  const Fragment3({super.key});

  @override
  State<Fragment3> createState() => _Fragment3State();
}

class _Fragment3State extends State<Fragment3> {
  GlobalKey<FormState> key = GlobalKey();
  List<String> serviceIcon = [
    "assets/images/service_icon1.png",
    "assets/images/service_icon2.png",
    "assets/images/service_icon3.png",
    "assets/images/service_icon4.png",
    "assets/images/service_icon1.png",
    "assets/images/service_icon2.png",
    "assets/images/service_icon3.png",
    "assets/images/service_icon4.png",
  ];
  List<String> iconText = [
    "Course & University",
    "Test Prep",
    "Visa",
    "Migration",
    "Course & University",
    "Test Prep",
    "Visa",
    "Migration",
  ];
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose(); // Dispose to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              CustomMandatoryText(
                text: 'What all services are you interested in?',
                maxLines: 3,
                fontSize: 32,
                fontWeight: FontWeight.w700,
                textColor: ThemeConstants.whitecolor,
                textAlignCentre: true,
                mandatory: true,
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: height / 2,
                child: RawScrollbar(
                  controller: scrollController,
                  trackColor: ThemeConstants.whitecolor.withOpacity(0.5),
                  thumbVisibility: true,
                  thickness: 8,
                  thumbColor: ThemeConstants.whitecolor,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  trackVisibility: true,
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    controller: scrollController,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 0.0,
                            crossAxisSpacing: 0.0,
                            childAspectRatio: 1.2),
                    itemCount: serviceIcon.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ThemeConstants.whitecolor),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              serviceIcon[index],
                              scale: 1.2,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Flexible(
                              child: Text(iconText[index],
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  textScaler: TextScaler.noScaling,
                                  style: buttonStyleOpenSans(
                                      ThemeConstants.blackcolor,
                                      FontWeight.w600,
                                      16)),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Fragment4 extends StatefulWidget {
  const Fragment4({super.key});

  @override
  State<Fragment4> createState() => _Fragment4State();
}

class _Fragment4State extends State<Fragment4> {
  GlobalKey<FormState> key = GlobalKey();
  List<String> iconText = [
    "Course & University",
    "Test Prep",
    "Visa",
    "Migrationa",
    "Course & Universit",
    "Test Pre",
    "Vis",
    "Migratio",
  ];
  TextEditingController overallPercentageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Form(
        key: key,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              CustomMandatoryText(
                text: 'Please fill your personal details',
                maxLines: 3,
                fontSize: 32,
                fontWeight: FontWeight.w700,
                textColor: ThemeConstants.greenColor,
                textAlignCentre: true,
                mandatory: true,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomMandatoryText(
                text: 'Your home country',
                maxLines: 3,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                textColor: ThemeConstants.blackcolor,
                mandatory: true,
              ),
              Container(
                  height: 44,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.5),
                      border: Border.all(color: ThemeConstants.TextColor)),
                  child: DropdownWithMultiselect(
                    spinnerHintText: "Select Country",
                    searchHintText: "Search Country",
                    values: iconText,
                    isMultiSelect: true,
                    onMultiSelectChanged: (value) {
                      setState(() {});
                    },
                  )),
              const SizedBox(
                height: 10,
              ),
              CustomMandatoryText(
                text: 'Your highest education level',
                maxLines: 3,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                textColor: ThemeConstants.blackcolor,
                mandatory: true,
              ),
              Container(
                  height: 44,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.5),
                      border: Border.all(color: ThemeConstants.TextColor)),
                  child: DropdownWithMultiselect(
                    spinnerHintText: "Select education",
                    searchHintText: "Search education",
                    values: iconText,
                    isMultiSelect: true,
                    onMultiSelectChanged: (value) {
                      setState(() {});
                    },
                  )),
              const SizedBox(
                height: 10,
              ),
              AppTextField(
                borderColor: ThemeConstants.greenColor,
                controller: overallPercentageController,
                title: "Your Overall Percentage",
                keyboardType: TextInputType.number,
                borderRadius: 10,
                hint: "Enter Overall Percentage",
                validator: Validator.notEmpty,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomMandatoryText(
                text: 'Which tests taken or planned?',
                maxLines: 3,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                textColor: ThemeConstants.blackcolor,
                mandatory: true,
              ),
              Container(
                  height: 44,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.5),
                      border: Border.all(color: ThemeConstants.TextColor)),
                  child: DropdownWithMultiselect(
                    spinnerHintText: "Select Test",
                    searchHintText: "Search Test",
                    values: iconText,
                    isMultiSelect: true,
                    onMultiSelectChanged: (value) {
                      setState(() {});
                    },
                  )),
              const SizedBox(
                height: 10,
              ),
              CustomMandatoryText(
                text: 'Which major do you want to pursue?',
                maxLines: 3,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                textColor: ThemeConstants.blackcolor,
              ),
              Container(
                  height: 44,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.5),
                      border: Border.all(color: ThemeConstants.TextColor)),
                  child: DropdownWithMultiselect(
                    spinnerHintText: "Select One",
                    searchHintText: "Search",
                    values: iconText,
                    isMultiSelect: true,
                    onMultiSelectChanged: (value) {
                      setState(() {});
                    },
                  )),
              const SizedBox(
                height: 10,
              ),
              CustomMandatoryText(
                text: 'How did you find us?',
                maxLines: 3,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                textColor: ThemeConstants.blackcolor,
              ),
              Container(
                  height: 44,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.5),
                      border: Border.all(color: ThemeConstants.TextColor)),
                  child: DropdownWithMultiselect(
                    spinnerHintText: "Select One",
                    searchHintText: "Search",
                    values: iconText,
                    isMultiSelect: true,
                    onMultiSelectChanged: (value) {
                      setState(() {});
                    },
                  )),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
