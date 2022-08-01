import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class UploadDocument extends StatelessWidget {
  const UploadDocument({Key? key}) : super(key: key);
  static const routeNamed = '/UploadDocument';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(UploadDocument.routeNamed),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: CustomAutoSizeTextMontserrat(
                    text: "Upload Documents",
                    maxLines: 1,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 70,
                child: Row(
                  children: [
                    const Spacer(),
                    // ClipRRect(
                    //     borderRadius: BorderRadius.circular(8.0),
                    //     child: SvgPicture.asset(
                    //       "assets/icons/Qualification.svg",
                    //       height: 40,
                    //       color: Colors.red,
                    //     )),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Color(0xFF1940B3),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 10, bottom: 10),
                        child: SvgPicture.asset(
                          "assets/icons/Qualification.svg",
                          height: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, top: 10),
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: const BoxDecoration(
                          color: Color(0xFF1940B3),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    CustomAutoSizeTextMontserrat(
                      text: "________",
                      maxLines: 1,
                      textColor: Color(0xFF1940B3),
                      fontWeight: FontWeight.w900,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: const BoxDecoration(
                          color: Color(0xFF1940B3),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 7),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Color(0xFF1940B3),
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, bottom: 10),
                          child: SvgPicture.asset(
                            "assets/icons/upload_doc.svg",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, top: 10),
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    CustomAutoSizeTextMontserrat(
                      text: "________",
                      maxLines: 1,
                      textColor: Colors.grey,
                      fontWeight: FontWeight.w900,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 7),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            // borderRadius: ,
                            color: Colors.white,
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, bottom: 10, right: 10),
                          child: SvgPicture.asset(
                            "assets/icons/submit.svg",
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const Spacer()
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
