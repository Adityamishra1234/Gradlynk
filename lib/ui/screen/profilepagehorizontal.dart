import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/ui/controllers/ProfilePagecontroller.dart';
import 'package:studentpanel/widgets/animationshowdown.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetext.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customtextfield.dart';

class ProfilePageHorizontal extends StatefulWidget {
  ProfilePageHorizontal({Key? key}) : super(key: key);
  static const routeNamed = '/ProfilePageHorizontal';

  @override
  State<ProfilePageHorizontal> createState() => _ProfilePageHorizontalState();
}

class _ProfilePageHorizontalState extends State<ProfilePageHorizontal> {
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
    final TextStyle textStyle = GoogleFonts.montserrat(
      fontWeight: FontWeight.w600,
      color: colorsChoose ? Colors.white : Colors.black,
      fontSize: 15,
    );
    return textStyle;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("title"),
        body: Container(
          color: Colors.white,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  height: 50,
                  child: GetBuilder<ProfilePageController>(
                      init: ProfilePageController(),
                      builder: (controller) {
                        return ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Card(
                                elevation: 5,
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
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Card(
                                elevation: 5,
                                child: Container(
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
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Card(
                                elevation: 5,
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
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 35),
                              child: Card(
                                elevation: 5,
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
                                        child: Text("Course Choice",
                                            style: getTextStyle(
                                                controller.chooseIndex!.value ==
                                                    3)))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 35),
                              child: Card(
                                elevation: 5,
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
                            ),
                          ],
                        );
                      }),
                ),
              ),
              // const Padding(
              //   padding: EdgeInsets.only(left: 20, right: 20),
              //   child: Divider(
              //     height: 5,
              //     thickness: 1,
              //   ),
              // ),
              GetBuilder<ProfilePageController>(
                  init: ProfilePageController(),
                  builder: (controller) {
                    if (controller.chooseIndex!.value == 0) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height - 205,
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
                              padding:
                                  const EdgeInsets.only(left: 20, right: 10),
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
                              padding:
                                  const EdgeInsets.only(left: 20, right: 10),
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
                              padding:
                                  const EdgeInsets.only(left: 20, right: 10),
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
                              padding:
                                  const EdgeInsets.only(left: 20, right: 10),
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
                              padding:
                                  const EdgeInsets.only(left: 20, right: 10),
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
                              padding:
                                  const EdgeInsets.only(left: 20, right: 10),
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
                              padding:
                                  const EdgeInsets.only(left: 20, right: 10),
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
                              padding:
                                  const EdgeInsets.only(left: 20, right: 10),
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
                              padding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              child: SizedBox(
                                height: 40,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Address",
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
                              padding:
                                  const EdgeInsets.only(left: 20, right: 10),
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
                            AnimationShowDownArror(
                              xdata: 0,
                            )
                          ],
                        ),
                      );
                    } else if (controller.chooseIndex!.value == 1) {
                      return Container(
                        child: Text("Mandatory Info."),
                      );
                    } else {
                      return Container();
                    }
                  }),
            ],
          ),
        ));
  }
}
