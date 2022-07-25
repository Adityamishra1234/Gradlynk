import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownbutton.dart';

class CourseChoose extends StatelessWidget {
  const CourseChoose({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
          child: SizedBox(
            height: 40,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CustomAutoSizeTextMontserrat(
                    text: "Course Level",
                    maxLines: 1,
                    textColor: Colors.grey,
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 150,
                  // custom Text field
                  child: CustomDropDown(
                    hint: "Test Already taken",
                    model: ["1", "2", "3", "4"],
                    border: false,
                  ),
                )
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Divider(
            height: 5,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
          child: SizedBox(
            height: 40,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CustomAutoSizeTextMontserrat(
                    text: "Course Broad Field",
                    maxLines: 1,
                    textColor: Colors.grey,
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 150,
                  // custom Text field
                  child: CustomDropDown(
                    hint: "Test Already taken",
                    model: ["1", "2", "3", "4"],
                    border: false,
                  ),
                )
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Divider(
            height: 5,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
          child: SizedBox(
            height: 40,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CustomAutoSizeTextMontserrat(
                    text: "Course Narrow Field",
                    maxLines: 1,
                    textColor: Colors.grey,
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 150,
                  // custom Text field
                  child: CustomDropDown(
                    hint: "Test Already taken",
                    model: ["1", "2", "3", "4"],
                    border: false,
                  ),
                )
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Divider(
            height: 5,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
