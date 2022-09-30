import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class BottomSheetRemoveCourse extends StatefulWidget {
  const BottomSheetRemoveCourse({Key? key}) : super(key: key);
  static const routeNamed = '/Test';

  @override
  State<BottomSheetRemoveCourse> createState() =>
      _BottomSheetRemoveCourseState();
}

class _BottomSheetRemoveCourseState extends State<BottomSheetRemoveCourse> {
  bool _value = false;
  bool _valu = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        color: ThemeConstants.whitecolor,
        width: MediaQuery.of(context).size.width,
        height: 380,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CustomAutoSizeTextMontserrat(
                text: "You can compare up to 2 courses at time",
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: CustomAutoSizeTextMontserrat(
                text: "Bachelor of Business-Economics and Finance",
                textColor: ThemeConstants.bluecolor,
                fontWeight: FontWeight.bold,
              ),
              subtitle: CustomAutoSizeTextMontserrat(
                text:
                    "Australia, Victoria,Melbourne | RMIt University |Melbourne City Campus",
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
                text: "Bachelor of Business-Economics and Finance",
                textColor: ThemeConstants.bluecolor,
                fontWeight: FontWeight.bold,
              ),
              subtitle: CustomAutoSizeTextMontserrat(
                text:
                    "Australia, Victoria,Melbourne | RMIt University |Melbourne City Campus",
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
            Row(
              children: [
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 20, top: 20, bottom: 20),
                  child: SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(color: ThemeConstants.bluegreycolor),
                          primary: ThemeConstants.whitecolor, // background
                          onPrimary: ThemeConstants.whitecolor, // foreground
                        ),
                        onPressed: () {},
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
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: ThemeConstants.bluecolor, // background
                          onPrimary: ThemeConstants.bluecolor, // foreground
                        ),
                        onPressed: () {},
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
