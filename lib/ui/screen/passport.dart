import 'package:flutter/material.dart';

import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownbutton.dart';

class Passport extends StatelessWidget {
  const Passport({Key? key}) : super(key: key);

  callback(varTopic) {
    print("mandatory" + varTopic);

    // dashboardcontroller.setdropdown1(varTopic);
  }

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
                    text: "Passport Number",
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
                    callbackFunction: callback,
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
                    text: "Citizen of",
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
                    callbackFunction: callback,
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
                    text: "Country Of Issuse",
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
                    callbackFunction: callback,
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
                    text: "Place Of Issuse",
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
                    callbackFunction: callback,
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
                    text: "Date Of Issuse",
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
                    callbackFunction: callback,
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
                    text: "Expire Date",
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
                    callbackFunction: callback,
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
