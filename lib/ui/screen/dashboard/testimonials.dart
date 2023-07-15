import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:studentpanel/ui/models/getAllTestimonialsModel.dart';
import 'package:studentpanel/utils/extensions/textTrimmer.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class TestiMonial extends StatelessWidget {
  TestiMonial({super.key, required this.testimonialsList});
  List<GetAllTestimonialsModel> testimonialsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 190,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: CustomAutoSizeTextMontserrat(
                  textColor: ThemeConstants.bluecolor, text: 'Testimonials'),
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

                      var comment = testimonialsList[index].comment!.length >
                              120
                          ? testimonialsList[index].comment!.trimToLength(120)
                          : testimonialsList[index].comment!;
                      return Container(
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30.0))),
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                    text: "${testimonialsList[index].name}",
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
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            testimonialsList[index].rating,
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
                      );
                    })),
          ]),
    );
  }
}
