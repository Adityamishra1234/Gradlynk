import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class AboutInstitute extends StatelessWidget {
  List<CompleteCourseDetail> completeCourseDetail;
  AboutInstitute({Key? key, required this.completeCourseDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Table(
                children: [
                  TableRow(children: [
                    if (completeCourseDetail[0].universityName != null)
                      CustomAutoSizeTextMontserrat(
                        text: "Institute Name",
                        maxLines: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    if (completeCourseDetail[0].instituteType != null)
                      CustomAutoSizeTextMontserrat(
                        text: "Institute Type",
                        maxLines: 2,
                        fontWeight: FontWeight.bold,
                      ),
                  ]),
                  TableRow(children: [
                    if (completeCourseDetail[0].universityName != null)
                      CustomAutoSizeTextMontserrat(
                        text: completeCourseDetail[0].universityName,
                        maxLines: 5,
                      ),
                    if (completeCourseDetail[0].instituteType != null)
                      CustomAutoSizeTextMontserrat(
                        text: completeCourseDetail[0].instituteType,
                        maxLines: 2,
                      ),
                  ]),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Table(
                children: [
                  TableRow(children: [
                    if (completeCourseDetail[0].campusName != null)
                      CustomAutoSizeTextMontserrat(
                        text: "Campus",
                        maxLines: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    if (completeCourseDetail[0].campusAddress != null)
                      CustomAutoSizeTextMontserrat(
                        text: "Institute Address",
                        maxLines: 2,
                        fontWeight: FontWeight.bold,
                      ),
                  ]),
                  TableRow(children: [
                    if (completeCourseDetail[0].campusName != null)
                      CustomAutoSizeTextMontserrat(
                        text: completeCourseDetail[0].campusName,
                        maxLines: 2,
                      ),
                    if (completeCourseDetail[0].campusAddress != null)
                      HtmlWidget(
                        completeCourseDetail[0].campusAddress!,
                        textStyle: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      )
                  ]),
                ],
              ),
            ),
            if (completeCourseDetail[0].aboutUniv != null)
              Row(
                children: [
                  CustomAutoSizeTextMontserrat(
                    text: "About Institute",
                    maxLines: 2,
                    fontWeight: FontWeight.bold,
                  ),
                  const Spacer(),
                ],
              ),
            if (completeCourseDetail[0].aboutUniv != null)
              CustomAutoSizeTextMontserrat(
                text: completeCourseDetail[0].aboutUniv,
              ),
            if (completeCourseDetail[0].sIECRepresented != null)
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CustomAutoSizeTextMontserrat(
                      text: "SIEC Represented",
                      maxLines: 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            if (completeCourseDetail[0].sIECRepresented != null)
              CustomAutoSizeTextMontserrat(
                text: completeCourseDetail[0].sIECRepresented ?? "",
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
                      maxLines: 2,
                    ),
                    CustomAutoSizeTextMontserrat(
                      text: "144",
                      maxLines: 2,
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
