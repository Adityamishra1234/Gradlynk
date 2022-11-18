import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';

class PassportDetails extends StatelessWidget {
  const PassportDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Row(
            children: [
              CustomAutoSizeTextMontserrat(
                text: "Passport Avaliable",
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {},
                  child: CustomAutoSizeTextMontserrat(
                    text: "save",
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    textColor: ThemeConstants.bluecolor,
                  )),
              TextButton(
                  onPressed: () {},
                  child: CustomAutoSizeTextMontserrat(
                    text: "edit",
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    textColor: ThemeConstants.bluecolor,
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 50,
          child: CustomDropDownSingle(
            model: const ["Yes", "No"],
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
              text: "Citizen of",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: CustomDropDownSingle(
            model: const ["Yes", "No"],
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
              text: "Passport Number",
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
              hintText: "Enter passport number",
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
              text: "Country of Issue",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: CustomDropDownSingle(
            model: const ["Yes", "No"],
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
              text: "State of Issue",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: CustomDropDownSingle(
            model: const ["Yes", "No"],
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
              text: "Place of Issue",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: CustomDropDownSingle(
            model: const ["Yes", "No"],
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
              text: "Date Of Issue",
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
              hintText: "Enter your date",
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
              text: "Expire Date",
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
              hintText: "Enter expiry date",
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
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: SizedBox(
                  width: 100,
                  height: 35,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: ThemeConstants.bluecolor),
                      primary: ThemeConstants.whitecolor, // background
                      onPrimary: ThemeConstants.whitecolor, // foreground
                    ),
                    onPressed: () {
                      // saveAndEdit = false;
                      // setState(() {});
                    },
                    child: CustomAutoSizeTextMontserrat(
                      text: "Edit",
                      textColor: ThemeConstants.bluecolor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: SizedBox(
                  width: 100,
                  height: 35,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: ThemeConstants.bluecolor),
                      primary: ThemeConstants.whitecolor, // background
                      onPrimary: ThemeConstants.whitecolor, // foreground
                    ),
                    onPressed: () {
                      // Id and Dob const
                    },
                    child: CustomAutoSizeTextMontserrat(
                      text: "Save",
                      textColor: ThemeConstants.bluecolor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom)),
      ],
    );
  }

  callback(varTopic) {
    // viewDetails = false;
  }
}
