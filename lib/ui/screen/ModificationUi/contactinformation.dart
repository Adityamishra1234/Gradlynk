import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/contactinformationcontroller.dart';
import 'package:studentpanel/ui/models/personalinformation.dart';
import 'package:studentpanel/utils/theme.dart';
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
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController whatsappNumber = TextEditingController();
  TextEditingController secondaryNumber = TextEditingController();
  TextEditingController secondaryEmail = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController zipCode = TextEditingController();
  TextEditingController instagramId = TextEditingController();
  TextEditingController facebookId = TextEditingController();
  TextEditingController snapchatId = TextEditingController();
  var controller = Get.put(ContactInformationController());
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Row(
              children: [
                CustomAutoSizeTextMontserrat(
                  text: "First Name",
                  textColor: ThemeConstants.TextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                if (saveAndEdit == false)
                  TextButton(
                      onPressed: () {
                        saveAndEdit = true;
                        PersonalInformationModel personalInformationModel =
                            PersonalInformationModel();
                        // personalInformationModel.id=controller.
                        // personalInformationModel.gender = gender;
                        personalInformationModel.enquiryName = firstName.text;
                        personalInformationModel.familyName = lastName.text;
                        personalInformationModel.email = email.text;
                        personalInformationModel.secondaryEmail =
                            secondaryEmail.text;
                        personalInformationModel.mobile =
                            int.parse(mobileNumber.text);
                        // personalInformationModel.maritalStatus=
                        // personalInformationModel.childrenCount
                        personalInformationModel.whatsappNumber =
                            int.parse(whatsappNumber.text);
                        // personalInformationModel.alternateNumber=int.parse(al)
                        personalInformationModel.countryId =
                            controller.personalInformationModel.countryId;
                        personalInformationModel.stateId =
                            controller.personalInformationModel.stateId;
                        personalInformationModel.cityId =
                            controller.personalInformationModel.cityId;
                        personalInformationModel.street = street.text;
                        personalInformationModel.zipCode =
                            int.parse(zipCode.text);
                        personalInformationModel.instagramId = instagramId.text;
                        personalInformationModel.facebookId = facebookId.text;
                        personalInformationModel.snapchatId = snapchatId.text;

                        controller.updateData(personalInformationModel);
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
            controller: firstName,
            textInputAction: TextInputAction.next,
            readOnly: saveAndEdit,
            decoration: InputDecoration(
              hintText: "Enter your First Name",
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
              text: "Last Name",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextField(
            controller: lastName,
            textInputAction: TextInputAction.next,
            readOnly: saveAndEdit,
            decoration: InputDecoration(
              hintText: "Enter your Last Name",
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
              text: "Date of Birth",
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
              hintText: "Enter your Date of Birth",
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
              text: "Gender",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 60,
          child: CustomDropDownProfilePage(
            text: "Gender",
            callbackFunction: callbackGender,
            hint: 'Gender',
            searchBox: false,
            model: const ["Male", "Female", "Other"],
            choosefieldtype: saveAndEdit,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: CustomAutoSizeTextMontserrat(
              text: "Marital status",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 60,
          child: CustomDropDownProfilePage(
            text: "Marital status",
            callbackFunction: callbackMaritalStatus,
            hint: 'Marital status',
            model: const [
              "Married",
              "Unmarried",
              "Divorced",
              "Live-in",
              "Annulled Marriage"
            ],
            choosefieldtype: saveAndEdit,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: CustomAutoSizeTextMontserrat(
              text: "Children Count",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 60,
          child: CustomDropDownProfilePage(
            text: "Children Count",
            callbackFunction: callbackChildrenCount,
            hint: 'Children Count',
            model: const ["0", "1", "2", "3", "4"],
            choosefieldtype: saveAndEdit,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: CustomAutoSizeTextMontserrat(
              text: "Mobile Number",
              fontSize: 14,
              fontWeight: FontWeight.bold,
              textColor: ThemeConstants.TextColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextField(
            controller: mobileNumber,
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
            controller: email,
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
            controller: whatsappNumber,
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
            controller: secondaryEmail,
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
            callbackFunction: callbackCountryStateCity,
            hint: 'Test',
            model: controller.countryList ?? [],
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
            callbackFunction: callbackCountryStateCity,
            hint: 'Test',
            model: Get.find<ContactInformationController>().stateList ?? [],
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
            callbackFunction: callbackCountryStateCity,
            hint: 'Test',
            model: Get.find<ContactInformationController>().cityList ?? [],
            choosefieldtype: saveAndEdit,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: CustomAutoSizeTextMontserrat(
              text: "street",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextField(
            controller: street,
            textInputAction: TextInputAction.next,
            readOnly: saveAndEdit,
            decoration: InputDecoration(
              hintText: "Enter your Street",
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
              text: "Zip Code",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextField(
            controller: zipCode,
            textInputAction: TextInputAction.next,
            readOnly: saveAndEdit,
            decoration: InputDecoration(
              hintText: "Enter your Zip Code",
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
        CheckboxListTile(
          title: CustomAutoSizeTextMontserrat(
              text: "Are you available on Social Media"),
          value: true,
          onChanged: (newValue) {
            setState(() {
              // checkedValue = newValue;
            });
          },
          controlAffinity:
              ListTileControlAffinity.leading, //  <-- leading Checkbox
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: CustomAutoSizeTextMontserrat(
              text: "Instagram Id",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextField(
            controller: instagramId,
            textInputAction: TextInputAction.next,
            readOnly: saveAndEdit,
            decoration: InputDecoration(
              hintText: "Enter your Instagram Id",
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
              text: "Facebook Id",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextField(
            controller: facebookId,
            textInputAction: TextInputAction.next,
            readOnly: saveAndEdit,
            decoration: InputDecoration(
              hintText: "Enter your Facebook Id",
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
              text: "Snapchat Id",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextField(
            controller: snapchatId,
            textInputAction: TextInputAction.next,
            readOnly: saveAndEdit,
            decoration: InputDecoration(
              hintText: "Enter your Snapchat Id",
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
              text: "Assigned Advisors",
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
            readOnly: false,
            decoration: InputDecoration(
              hintText: "Shreya IT",
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
              text: "Assigned Branch",
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
            readOnly: false,
            decoration: InputDecoration(
              hintText: "West Delhi",
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
              text: "Service",
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
            readOnly: false,
            decoration: InputDecoration(
              hintText: "Student Visa",
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
              text: "First Country of Interest",
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
            readOnly: false,
            decoration: InputDecoration(
              hintText: "Australia",
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
              text: "Other country interested",
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
            readOnly: false,
            decoration: InputDecoration(
              hintText: "Canada,Ireland,USA",
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
              Spacer(),
              if (saveAndEdit)
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
                        saveAndEdit = false;
                        setState(() {});
                      },
                      child: CustomAutoSizeTextMontserrat(
                        text: "Edit",
                        textColor: ThemeConstants.bluecolor,
                      ),
                    ),
                  ),
                ),
              if (saveAndEdit == false)
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
                        saveAndEdit = true;

                        PersonalInformationModel personalInformationModel =
                            PersonalInformationModel();
                        // personalInformationModel.id=controller.
                        // personalInformationModel.gender = gender;
                        personalInformationModel.enquiryName = firstName.text;
                        personalInformationModel.familyName = lastName.text;
                        personalInformationModel.email = email.text;
                        personalInformationModel.secondaryEmail =
                            secondaryEmail.text;
                        personalInformationModel.mobile =
                            int.parse(mobileNumber.text);
                        // personalInformationModel.maritalStatus=
                        // personalInformationModel.childrenCount
                        personalInformationModel.whatsappNumber =
                            int.parse(whatsappNumber.text);
                        // personalInformationModel.alternateNumber=int.parse(al)
                        personalInformationModel.countryId =
                            controller.personalInformationModel.countryId;
                        personalInformationModel.stateId =
                            controller.personalInformationModel.stateId;
                        personalInformationModel.cityId =
                            controller.personalInformationModel.cityId;
                        personalInformationModel.street = street.text;
                        personalInformationModel.zipCode =
                            int.parse(zipCode.text);
                        personalInformationModel.instagramId = instagramId.text;
                        personalInformationModel.facebookId = facebookId.text;
                        personalInformationModel.snapchatId = snapchatId.text;

                        controller.updateData(personalInformationModel);

                        setState(() {});
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
        const SizedBox(
          height: 300,
        ),
      ],
    );
  }

  // Funcation
  callbackCountryStateCity(varTopic) {
    if (Get.find<ContactInformationController>().loadingCountry.value == true &&
        Get.find<ContactInformationController>().loadingState.value == false) {
      for (var i = 0; i < controller.countryList.length; i++) {
        if (controller.countryList[i] == varTopic) {
          controller.personalInformationModel.countryId =
              int.parse(controller.countryCode[i]);
          controller.getState("[${controller.countryCode[i]}]");
        }
      }
    } else if (Get.find<ContactInformationController>().loadingCountry.value ==
            true &&
        Get.find<ContactInformationController>().loadingState.value == true &&
        Get.find<ContactInformationController>().loadingCity.value == false) {
      for (var i = 0; i < controller.stateList.length; i++) {
        if (controller.stateList[i] == varTopic) {
          controller.personalInformationModel.stateId =
              int.parse(controller.stateCode[i]);
          controller.getCity("[${controller.stateCode[i]}]");
        }
      }
    } else {}
  }

  callbackGender(varTopic) {
    List<String> temp = ["Male", "Female", "Other"];
    for (var i = 0; i < temp.length; i++) {
      if (temp[i] == varTopic) {
        controller.personalInformationModel.genderId = i;
      }
    }
  }

  callbackMaritalStatus(varTopic) {
    List<String> temp = [
      "Married",
      "Unmarried",
      "Divorced",
      "Live-in",
      "Annulled Marriage"
    ];
    for (var i = 0; i < temp.length; i++) {
      if (temp[i] == varTopic) {
        controller.personalInformationModel.maritalStatusId = i;
      }
    }
  }

  callbackChildrenCount(varTopic) {
    controller.personalInformationModel.childrenCount = int.parse(varTopic);
  }
}
