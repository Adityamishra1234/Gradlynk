import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/profilepagecontroller.dart';

import 'package:studentpanel/widgets/animationshowdown.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class PersonalInformation extends StatelessWidget {
  PersonalInformation({
    Key? key,
  }) : super(key: key);

  var controller = Get.put(ProfilePageController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - 245,
          child: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              if (notification.direction == ScrollDirection.forward) {
                controller.getShowAnimation(false.obs);
              } else if (notification.direction == ScrollDirection.reverse) {
                controller.getShowAnimationTrue(true.obs, true.obs);
              } else {
                return true;
              }
              return true;
            },
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 76,
                    width: 76,
                    decoration: const BoxDecoration(
                        color: Colors.orange, shape: BoxShape.circle),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5, right: 10),
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
                  padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
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
          ),
        ),
        if (controller.showAnimation!.value == true ||
            controller.firstTimeAnimation!.value == false)
          Positioned(
            bottom: -50,
            left: 220,
            child: AnimationShowDownArror(
              toY: -100,
              fromY: -80,
            ),
          ),
      ],
    );
  }
}