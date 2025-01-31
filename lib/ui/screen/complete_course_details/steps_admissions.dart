import 'package:flutter/cupertino.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class StepsToAdmissions extends StatefulWidget {
  List<CompleteCourseDetail> completeCourseDetail;
  StepsToAdmissions({Key? key, required this.completeCourseDetail})
      : super(key: key);

  @override
  State<StepsToAdmissions> createState() => _StepsToAdmissionsState();
}

class _StepsToAdmissionsState extends State<StepsToAdmissions> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Table(
              children: [
                if (getNUllChecker(
                        widget.completeCourseDetail[0].isApplicationFee) ==
                    false)
                  TableRow(
                      decoration: BoxDecoration(
                        color: ThemeConstants.lightgreentColor,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            color: ThemeConstants.GreenColor, width: 0.5),
                      ),
                      children: [
                        Container(
                          constraints: const BoxConstraints(minHeight: 50),
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Is Application Fee",
                                maxLines: 2,
                                textColor: ThemeConstants.GreenColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(minHeight: 50),
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: CustomAutoSizeTextMontserrat(
                              text: widget
                                  .completeCourseDetail[0].isApplicationFee,
                              textColor: ThemeConstants.blackcolor,
                              fontSize: 14,
                              maxLines: 5,
                            ),
                          ),
                        ),
                      ]),
                if (getNUllChecker(
                        widget.completeCourseDetail[0].isApplicationFee) ==
                    false)
                  const TableRow(children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ]),
                if (getNUllChecker(widget.completeCourseDetail[0].feeWaiver) ==
                    false)
                  TableRow(
                      decoration: BoxDecoration(
                        color: ThemeConstants.lightblueColor,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            color: ThemeConstants.bluecolor, width: 0.5),
                      ),
                      children: [
                        SizedBox(
                          height: 50,
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Fee Waiver",
                                maxLines: 2,
                                textColor: ThemeConstants.bluecolor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        if (widget.completeCourseDetail[0].instituteType !=
                            null)
                          SizedBox(
                            height: 50,
                            child: Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: CustomAutoSizeTextMontserrat(
                                text: widget.completeCourseDetail[0].feeWaiver,
                                textColor: ThemeConstants.blackcolor,
                                fontSize: 14,
                                maxLines: 2,
                              ),
                            ),
                          ),
                      ]),
                if (getNUllChecker(widget.completeCourseDetail[0].feeWaiver) ==
                    false)
                  const TableRow(children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ]),
                if (getNUllChecker(widget.completeCourseDetail[0].offerTat) ==
                    false)
                  TableRow(
                      decoration: BoxDecoration(
                        color: ThemeConstants.lightorangeColor,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            color: ThemeConstants.orangeColor, width: 0.5),
                      ),
                      children: [
                        if (widget.completeCourseDetail[0].instituteType !=
                            null)
                          SizedBox(
                            height: 50,
                            child: Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Offer TAT",
                                  maxLines: 2,
                                  textColor: ThemeConstants.orangeColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        SizedBox(
                          height: 50,
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: CustomAutoSizeTextMontserrat(
                              text: widget.completeCourseDetail[0].offerTat,
                              textColor: ThemeConstants.blackcolor,
                              fontSize: 14,
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ]),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child:
                      Image.network(widget.completeCourseDetail[0].countryID))),
        ],
      ),
    );
  }
}
