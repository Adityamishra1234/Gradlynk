import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/models/getAllTestimonialsModel.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/extensions/textTrimmer.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class TestiMonial extends StatelessWidget {
  TestiMonial(
      {super.key, required this.testimonialsList, required this.isLoading});
  List<GetAllTestimonialsModel> testimonialsList;
  bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 190,
      child: isLoading == false
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: CustomAutoSizeTextMontserrat(
                        textColor: ThemeConstants.bluecolor,
                        text: 'Testimonials'),
                  ),
                  Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: testimonialsList.length,
                          itemBuilder: (context, index) {
                            var showProfile = true;
                            if (testimonialsList[index].image == '') {
                              showProfile = false;
                            }

                            var comment =
                                testimonialsList[index].comment!.length > 120
                                    ? testimonialsList[index]
                                        .comment!
                                        .trimToLength(120)
                                    : testimonialsList[index].comment!;
                            return InkWell(
                              onTap: () {
                                showAnimatedDialog(
                                    animationType: DialogTransitionType
                                        .slideFromBottomFade,
                                    curve: Curves.easeInOutQuart,
                                    context: context,
                                    builder: (_) => AlertDialog(
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0))),
                                        content: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: CircleAvatar(
                                                      radius: 23.0,
                                                      backgroundImage: showProfile ==
                                                              true
                                                          ? NetworkImage(
                                                              "${testimonialsList[index].image}")
                                                          : const NetworkImage(
                                                              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                    child: Container(
                                                      width: 25,
                                                      height: 25,
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: CircleAvatar(
                                                        radius: 25,
                                                        backgroundColor:
                                                            ThemeConstants
                                                                .ultraLightgreyColor,
                                                        child: Icon(
                                                          Icons.close,
                                                          color: ThemeConstants
                                                              .bluecolor,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 10,
                                                height: 20,
                                              ),
                                              CustomAutoSizeTextMontserrat(
                                                  textColor:
                                                      ThemeConstants.blackcolor,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                  text:
                                                      "${testimonialsList[index].comment!}"),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              CustomAutoSizeTextMontserrat(
                                                text:
                                                    "${testimonialsList[index].name}",
                                                textColor:
                                                    ThemeConstants.bluecolor,
                                                fontSize: 13,
                                                // textColor: ThemeConstants.bluecolor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              SizedBox(
                                                  height: 20,
                                                  width: 150,
                                                  child: ListView.builder(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount:
                                                          testimonialsList[
                                                                  index]
                                                              .rating,
                                                      itemBuilder: (context,
                                                              index) =>
                                                          Container(
                                                            child: const Icon(
                                                              Icons.star,
                                                              color: Color(
                                                                  0xFFFFC107), // Color of the star's fill
                                                              size: 22,
                                                            ),
                                                          ))),
                                            ])));
                              },
                              child: Container(
                                width: 280,
                                padding: const EdgeInsets.all(10.0),
                                margin: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    color: index % 2 == 0
                                        ? ThemeConstants.lightblueColor
                                        : ThemeConstants.bluecolor,
                                    // color: ThemeConstants.GreenColor,
                                    border: Border.all(
                                        width: 0.8,
                                        color: index % 2 == 0
                                            ? ThemeConstants.bluecolor
                                            : ThemeConstants.bluecolor),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30.0))),
                                child: Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: CircleAvatar(
                                        radius: 23.0,
                                        backgroundImage: showProfile == true
                                            ? NetworkImage(
                                                "${testimonialsList[index].image}")
                                            : const NetworkImage(
                                                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 190,
                                          child: CustomAutoSizeTextMontserrat(
                                              textColor: index % 2 == 0
                                                  ? ThemeConstants.blackcolor
                                                  : ThemeConstants.whitecolor,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              text: "${comment}...."),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          width: 200,
                                          child: CustomAutoSizeTextMontserrat(
                                            text:
                                                "${testimonialsList[index].name}",
                                            textColor: index % 2 == 0
                                                ? ThemeConstants.bluecolor
                                                : ThemeConstants.whitecolor,
                                            fontSize: 13,
                                            // textColor: ThemeConstants.bluecolor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        SizedBox(
                                            height: 20,
                                            width: 150,
                                            child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    testimonialsList[index]
                                                        .rating,
                                                itemBuilder: (context, index) =>
                                                    Container(
                                                      child: const Icon(
                                                        Icons.star,
                                                        color: Color(
                                                            0xFFFFC107), // Color of the star's fill
                                                        size: 22,
                                                      ),
                                                    ))),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          })),
                ])
          : getLoading(context),
    );
  }
}
