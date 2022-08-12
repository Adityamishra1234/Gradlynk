import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CourseSearchFullDetail extends StatefulWidget {
  const CourseSearchFullDetail({Key? key}) : super(key: key);
  static const routeNamed = '/CourseSearch';

  @override
  State<CourseSearchFullDetail> createState() => _CourseSearchFullDetailState();
}

class _CourseSearchFullDetailState extends State<CourseSearchFullDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("title"),
        body: Container(
            child: Column(children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 5),
            child: Divider(
              height: 5,
              thickness: 1,
            ),
          ),
          CustomAutoSizeTextMontserrat(
            text: "Bachelor of Science in Compluter Science",
            maxLines: 5,
            fontSize: 26,
            fontWeight: FontWeight.bold,
            textColor: ThemeConstants.bluecolor,
          ),
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/university.svg",
                height: 20,
                width: 20,
              ),
              CustomAutoSizeTextMontserrat(
                  text: "Valparaiso University", maxLines: 2)
            ],
          ),
          Card(
            elevation: 5,
            child: Column(
              children: [
                Container(
                  color: ThemeConstants.lightblueColor,
                  child: Column(
                    children: [
                      CustomAutoSizeTextMontserrat(
                        text: "Course Duration",
                        maxLines: 1,
                        textColor: ThemeConstants.bluecolor,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ])));
  }
}
