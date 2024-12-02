import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/button/circleButton.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class QRScreen extends StatelessWidget {
  String Url;
  String code;
  QRScreen({super.key, required this.Url, required this.code});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xff0041C2),
      contentPadding: const EdgeInsets.all(15),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      insetPadding: const EdgeInsets.symmetric(horizontal: 25),
      content: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/map.png",),
          )
        ),
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width*0.8,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.9),
                        spreadRadius: -8.9, // Negative value to contain the shadow within the border
                        blurRadius: 10,
                        offset: const Offset(0, 10),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleContainerWithIcon(
                          icon: Icons.download,
                          color: ThemeConstants.lightgreycolor,
                          size: 15,
                          onPress: ()
                          {
                            print("cross pressed");
                            Get.back();
                          },
                        ),
                        const SizedBox(width: 1.2,),
                        CustomAutoSizeTextMontserrat(
                          textColor: Colors.black,
                          text: "Download",
                          fontWeight: FontWeight.w400, fontSize: 5,)

                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    print("cross pressed1");
                    Get.back();},
                  child: CircleContainerWithIcon(
                    icon: Icons.close,
                    color: ThemeConstants.whitecolor,
                    size: 30,
                    onPress: ()
                    {
                      Get.back();
                    },
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/profile-code.png", scale: 18, color: Colors.white,),
            const SizedBox(height: 30,),
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.6/1.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap:(){
                        const AlertDialog(
                          backgroundColor: Colors.white,
                          content: SizedBox(
                            width: 100,
                            height: 100,
                          ),
                        );
                      },
                      splashColor: Colors.white,
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 10, color: ThemeConstants.whitecolor)),
                          child: Image.network(Url, scale: 1,)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomAutoSizeTextMontserrat(
                      text: code,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      textColor: ThemeConstants.whitecolor,
                    )
                  ],
                ),
              ),
            ),
            Expanded(child: Image.asset("assets/images/monumet.png", scale: 5,))

          ],
        ),

            // Align(
            //   alignment: Alignment.center,
            //   child: Center(
            //     child: SizedBox(
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           InkWell(
            //             onTap:(){
            //               const AlertDialog(
            //                 backgroundColor: Colors.white,
            //                 content: SizedBox(
            //                   width: 100,
            //                   height: 100,
            //                 ),
            //               );
            //             },
            //             splashColor: Colors.white,
            //             child: Container(
            //                 decoration: BoxDecoration(
            //                     border: Border.all(
            //                         width: 10, color: ThemeConstants.whitecolor)),
            //                 child: Image.network(Url, scale: 1,)),
            //           ),
            //           const SizedBox(
            //             height: 20,
            //           ),
            //           CustomAutoSizeTextMontserrat(
            //             text: code,
            //             fontWeight: FontWeight.bold,
            //             fontSize: 20,
            //             textColor: ThemeConstants.whitecolor,
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),

        ),

    );
  }
}


