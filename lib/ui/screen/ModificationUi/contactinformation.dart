import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownprofilepage.dart';

class ContactInformationCopy extends StatefulWidget {
  const ContactInformationCopy({Key? key}) : super(key: key);
  static const routeNamed = '/ContactInformationCopy';

  @override
  State<ContactInformationCopy> createState() => _ContactInformationCopyState();
}

class _ContactInformationCopyState extends State<ContactInformationCopy> {
  bool saveAndEdit = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("title"),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Contact Information",
                textColor: ThemeConstants.bluecolor,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Row(
                children: [
                  CustomAutoSizeTextMontserrat(
                    text: "Mobile Number",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    textColor: ThemeConstants.TextColor,
                  ),
                  const Spacer(),
                  if (saveAndEdit == false)
                    TextButton(
                        onPressed: () {
                          saveAndEdit = true;
                          setState(() {});
                        },
                        child: CustomAutoSizeTextMontserrat(
                          text: "save",
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          textColor: ThemeConstants.bluecolor,
                        )),
                  if (saveAndEdit)
                    TextButton(
                        onPressed: () {
                          saveAndEdit = false;
                          setState(() {});
                        },
                        child: CustomAutoSizeTextMontserrat(
                          text: "edit",
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          textColor: ThemeConstants.bluecolor,
                        ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              textInputAction: TextInputAction.next,
              readOnly: saveAndEdit,
              decoration: InputDecoration(
                hintText: "Mobile Number",
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
                text: "Email",
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
              readOnly: saveAndEdit,
              decoration: InputDecoration(
                hintText: "Enter your email",
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
                text: "Whatsapp Number",
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
              readOnly: saveAndEdit,
              decoration: InputDecoration(
                hintText: "Enter your Whatsapp Number",
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
                text: "Secondary Number",
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
              readOnly: saveAndEdit,
              decoration: InputDecoration(
                hintText: "Enter your Secondary Number",
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
                text: "Secondary Email",
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
              readOnly: saveAndEdit,
              decoration: InputDecoration(
                hintText: "Enter your Secondary Email",
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
                text: "Country of residence",
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: CustomDropDownProfilePage(
              text: "test1",
              callbackFunction: callback,
              hint: 'Test',
              model: ["1", "2", "3"],
              choosefieldtype: saveAndEdit,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Select State",
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: CustomDropDownProfilePage(
              text: "test1",
              callbackFunction: callback,
              hint: 'Test',
              model: ["1", "2", "3"],
              choosefieldtype: saveAndEdit,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Select City",
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: CustomDropDownProfilePage(
              text: "test1",
              callbackFunction: callback,
              hint: 'Test',
              model: ["1", "2", "3"],
              choosefieldtype: saveAndEdit,
            ),
          ),
        ],
      ),
    );
  }

  // Funcation
  callback(varTopic) {
    // controller.setLoadingHighestQualification(true);

    // dashboardcontroller.setdropdown1(varTopic);
  }
}
