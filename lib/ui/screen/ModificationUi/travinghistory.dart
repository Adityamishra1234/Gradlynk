import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';

class TravingHistory extends StatelessWidget {
  const TravingHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: Row(
            children: [
              CustomAutoSizeTextMontserrat(
                text: "Have you travelled Abroad?",
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              const Spacer(),
              SizedBox(
                height: 30,
                child: TextButton(
                    onPressed: () {},
                    child: CustomAutoSizeTextMontserrat(
                      text: "View Details",
                      textColor: ThemeConstants.orangeColor,
                    )),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50,
          child: CustomDropDownSingle(
            model: ["Yes", "No"],
            initialSelectedValue: "No",
            choosefieldtype: false,
            callbackFunction: callback,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: CustomAutoSizeTextMontserrat(
              text: "Travel Status",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: CustomDropDownSingle(
            model: ["Yes", "No"],
            initialSelectedValue: "No",
            choosefieldtype: false,
            callbackFunction: callback,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: CustomAutoSizeTextMontserrat(
              text: "Selected Country",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: CustomDropDownSingle(
            model: ["Yes", "No"],
            initialSelectedValue: "No",
            choosefieldtype: false,
            callbackFunction: callback,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: CustomAutoSizeTextMontserrat(
              text: "Type Of Visa",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: CustomDropDownSingle(
            model: ["Yes", "No"],
            initialSelectedValue: "No",
            choosefieldtype: false,
            callbackFunction: callback,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: CustomAutoSizeTextMontserrat(
              text: "Visa Status",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: CustomDropDownSingle(
            model: ["Yes", "No"],
            initialSelectedValue: "No",
            choosefieldtype: false,
            callbackFunction: callback,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: CustomAutoSizeTextMontserrat(
              text: "Date of application",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: "Enter date of application",
              filled: true,
              fillColor: ThemeConstants.lightblueColor,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            style: ThemeConstants.montserrattextstyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: CustomAutoSizeTextMontserrat(
              text: "Date of reject",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: "Enter date of reject",
              filled: true,
              fillColor: ThemeConstants.lightblueColor,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            style: ThemeConstants.montserrattextstyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: CustomAutoSizeTextMontserrat(
              text: "Reason of rejection",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: "Enter reason of rejection",
              filled: true,
              fillColor: ThemeConstants.lightblueColor,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            style: ThemeConstants.montserrattextstyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: CustomAutoSizeTextMontserrat(
              text: "Proof Available",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: CustomDropDownSingle(
            model: ["Yes", "No"],
            initialSelectedValue: "No",
            choosefieldtype: false,
            callbackFunction: callback,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20),
                child: SizedBox(
                  width: 90,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        primary: ThemeConstants.bluecolor, // background
                        onPrimary: ThemeConstants.bluecolor, // foreground
                      ),
                      onPressed: () async {
                        // Api call
                      },
                      child: CustomAutoSizeTextMontserrat(
                        text: "Added",
                        textColor: ThemeConstants.whitecolor,
                      )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  callback(varTopic) {}
}
