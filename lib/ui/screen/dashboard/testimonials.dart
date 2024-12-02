import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/ui/models/getAllTestimonialsModel.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/extensions/textTrimmer.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

import '../../../widgets/drawerfilter.dart';
import '../../controllers/basecontroller.dart';
import '../../controllers/dashboardcontroller.dart';
import '../mark_attendance/qrCodeScreen.dart';
var dashboardController = Get.put(DashboardController());
class TestiMonial extends StatelessWidget {
  TestiMonial(
      {super.key, required this.testimonialsList, required this.isLoading});
  List<GetAllTestimonialsModel> testimonialsList;
  bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      height: 190,
      child: isLoading == false
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 15),
                  //   child: CustomAutoSizeTextMontserrat(
                  //       textColor: ThemeConstants.bluecolor,
                  //       text: 'Testimonials'),
                  // ),

                Padding(
                  padding: const EdgeInsets.only(top: 18.0, left: 10, right: 10, bottom: 8),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Testimonials",
                        maxLines: 2,
                        style:  GoogleFonts.abhayaLibre(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff414040),
                          ),
                        )
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                            return AllTestimonials(testimonialsList:
                            dashboardController
                                .testimonialsList,
                              isLoading: dashboardController
                                  .testimonialsLoading,
                            );
                          }));
                        },
                        child: Text("See all",
                            maxLines: 2,
                            style:  GoogleFonts.abhayaLibre(
                              textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: ThemeConstants.bluecolor
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
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
                                testimonialsList[index].comment!.length > 100
                                    ? testimonialsList[index]
                                        .comment!
                                        .trimToLength(100)
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
                                        content: SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.90,
                                          child: SingleChildScrollView(
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: CircleAvatar(
                                                            radius: 25,
                                                            backgroundColor:
                                                                ThemeConstants
                                                                    .ultraLightgreyColor,
                                                            child: Icon(
                                                              Icons.close,
                                                              color:
                                                                  ThemeConstants
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
                                                      textColor: ThemeConstants
                                                          .blackcolor,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      text:
                                                          testimonialsList[index].comment!),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  CustomAutoSizeTextMontserrat(
                                                    text:
                                                        "${testimonialsList[index].name}",
                                                    textColor: ThemeConstants
                                                        .bluecolor,
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
                                                                child:
                                                                    const Icon(
                                                                  Icons.star,
                                                                  color: Color(
                                                                      0xFFFFC107), // Color of the star's fill
                                                                  size: 22,
                                                                ),
                                                              ))),
                                                ]),
                                          ),
                                        )));
                              },
                              child: Container(
                                width: 310,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                margin: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    color: index % 2 == 0
                                        ? ThemeConstants.lightblueColor
                                        : ThemeConstants.bluecolor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: -0.2,
                                        blurRadius: 5,
                                        offset: const Offset(0, 4),
                                      )],
                                    // border: Border.all(
                                    //     width: 0.8,
                                    //     color: index % 2 == 0
                                    //         ? ThemeConstants.bluecolor
                                    //         : ThemeConstants.bluecolor),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0))),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                    contentPadding: EdgeInsets.zero,
                                      leading: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: Align(
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
                                      ),
                                      title: Text("${testimonialsList[index].name}",
                                        style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'lato',
                                            color: (index % 2 ==0)?ThemeConstants.blackcolor: ThemeConstants.whitecolor,
                                          ),
                                        )),

                                      subtitle: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: List.generate(
                                          testimonialsList[index].rating ?? 0,
                                              (index) => const Icon(Icons.star, size: 16, color: Color(0xFFFFC107)),
                                        ),
                                      // Text("Rating here".substring(4), style: const TextStyle(
                                      //     fontSize: 10,
                                      //     fontWeight: FontWeight.w300,
                                      //     fontFamily: 'Lato',
                                      //     color: Color(0xff5B5B5B),
                                      //     height: 2
                                      // ),),
                                      ),

                                    ),
                                    const SizedBox(height: 8,),
                                    Expanded(
                                      child: Text("$comment..",maxLines: 2,
                                        style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Lato',
                                              color: index % 2 == 0
                                                  ? ThemeConstants.blackcolor
                                                  : ThemeConstants.whitecolor,
                                              height: 1.5
                                          ),
                                        )),
                                    ),
                                  ],
                                ),
                                // child: Row(
                                //   children: [
                                //     Align(
                                //       alignment: Alignment.topLeft,
                                //       child: CircleAvatar(
                                //         radius: 23.0,
                                //         backgroundImage: showProfile == true
                                //             ? NetworkImage(
                                //                 "${testimonialsList[index].image}")
                                //             : const NetworkImage(
                                //                 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                                //       ),
                                //     ),
                                //     const SizedBox(
                                //       width: 10,
                                //     ),
                                //     Column(
                                //       mainAxisAlignment:
                                //           MainAxisAlignment.start,
                                //       crossAxisAlignment:
                                //           CrossAxisAlignment.start,
                                //       children: [
                                //         SizedBox(
                                //           width: 190,
                                //           child: CustomAutoSizeTextMontserrat(
                                //               textColor: index % 2 == 0
                                //                   ? ThemeConstants.blackcolor
                                //                   : ThemeConstants.whitecolor,
                                //               fontSize: 10,
                                //               fontWeight: FontWeight.w400,
                                //               text: "${comment}...."),
                                //         ),
                                //         const SizedBox(
                                //           height: 5,
                                //         ),
                                //         const Spacer(),
                                //         SizedBox(
                                //           width: 200,
                                //           child: CustomAutoSizeTextMontserrat(
                                //             text:
                                //                 "${testimonialsList[index].name}",
                                //             textColor: index % 2 == 0
                                //                 ? ThemeConstants.bluecolor
                                //                 : ThemeConstants.whitecolor,
                                //             fontSize: 13,
                                //             // textColor: ThemeConstants.bluecolor,
                                //             fontWeight: FontWeight.bold,
                                //           ),
                                //         ),
                                //         const SizedBox(
                                //           height: 5,
                                //         ),
                                //         SizedBox(
                                //             height: 20,
                                //             width: 150,
                                //             child: ListView.builder(
                                //                 scrollDirection:
                                //                     Axis.horizontal,
                                //                 itemCount:
                                //                     testimonialsList[index]
                                //                         .rating,
                                //                 itemBuilder: (context, index) =>
                                //                     Container(
                                //                       child: const Icon(
                                //                         Icons.star,
                                //                         color: Color(
                                //                             0xFFFFC107), // Color of the star's fill
                                //                         size: 22,
                                //                       ),
                                //                     ))),
                                //       ],
                                //     )
                                //   ],
                                // ),
                              ),
                            );
                          })),
                ])
          : getLoading(context),
    );
  }
}



