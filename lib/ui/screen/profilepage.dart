import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/ui/controllers/profilepagecontroller.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/bottomnavigation.dart';
import 'package:studentpanel/widgets/customautosizetext.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customtab.dart';
import 'package:studentpanel/widgets/customtextfield.dart';
import 'package:container_tab_indicator/container_tab_indicator.dart' as tabbar;

enum BestTutorSite { Tentative, Definite }

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);
  static const routeNamed = '/ProfilePage';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late BestTutorSite _site = BestTutorSite.Tentative;
  List<Color> selectButton = [
    Color(0xFF1940BC),
    Color(0xFF6366F1),
  ];
  List<Color> unSelectButton = [
    Colors.transparent,
    Colors.transparent,
  ];

  var controller = Get.put(ProfilePageController());
  TextStyle getTextStyle(bool colorsChoose) {
    final TextStyle _textStyle = GoogleFonts.montserrat(
      fontWeight: FontWeight.w600,
      color: colorsChoose ? Colors.white : Colors.black,
      fontSize: 15,
    );
    return _textStyle;
  }

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return Scaffold(
      appBar: CustomAppBar("title"),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.85,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                color: Colors.white,
                height: 80,
                child: GetBuilder<ProfilePageController>(
                    init: ProfilePageController(),
                    builder: (controller) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                    height: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        gradient: LinearGradient(
                                          colors:
                                              controller.chooseIndex!.value == 0
                                                  ? selectButton
                                                  : unSelectButton,
                                          begin: FractionalOffset.centerLeft,
                                          end: FractionalOffset.centerRight,
                                        )),
                                    child: TextButton(
                                        onPressed: () {
                                          controller.getChooseIndex(0.obs);
                                        },
                                        child: Text(
                                          "Personal Info.",
                                          style: getTextStyle(
                                              controller.chooseIndex!.value ==
                                                  0),
                                        ))),
                              ),
                              Container(
                                  height: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      gradient: LinearGradient(
                                        colors:
                                            controller.chooseIndex!.value == 1
                                                ? selectButton
                                                : unSelectButton,
                                        begin: FractionalOffset.centerLeft,
                                        end: FractionalOffset.centerRight,
                                      )),
                                  child: TextButton(
                                      onPressed: () {
                                        controller.getChooseIndex(1.obs);
                                      },
                                      child: Text("Mandatory Info.",
                                          style: getTextStyle(
                                              controller.chooseIndex!.value ==
                                                  1)))),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                    height: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        gradient: LinearGradient(
                                          colors:
                                              controller.chooseIndex!.value == 2
                                                  ? selectButton
                                                  : unSelectButton,
                                          begin: FractionalOffset.centerLeft,
                                          end: FractionalOffset.centerRight,
                                        )),
                                    child: TextButton(
                                        onPressed: () {
                                          controller.getChooseIndex(2.obs);
                                        },
                                        child: Text("Test Details",
                                            style: getTextStyle(
                                                controller.chooseIndex!.value ==
                                                    2)))),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                    height: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        gradient: LinearGradient(
                                          colors:
                                              controller.chooseIndex!.value == 3
                                                  ? selectButton
                                                  : unSelectButton,
                                          begin: FractionalOffset.centerLeft,
                                          end: FractionalOffset.centerRight,
                                        )),
                                    child: TextButton(
                                        onPressed: () {
                                          controller.getChooseIndex(3.obs);
                                        },
                                        child: Text("Course Choose",
                                            style: getTextStyle(
                                                controller.chooseIndex!.value ==
                                                    3)))),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                    height: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        gradient: LinearGradient(
                                          colors:
                                              controller.chooseIndex!.value == 4
                                                  ? selectButton
                                                  : unSelectButton,
                                          begin: FractionalOffset.centerLeft,
                                          end: FractionalOffset.centerRight,
                                        )),
                                    child: TextButton(
                                        onPressed: () {
                                          controller.getChooseIndex(4.obs);
                                        },
                                        child: Text("Passport",
                                            style: getTextStyle(
                                                controller.chooseIndex!.value ==
                                                    4)))),
                              ),
                              const Spacer()
                            ],
                          )
                        ],
                      );
                    }),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                height: 5,
                thickness: 1,
              ),
            ),
            GetBuilder<ProfilePageController>(
                init: ProfilePageController(),
                builder: (controller) {
                  if (controller.chooseIndex!.value == 0) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height - 260,
                      child: ListView(
                        children: [
                          Container(
                            height: 76,
                            width: 76,
                            decoration: const BoxDecoration(
                                color: Colors.orange, shape: BoxShape.circle),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 5, right: 10),
                            child: Center(
                              child: CustomAutoSizeTextMontserrat(
                                text: "Nishant Bhardwaj",
                                maxLines: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 10, top: 10),
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Gender",
                                      maxLines: 1,
                                      textColor: Colors.grey,
                                    ),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    height: 40,
                                    width: 200,
                                    // custom Text field
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Male",
                                        maxLines: 1,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Divider(
                              height: 5,
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Email",
                                      maxLines: 1,
                                      textColor: Colors.grey,
                                    ),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    height: 40,
                                    width: 200,
                                    // custom Text field
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "nishan@gmail.com",
                                        maxLines: 1,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Divider(
                              height: 5,
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Mobile",
                                      maxLines: 1,
                                      textColor: Colors.grey,
                                    ),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    height: 40,
                                    width: 200,
                                    // custom Text field
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "9876543210",
                                        maxLines: 1,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Divider(
                              height: 5,
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Sec. Email",
                                      maxLines: 1,
                                      textColor: Colors.grey,
                                    ),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    height: 40,
                                    width: 200,
                                    // custom Text field
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "",
                                        maxLines: 1,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Divider(
                              height: 5,
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Marital Status",
                                      maxLines: 1,
                                      textColor: Colors.grey,
                                    ),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    height: 40,
                                    width: 200,
                                    // custom Text field
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Single",
                                        maxLines: 1,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Divider(
                              height: 5,
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Application Type",
                                      maxLines: 1,
                                      textColor: Colors.grey,
                                    ),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    height: 40,
                                    width: 200,
                                    // custom Text field
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Application",
                                        maxLines: 1,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Divider(
                              height: 5,
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Country",
                                      maxLines: 1,
                                      textColor: Colors.grey,
                                    ),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    height: 40,
                                    width: 200,
                                    // custom Text field
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "India",
                                        maxLines: 1,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Divider(
                              height: 5,
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "State",
                                      maxLines: 1,
                                      textColor: Colors.grey,
                                    ),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    height: 40,
                                    width: 200,
                                    // custom Text field
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Delhi",
                                        maxLines: 1,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Divider(
                              height: 5,
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Selected City",
                                      maxLines: 1,
                                      textColor: Colors.grey,
                                    ),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    height: 40,
                                    width: 200,
                                    // custom Text field
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Delhi",
                                        maxLines: 1,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Divider(
                              height: 5,
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Address(Passport)",
                                      maxLines: 1,
                                      textColor: Colors.grey,
                                    ),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    height: 40,
                                    width: 200,
                                    // custom Text field
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "",
                                        maxLines: 1,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Divider(
                              height: 5,
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Zip Code",
                                      maxLines: 1,
                                      textColor: Colors.grey,
                                    ),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    height: 40,
                                    width: 200,
                                    // custom Text field
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "",
                                        maxLines: 1,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Divider(
                              height: 5,
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Other Country Int.",
                                      maxLines: 1,
                                      textColor: Colors.grey,
                                    ),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    height: 40,
                                    width: 200,
                                    // custom Text field
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "",
                                        maxLines: 1,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (controller.chooseIndex!.value == 1) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 10, top: 30),
                          child: SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Branch Type",
                                    maxLines: 1,
                                    textColor: Colors.grey,
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                  height: 40,
                                  width: 200,
                                  // custom Text field
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Branch",
                                      maxLines: 1,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Divider(
                            height: 5,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 10,
                          ),
                          child: SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Branch Name",
                                    maxLines: 1,
                                    textColor: Colors.grey,
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                  height: 40,
                                  width: 200,
                                  // custom Text field
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Gurugram",
                                      maxLines: 1,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Divider(
                            height: 5,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 10,
                          ),
                          child: SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Service Name",
                                    maxLines: 1,
                                    textColor: Colors.grey,
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                  height: 40,
                                  width: 200,
                                  // custom Text field
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Student Visa",
                                      maxLines: 1,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Divider(
                            height: 5,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 10,
                          ),
                          child: SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "1st Country of Interest",
                                    maxLines: 1,
                                    textColor: Colors.grey,
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                  height: 40,
                                  width: 150,
                                  // custom Text field
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Gurugram",
                                      maxLines: 1,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Divider(
                            height: 5,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 10,
                          ),
                          child: SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Other Country of Interest",
                                    maxLines: 1,
                                    textColor: Colors.grey,
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                  height: 40,
                                  width: 150,
                                  // custom Text field
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Gurugram",
                                      maxLines: 1,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Divider(
                            height: 5,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 10,
                          ),
                          child: SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Decision Marker",
                                    maxLines: 1,
                                    textColor: Colors.grey,
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                  height: 40,
                                  width: 150,
                                  // custom Text field
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "",
                                      maxLines: 1,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Divider(
                            height: 5,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 10,
                          ),
                          child: SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Passport Available",
                                    maxLines: 1,
                                    textColor: Colors.grey,
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                  height: 40,
                                  width: 150,
                                  // custom Text field
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Yes",
                                      maxLines: 1,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Divider(
                            height: 5,
                            thickness: 1,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 60))
                      ],
                    );
                  } else if (controller.chooseIndex!.value == 2) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height - 220,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: CustomTab(),
                          ),
                          if (controller.englishTestDetail!.value == true)
                            SizedBox(
                              height: MediaQuery.of(context).size.height - 275,
                              width: MediaQuery.of(context).size.width,
                              child: ListView(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional.topStart,
                                    child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: CustomAutoSizeTextMontserrat(
                                          text: "Self",
                                          maxLines: 1,
                                          fontSize: 24,
                                          underline: true,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 10, top: 20),
                                    child: SizedBox(
                                      height: 40,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: CustomAutoSizeTextMontserrat(
                                              text: "Exam Status",
                                              maxLines: 1,
                                              textColor: Colors.grey,
                                            ),
                                          ),
                                          Spacer(),
                                          SizedBox(
                                            height: 40,
                                            width: 150,
                                            // custom Text field
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15),
                                              child:
                                                  CustomAutoSizeTextMontserrat(
                                                text: "Test Already Taken",
                                                maxLines: 1,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: Divider(
                                      height: 5,
                                      thickness: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 10,
                                    ),
                                    child: SizedBox(
                                      height: 40,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: CustomAutoSizeTextMontserrat(
                                              text: "Exam Name",
                                              maxLines: 1,
                                              textColor: Colors.grey,
                                            ),
                                          ),
                                          Spacer(),
                                          SizedBox(
                                            height: 40,
                                            width: 150,
                                            // custom Text field
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15),
                                              child:
                                                  CustomAutoSizeTextMontserrat(
                                                text: "",
                                                maxLines: 1,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: Divider(
                                      height: 5,
                                      thickness: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 10,
                                    ),
                                    child: SizedBox(
                                      height: 40,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: CustomAutoSizeTextMontserrat(
                                              text: "Date of Exam",
                                              maxLines: 1,
                                              textColor: Colors.grey,
                                            ),
                                          ),
                                          Spacer(),
                                          SizedBox(
                                            height: 40,
                                            width: 150,
                                            // custom Text field
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15),
                                              child:
                                                  CustomAutoSizeTextMontserrat(
                                                text: "",
                                                maxLines: 1,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: Divider(
                                      height: 5,
                                      thickness: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 10,
                                    ),
                                    child: SizedBox(
                                      height: 40,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: CustomAutoSizeTextMontserrat(
                                              text: "Date Of Test Report",
                                              maxLines: 1,
                                              textColor: Colors.grey,
                                            ),
                                          ),
                                          Spacer(),
                                          SizedBox(
                                            height: 40,
                                            width: 150,
                                            // custom Text field
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15),
                                              child:
                                                  CustomAutoSizeTextMontserrat(
                                                text: "",
                                                maxLines: 1,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: Divider(
                                      height: 5,
                                      thickness: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 10,
                                    ),
                                    child: SizedBox(
                                      height: 40,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: CustomAutoSizeTextMontserrat(
                                              text: "Test Score Expiration ",
                                              maxLines: 1,
                                              textColor: Colors.grey,
                                            ),
                                          ),
                                          Spacer(),
                                          SizedBox(
                                            height: 40,
                                            width: 150,
                                            // custom Text field
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15),
                                              child:
                                                  CustomAutoSizeTextMontserrat(
                                                text: "",
                                                maxLines: 1,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 170,
                                        child: ListTile(
                                          minLeadingWidth: 0.0,
                                          minVerticalPadding: 0.0,
                                          contentPadding:
                                              EdgeInsets.only(left: 0),
                                          title: const Text('Tentative'),
                                          leading: Radio<BestTutorSite>(
                                            value: BestTutorSite.Tentative,
                                            groupValue: _site,
                                            onChanged: (BestTutorSite? value) {
                                              setState(() {
                                                _site = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 170,
                                        child: ListTile(
                                          contentPadding:
                                              EdgeInsets.only(left: 0),
                                          title: const Text('Definite'),
                                          leading: Radio<BestTutorSite>(
                                            value: BestTutorSite.Definite,
                                            groupValue: _site,
                                            onChanged: (BestTutorSite? value) {
                                              setState(() {
                                                _site = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 10,
                                    ),
                                    child: SizedBox(
                                      height: 40,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: CustomAutoSizeTextMontserrat(
                                              text: "English Overall Scores ",
                                              maxLines: 1,
                                              textColor: Colors.grey,
                                            ),
                                          ),
                                          Spacer(),
                                          SizedBox(
                                            height: 40,
                                            width: 150,
                                            // custom Text field
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15),
                                              child:
                                                  CustomAutoSizeTextMontserrat(
                                                text: "",
                                                maxLines: 1,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: Divider(
                                      height: 5,
                                      thickness: 1,
                                    ),
                                  ),
                                  if (_site == BestTutorSite.Definite)
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 10,
                                                                left: 20),
                                                        child:
                                                            CustomAutoSizeTextMontserrat(
                                                          text: "Listening",
                                                          maxLines: 1,
                                                          textColor:
                                                              Colors.grey,
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      SizedBox(
                                                        height: 40,
                                                        width: 50,
                                                        // custom Text field
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 15),
                                                          child:
                                                              CustomAutoSizeTextMontserrat(
                                                            text: "7",
                                                            maxLines: 1,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 20, right: 20),
                                                    child: Divider(
                                                      height: 5,
                                                      thickness: 1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 10,
                                                                left: 20),
                                                        child:
                                                            CustomAutoSizeTextMontserrat(
                                                          text: "Writing",
                                                          maxLines: 1,
                                                          textColor:
                                                              Colors.grey,
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      SizedBox(
                                                        height: 40,
                                                        width: 50,
                                                        // custom Text field
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 15),
                                                          child:
                                                              CustomAutoSizeTextMontserrat(
                                                            text: "7",
                                                            maxLines: 1,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 20, right: 20),
                                                    child: Divider(
                                                      height: 5,
                                                      thickness: 1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  if (_site == BestTutorSite.Definite)
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 10,
                                                                left: 20),
                                                        child:
                                                            CustomAutoSizeTextMontserrat(
                                                          text: "Reading",
                                                          maxLines: 1,
                                                          textColor:
                                                              Colors.grey,
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      SizedBox(
                                                        height: 40,
                                                        width: 50,
                                                        // custom Text field
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 15),
                                                          child:
                                                              CustomAutoSizeTextMontserrat(
                                                            text: "7",
                                                            maxLines: 1,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 20, right: 20),
                                                    child: Divider(
                                                      height: 5,
                                                      thickness: 1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 10,
                                                                left: 20),
                                                        child:
                                                            CustomAutoSizeTextMontserrat(
                                                          text: "Speaking",
                                                          maxLines: 1,
                                                          textColor:
                                                              Colors.grey,
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      SizedBox(
                                                        height: 40,
                                                        width: 50,
                                                        // custom Text field
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 15),
                                                          child:
                                                              CustomAutoSizeTextMontserrat(
                                                            text: "7",
                                                            maxLines: 1,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 20, right: 20),
                                                    child: Divider(
                                                      height: 5,
                                                      thickness: 1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                ],
                              ),
                            ),
                          if (controller.englishTestDetail!.value == false)
                            SizedBox(
                              height: MediaQuery.of(context).size.height - 275,
                              width: MediaQuery.of(context).size.width,
                              child: ListView(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional.topStart,
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 20),
                                        child: CustomAutoSizeTextMontserrat(
                                          text: "Self",
                                          maxLines: 1,
                                          fontSize: 24,
                                          underline: true,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 10, top: 20),
                                    child: SizedBox(
                                      height: 40,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: CustomAutoSizeTextMontserrat(
                                              text: "Exam Status",
                                              maxLines: 1,
                                              textColor: Colors.grey,
                                            ),
                                          ),
                                          Spacer(),
                                          SizedBox(
                                            height: 40,
                                            width: 150,
                                            // custom Text field
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15),
                                              child:
                                                  CustomAutoSizeTextMontserrat(
                                                text: "Not Yet Registered",
                                                maxLines: 1,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: Divider(
                                      height: 5,
                                      thickness: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 10,
                                    ),
                                    child: SizedBox(
                                      height: 40,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: CustomAutoSizeTextMontserrat(
                                              text: "want to a book test?",
                                              maxLines: 1,
                                              textColor: Colors.grey,
                                            ),
                                          ),
                                          Spacer(),
                                          SizedBox(
                                            height: 40,
                                            width: 150,
                                            // custom Text field
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15),
                                              child:
                                                  CustomAutoSizeTextMontserrat(
                                                text: "No",
                                                maxLines: 1,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: Divider(
                                      height: 5,
                                      thickness: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 10,
                                    ),
                                    child: SizedBox(
                                      height: 40,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: CustomAutoSizeTextMontserrat(
                                              text:
                                                  "assumptive Proficiency Level",
                                              maxLines: 1,
                                              textColor: Colors.grey,
                                            ),
                                          ),
                                          Spacer(),
                                          SizedBox(
                                            height: 40,
                                            width: 100,
                                            // custom Text field
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15),
                                              child:
                                                  CustomAutoSizeTextMontserrat(
                                                text: "Good",
                                                maxLines: 1,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: Divider(
                                      height: 5,
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
          ],
        ),
      ),
      floatingActionButtonLocation:
          showFab ? FloatingActionButtonLocation.miniCenterDocked : null,
      floatingActionButton: Visibility(
        visible: showFab,
        child: FloatingActionButton(
            tooltip: "Action",
            backgroundColor: const Color(0xFF1940B3),
            onPressed: () {},
            // isExtended: true,
            child: SvgPicture.asset(
              "assets/icons/video-call.svg",
              height: 30,
              color: Colors.white,
            )),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
