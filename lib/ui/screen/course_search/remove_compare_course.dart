import 'package:flutter/material.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class RemoveCompareCourse extends StatefulWidget {
  CourseSearchModel model1;
  CourseSearchModel model2;
  final Function callbackRemoveCourse;
  RemoveCompareCourse(
      {Key? key,
      required this.model1,
      required this.model2,
      required this.callbackRemoveCourse})
      : super(key: key);
  static const routeNamed = '/RemoveCompareCourse';

  @override
  State<RemoveCompareCourse> createState() => _RemoveCompareCourseState();
}

class _RemoveCompareCourseState extends State<RemoveCompareCourse> {
  bool _value = false;
  bool _valu = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        color: ThemeConstants.whitecolor,
        width: MediaQuery.of(context).size.width,

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CustomAutoSizeTextMontserrat(
                text: "Opps, You can compare only 2 courses at a time!",
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: CustomAutoSizeTextMontserrat(
                text: widget.model1.courseName,
                textColor: ThemeConstants.bluecolor,
                fontWeight: FontWeight.bold,
              ),
              subtitle: CustomAutoSizeTextMontserrat(
                text: "${widget.model1.countryName ?? ""}"
                    " ${widget.model1.stateName ?? ""}"
                    "${widget.model1.cityName ?? ""}|${widget.model1.universityName ?? ""}",
                textColor: ThemeConstants.TextColor,
              ),
              autofocus: false,
              activeColor: ThemeConstants.bluecolor,
              checkColor: Colors.white,
              selected: _value,
              dense: true,
              value: _value,
              onChanged: (bool? value) {
                setState(() {
                  _value = value!;
                });
              },
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Divider(
                height: 5,
                thickness: 1,
              ),
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: CustomAutoSizeTextMontserrat(
                text: widget.model2.courseName,
                textColor: ThemeConstants.bluecolor,
                fontWeight: FontWeight.bold,
              ),
              subtitle: CustomAutoSizeTextMontserrat(
                text: "${widget.model2.countryName ?? ""}"
                    "${widget.model2.stateName ?? ""}"
                    "${widget.model2.cityName ?? ""}|${widget.model2.universityName ?? ""}",
                textColor: ThemeConstants.TextColor,
              ),
              autofocus: false,
              activeColor: ThemeConstants.bluecolor,
              checkColor: Colors.white,
              selected: _valu,
              dense: true,
              value: _valu,
              onChanged: (bool? value) {
                setState(() {
                  _valu = value!;
                });
              },
            ),
            Row(
              children: [
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 20, top: 20, bottom: 20),
                  child: SizedBox(
                    width: 120,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: ThemeConstants.whitecolor,
                          side: BorderSide(color: ThemeConstants.bluegreycolor),
                          backgroundColor:
                              ThemeConstants.whitecolor, // foreground
                        ),
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                        child: CustomAutoSizeTextMontserrat(
                          text: "Cancel",
                          textColor: ThemeConstants.bluegreycolor,
                        )),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 20, top: 20, bottom: 20),
                  child: SizedBox(
                    width: 120,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: ThemeConstants.bluecolor,
                          backgroundColor:
                              ThemeConstants.bluecolor, // foreground
                        ),
                        onPressed: () {
                          String temp = "";
                          if (_value == true) {
                            temp = "1";
                          }
                          if (_valu == true) {
                            temp = "${temp}2";
                          }
                          widget.callbackRemoveCourse(temp);
                          Navigator.pop(context, true);
                        },
                        child: CustomAutoSizeTextMontserrat(
                          text: "Remove",
                          textColor: ThemeConstants.whitecolor,
                        )),
                  ),
                ),
                const Spacer(),
              ],
            )
          ],
        ), //Center
      ),
    );
//SizedBox
    //MaterialApp
  }
}