class AllTestimonials extends StatefulWidget {
  List<GetAllTestimonialsModel> testimonialsList;
  bool isLoading;
  AllTestimonials({super.key,required this.testimonialsList, required this.isLoading});

  @override
  State<AllTestimonials> createState() => _AllTestimonialsState();
}

class _AllTestimonialsState extends State<AllTestimonials> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      key: _scaffoldKey,
        appBar:  AppBar(
          elevation: 2.5,
          automaticallyImplyLeading: false,
          actions: [
            if (displayMobileLayout == true)
              IconButton(
                icon: const Icon(Icons.arrow_back,
                    color: Colors.black),
                onPressed: () => Get.back(),
              ),
            if (displayMobileLayout == false)
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child:  IconButton(
                  // icon: Image.asset("assets/images/gradlynk lense.png"),
                  icon: const Icon(Icons.arrow_back, color: Colors.black,),
                  // icon: const Icon(Icons.menu,color: Colors.black,),
                  onPressed: () {
                    // Get.find<BaseController>().profileDataValidator();
                    Get.deleteAll();
                    Get.back();

                    DrawerFilter();
                  },
                ),
              ),
            // svgImage("work", Colors.transparent, 32, 32),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Image.network(
                "https://sieceducation.in/assets/assets/images/logo.png",
                width: 130,
                height: 30,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 10),
            //   child: Row(
            //     children: [
            //     Text("Hi, ", style: GoogleFonts.abhayaLibre(textStyle: const TextStyle(
            //                         fontSize: 24,
            //                         fontWeight: FontWeight.w700,
            //                         color: Colors.black,
            //                       ),)),
            //       Text(
            //             style: GoogleFonts.abhayaLibre(textStyle: const TextStyle(
            //               fontSize: 24,
            //               fontWeight: FontWeight.w700,
            //               color: Colors.black,
            //             ),),
            //           "${firstLetterChaptial(controller.personalModal.enquiryName) ?? firstLetterChaptial(controller.model1.enquiryName)}"
            //         ),
            //     ],
            //   ),
            // ),
            const Spacer(),
            if (Get.find<BaseController>()
                .meetingZoneStatus
                .qrCodeGenerated ==
                true)
              IconButton(
                icon: svgImage(
                    "qr code", ThemeConstants.IconColor, 25, 25),
                onPressed: () {
                  showAnimatedDialog(
                      animationType: DialogTransitionType.slideFromBottomFade,
                      curve: Curves.easeInOutQuart,
                      context: context,
                      builder: (_) => QRScreen(
                          Url: Get.find<BaseController>()
                              .meetingZoneStatus
                              .qrCodeView!,
                          code: Get.find<BaseController>()
                              .meetingZoneStatus
                              .student_code!));
                },
              ),

            // IconButton(
            //   icon: SvgPicture.asset(
            //     "assets/icons/profile.svg",
            //     height: 30,
            //     color: const Color.fromARGB(255, 99, 99, 99),
            //   ),
            //   onPressed: () {
            //     Get.toNamed(ProfilePage.routeNamed);
            //   },
            // ),

            const SizedBox(
              width: 5,
            )
          ],
          // title: Text(
          //   title,
          //   style: const TextStyle(color: Colors.black),
          // ),
          backgroundColor: Colors.white,
        ),
      body: Column(
        children: [
          const SizedBox(height: 10,),
          Text("Our Testimonials",
              maxLines: 2,
              style:  GoogleFonts.adamina(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff414040),
                ),
              )
          ),
          const SizedBox(height: 10,),
          Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: widget.testimonialsList.length,
                  itemBuilder: (context, index) {
                    var showProfile = true;
                    if (widget.testimonialsList[index].image == '') {
                      showProfile = false;
                    }

                    var comment =
                    widget.testimonialsList[index].comment!.length > 100
                        ? widget.testimonialsList[index]
                        .comment!
                        .trimToLength(100)
                        : widget.testimonialsList[index].comment!;
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
                                content: SizedBox(
                                  width:
                                  MediaQuery.sizeOf(context).width *
                                      0.90,
                                  child: SingleChildScrollView(
                                    child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
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
                                                      "${widget.testimonialsList[index].image}")
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
                                                  alignment: Alignment
                                                      .centerRight,
                                                  child: CircleAvatar(
                                                    radius: 25,
                                                    backgroundColor:
                                                    ThemeConstants
                                                        .ultraLightgreyColor,
                                                    child: Icon(
                                                      Icons.close,
                                                      color:
                                                      ThemeConstants
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
                                              textColor: ThemeConstants
                                                  .blackcolor,
                                              fontSize: 10,
                                              fontWeight:
                                              FontWeight.w400,
                                              text:
                                              widget.testimonialsList[index].comment!),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text:
                                            "${widget.testimonialsList[index].name}",
                                            textColor: ThemeConstants
                                                .bluecolor,
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
                                                  widget.testimonialsList[
                                                  index]
                                                      .rating,
                                                  itemBuilder: (context,
                                                      index) =>
                                                      const Icon(
                                                        Icons.star,
                                                        color: Color(
                                                            0xFFFFC107), // Color of the star's fill
                                                        size: 22,
                                                      ))),
                                        ]),
                                  ),
                                )));
                      },
                      child: Container(
                        width: 310,
                        height: 150,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? ThemeConstants.lightblueColor
                                : ThemeConstants.bluecolor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: -0.2,
                                blurRadius: 5,
                                offset: const Offset(0, 4),
                              )],
                            // border: Border.all(
                            //     width: 0.8,
                            //     color: index % 2 == 0
                            //         ? ThemeConstants.bluecolor
                            //         : ThemeConstants.bluecolor),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(10.0))),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: SizedBox(
                                width: 50,
                                height: 50,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: CircleAvatar(
                                    radius: 23.0,
                                    backgroundImage: showProfile == true
                                        ? NetworkImage(
                                        "${widget.testimonialsList[index].image}")
                                        : const NetworkImage(
                                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                                  ),
                                ),
                              ),
                              title: Text("${widget.testimonialsList[index].name}",
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'lato',
                                      color: (index % 2 ==0)?ThemeConstants.blackcolor: ThemeConstants.whitecolor,
                                    ),
                                  )),

                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(
                                  widget.testimonialsList[index].rating ?? 0,
                                      (index) => const Icon(Icons.star, size: 16, color: Color(0xFFFFC107)),
                                ),
                                // Text("Rating here".substring(4), style: const TextStyle(
                                //     fontSize: 10,
                                //     fontWeight: FontWeight.w300,
                                //     fontFamily: 'Lato',
                                //     color: Color(0xff5B5B5B),
                                //     height: 2
                                // ),),
                              ),

                            ),
                            const SizedBox(height: 8,),
                            Expanded(
                              child: Text("$comment..",maxLines: 2,
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Lato',
                                        color: index % 2 == 0
                                            ? ThemeConstants.blackcolor
                                            : ThemeConstants.whitecolor,
                                        height: 1.5
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        // child: Row(
                        //   children: [
                        //     Align(
                        //       alignment: Alignment.topLeft,
                        //       child: CircleAvatar(
                        //         radius: 23.0,
                        //         backgroundImage: showProfile == true
                        //             ? NetworkImage(
                        //                 "${testimonialsList[index].image}")
                        //             : const NetworkImage(
                        //                 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                        //       ),
                        //     ),
                        //     const SizedBox(
                        //       width: 10,
                        //     ),
                        //     Column(
                        //       mainAxisAlignment:
                        //           MainAxisAlignment.start,
                        //       crossAxisAlignment:
                        //           CrossAxisAlignment.start,
                        //       children: [
                        //         SizedBox(
                        //           width: 190,
                        //           child: CustomAutoSizeTextMontserrat(
                        //               textColor: index % 2 == 0
                        //                   ? ThemeConstants.blackcolor
                        //                   : ThemeConstants.whitecolor,
                        //               fontSize: 10,
                        //               fontWeight: FontWeight.w400,
                        //               text: "${comment}...."),
                        //         ),
                        //         const SizedBox(
                        //           height: 5,
                        //         ),
                        //         const Spacer(),
                        //         SizedBox(
                        //           width: 200,
                        //           child: CustomAutoSizeTextMontserrat(
                        //             text:
                        //                 "${testimonialsList[index].name}",
                        //             textColor: index % 2 == 0
                        //                 ? ThemeConstants.bluecolor
                        //                 : ThemeConstants.whitecolor,
                        //             fontSize: 13,
                        //             // textColor: ThemeConstants.bluecolor,
                        //             fontWeight: FontWeight.bold,
                        //           ),
                        //         ),
                        //         const SizedBox(
                        //           height: 5,
                        //         ),
                        //         SizedBox(
                        //             height: 20,
                        //             width: 150,
                        //             child: ListView.builder(
                        //                 scrollDirection:
                        //                     Axis.horizontal,
                        //                 itemCount:
                        //                     testimonialsList[index]
                        //                         .rating,
                        //                 itemBuilder: (context, index) =>
                        //                     Container(
                        //                       child: const Icon(
                        //                         Icons.star,
                        //                         color: Color(
                        //                             0xFFFFC107), // Color of the star's fill
                        //                         size: 22,
                        //                       ),
                        //                     ))),
                        //       ],
                        //     )
                        //   ],
                        // ),
                      ),
                    );
                  })),
        ],
      )
    );
  }
}
