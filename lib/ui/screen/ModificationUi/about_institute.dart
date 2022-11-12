import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class AboutInstituteCopy extends StatelessWidget {
  List<CompleteCourseDetail> completeCourseDetail;
  AboutInstituteCopy({Key? key, required this.completeCourseDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: ListView(
            controller: ScrollController(),
            physics: const BouncingScrollPhysics(),
            children: [
              CustomAutoSizeTextMontserrat(
                text: "About Institute",
                textColor: ThemeConstants.bluecolor,
                fontWeight: FontWeight.bold,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 10),
                child: Table(
                  children: [
                    TableRow(
                        decoration: BoxDecoration(
                          color: ThemeConstants.lightgreentColor,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: ThemeConstants.GreenColor),
                        ),
                        children: [
                          if (completeCourseDetail[0].universityName != null)
                            SizedBox(
                              height: 50,
                              child: Center(
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Institute Name",
                                  maxLines: 2,
                                  textColor: ThemeConstants.GreenColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          if (completeCourseDetail[0].universityName != null)
                            SizedBox(
                              height: 50,
                              child: Center(
                                child: CustomAutoSizeTextMontserrat(
                                  text: completeCourseDetail[0].universityName,
                                  textColor: ThemeConstants.TextColor,
                                  maxLines: 5,
                                ),
                              ),
                            ),
                        ]),
                    const TableRow(children: [
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ]),
                    TableRow(
                        decoration: BoxDecoration(
                          color: ThemeConstants.lightblueColor,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: ThemeConstants.bluecolor),
                        ),
                        children: [
                          if (completeCourseDetail[0].instituteType != null)
                            SizedBox(
                              height: 50,
                              child: Center(
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Institute Type",
                                  maxLines: 2,
                                  textColor: ThemeConstants.bluecolor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          if (completeCourseDetail[0].instituteType != null)
                            SizedBox(
                              height: 50,
                              child: Center(
                                child: CustomAutoSizeTextMontserrat(
                                  text: completeCourseDetail[0].instituteType,
                                  textColor: ThemeConstants.TextColor,
                                  maxLines: 2,
                                ),
                              ),
                            ),
                        ]),
                    const TableRow(children: [
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ]),
                    TableRow(
                        decoration: BoxDecoration(
                          color: ThemeConstants.lightorangeColor,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: ThemeConstants.orangeColor),
                        ),
                        children: [
                          if (completeCourseDetail[0].instituteType != null)
                            SizedBox(
                              height: 50,
                              child: Center(
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Campus",
                                  maxLines: 2,
                                  textColor: ThemeConstants.orangeColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          SizedBox(
                            height: 50,
                            child: Center(
                              child: CustomAutoSizeTextMontserrat(
                                text: completeCourseDetail[0].campusName,
                                textColor: ThemeConstants.TextColor,
                                maxLines: 2,
                              ),
                            ),
                          ),
                        ]),
                    const TableRow(children: [
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ]),
                    TableRow(
                        decoration: BoxDecoration(
                          color: ThemeConstants.lightVioletColor,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: ThemeConstants.VioletColor),
                        ),
                        children: [
                          if (completeCourseDetail[0].instituteType != null)
                            SizedBox(
                              height: 50,
                              child: Center(
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Institute Address",
                                  maxLines: 2,
                                  textColor: ThemeConstants.VioletColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          SizedBox(
                            height: 50,
                            child: Center(
                                child: HtmlWidget(
                              completeCourseDetail[0].campusAddress!,
                              textStyle: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                color: ThemeConstants.TextColor,
                                fontSize: 16.0,
                              ),
                            )),
                          ),
                        ]),
                  ],
                ),
              ),
              if (completeCourseDetail[0].aboutUniv != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CustomAutoSizeTextMontserrat(
                    text: completeCourseDetail[0].aboutUniv,
                    textColor: ThemeConstants.TextColor,
                  ),
                ),
              if (completeCourseDetail[0].sIECRepresented != null)
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CustomAutoSizeTextMontserrat(
                        text: "SIEC Represented",
                        maxLines: 2,
                        textColor: ThemeConstants.GreenColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              if (completeCourseDetail[0].sIECRepresented != null)
                CustomAutoSizeTextMontserrat(
                  text: completeCourseDetail[0].sIECRepresented ?? "",
                  textColor: ThemeConstants.TextColor,
                ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: CustomAutoSizeTextMontserrat(
                  text: "Total Numbers of Student",
                  maxLines: 2,
                  fontWeight: FontWeight.bold,
                  textColor: ThemeConstants.bluecolor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Table(
                  children: [
                    TableRow(children: [
                      CustomAutoSizeTextMontserrat(
                        text: "No of Internation students",
                        maxLines: 2,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomAutoSizeTextMontserrat(
                        text: "No of indian Student",
                        maxLines: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ]),
                    TableRow(children: [
                      CustomAutoSizeTextMontserrat(
                        text: "258",
                        textColor: ThemeConstants.TextColor,
                        maxLines: 2,
                      ),
                      CustomAutoSizeTextMontserrat(
                        text: "144",
                        textColor: ThemeConstants.TextColor,
                        maxLines: 2,
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
