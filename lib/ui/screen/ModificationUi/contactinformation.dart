import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/contactinformationcontroller.dart';
import 'package:studentpanel/ui/models/personalinformation.dart';
import 'package:studentpanel/ui/models/studentpanel.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customDatePicker.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';

class ContactInformationCopy extends StatefulWidget {
  StudentPanel model = StudentPanel();
  ContactInformationCopy({Key? key, required this.model}) : super(key: key);
  static const routeNamed = '/ContactInformationCopy';

  @override
  State<ContactInformationCopy> createState() => _ContactInformationCopyState();
}

class _ContactInformationCopyState extends State<ContactInformationCopy> {
  bool saveAndEdit = true;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController alt_Number = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController whatsappNumber = TextEditingController();
  TextEditingController secondaryNumber = TextEditingController();
  TextEditingController secondaryEmail = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController zipCode = TextEditingController();
  TextEditingController instagramId = TextEditingController();
  TextEditingController facebookId = TextEditingController();
  TextEditingController snapchatId = TextEditingController();
  TextEditingController assignedBranch = TextEditingController();
  TextEditingController service = TextEditingController();
  TextEditingController firstCountryInterest = TextEditingController();
  TextEditingController otherCountryinterested = TextEditingController();
  int? genderId, maritalStatusId, childrenCount, countryId, stateId, cityId;
  String? initialSelectedGender,
      initialSelectedMaritalStatus,
      initialSelectedChildCount,
      initialSelectedCountry,
      initialSelectedState,
      initialSelectedCity;
  var controller = Get.put(ContactInformationController());
  GlobalKey globalKey = GlobalKey();
  bool socialMedia = false;

  @override
  void initState() {
    // TODO: implement initState
    firstName.text = widget.model.enquiryName ?? "";
    // lastName.text=widget.model.familyname
    mobileNumber.text = getNUllChecker(widget.model.mobile) == false
        ? widget.model.mobile.toString()
        : "";
    email.text = widget.model.email ?? "";
    // whatsappNumber.text=widget.model.what
    // secondaryNumber.text=widget.model.
    // secondaryEmail.text=widget.
    street.text = widget.model.street ?? "";
    zipCode.text = getNUllChecker(widget.model.pincode) == false
        ? widget.model.pincode.toString()
        : "";
    //  instagramId
    //   facebookId
    //   snapchatId
//  genderId, maritalStatusId, childrenCount, countryId, stateId, cityId;
    // String? initialSelectedGender,
    //     initialSelectedMaritalStatus,
    //     initialSelectedChildCount,
    //     initialSelectedCountry,
    //     initialSelectedState,
    //     initialSelectedState;
    initialSelectedGender = widget.model.gender ?? "Male";
    initialSelectedMaritalStatus = widget.model.maritalStatus ?? "Married";
    // initialSelectedChildCount=widget.model.
    initialSelectedCountry = widget.model.countryName ?? "India";
    initialSelectedState = widget.model.stateName ?? "";
    initialSelectedCity = widget.model.cityName ?? "";
    String? temp = "";
    if (widget.model.otherCountryOfInterest != null) {
      for (var i = 0; i < widget.model.otherCountryOfInterest!.length; i++) {
        if (i == 0) {
          temp = widget.model.otherCountryOfInterest![i].countryName!;
        } else {
          temp =
              "${temp!},${widget.model.otherCountryOfInterest![i].countryName!}";
        }
      }
    }
    otherCountryinterested.text = temp!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: false,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Center(
              child: InkWell(
            onTap: () {
              Get.snackbar("Image Upload Process ", "Image Upload Process",
                  snackPosition: SnackPosition.BOTTOM);
            },
            child: CircleAvatar(
              onBackgroundImageError: (exception, stackTrace) {
                print(exception);
                print(stackTrace.toString());
              },
              // onForegroundImageError: (exception, stackTrace) {
              //   print(exception);
              //   print(stackTrace.toString());
              // },
              radius: 80.0,
              backgroundImage: NetworkImage(
                  "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250"),
              backgroundColor: Colors.transparent,
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Row(
                children: [
                  CustomAutoSizeTextMontserrat(
                    text: "First Name",
                    textColor: ThemeConstants.TextColor,
                    mandatory: true,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  const Spacer(),
                  if (saveAndEdit == false)
                    TextButton(
                        onPressed: () {
                          updatePesonalDetail(
                              78623,
                              firstName.text,
                              lastName.text,
                              "12/13/1990",
                              genderId!,
                              maritalStatusId!,
                              childrenCount!,
                              mobileNumber.text,
                              email.text,
                              int.parse(whatsappNumber.text),
                              // int.parse(secondaryNumber.text),
                              countryId!,
                              stateId!,
                              cityId!,
                              street.text,
                              int.parse(zipCode.text),
                              facebookId.text,
                              snapchatId.text,
                              instagramId.text,
                              secondaryEmail.text);
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
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
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
                mandatory: true,
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
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
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
                mandatory: true,
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: DatePickerExample(
              enableField: saveAndEdit,
              callbackDate: callbackDOB,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Gender",
                mandatory: true,
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CustomDropDownSingle(
            model: const ["Male", "Female", "Other"],
            callbackFunction: callbackGender,
            initialSelectedValue: initialSelectedGender ?? "Male",
            choosefieldtype: saveAndEdit,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Marital status",
                mandatory: true,
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CustomDropDownSingle(
            model: const [
              "Married",
              "Unmarried",
              "Divorced",
              "Live-in",
              "Annulled Marriage"
            ],
            callbackFunction: callbackMaritalStatus,
            initialSelectedValue: initialSelectedMaritalStatus ?? "Married",
            choosefieldtype: saveAndEdit,
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
          CustomDropDownSingle(
            model: const ["0", "1", "2", "3", "4"],
            callbackFunction: callbackChildrenCount,
            initialSelectedValue: initialSelectedChildCount ?? "0",
            choosefieldtype: saveAndEdit,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Mobile Number",
                mandatory: true,
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
              keyboardType: TextInputType.number,
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
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
              onChanged: (value) {
                RenderObject? object =
                    globalKey.currentContext!.findRenderObject();
                object!.showOnScreen();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Alternate Number",
                mandatory: true,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                textColor: ThemeConstants.TextColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              controller: alt_Number,
              keyboardType: TextInputType.number,
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
              readOnly: saveAndEdit,
              decoration: InputDecoration(
                hintText: "Alternate Number",
                filled: true,
                fillColor: ThemeConstants.lightblueColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              style: ThemeConstants.montserrattextstyle,
              onChanged: (value) {
                RenderObject? object =
                    globalKey.currentContext!.findRenderObject();
                object!.showOnScreen();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Email",
                mandatory: true,
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
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
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
              keyboardType: TextInputType.number,
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
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
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
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
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
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
                mandatory: true,
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CustomDropDownSingle(
            model: controller.loadingCountry.value == true
                ? controller.countryList
                : ["No data"],
            callbackFunction: callbackCountry,
            initialSelectedValue: controller.loadingCountry.value == true
                ? initialSelectedCountry
                : "No data",
            choosefieldtype: saveAndEdit,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Select State",
                mandatory: true,
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CustomDropDownSingle(
            model: controller.loadingState.value == true
                ? controller.stateList
                : ["No data"],
            callbackFunction: calllbackState,
            initialSelectedValue: controller.loadingState.value == true
                ? initialSelectedState
                : "No data",
            choosefieldtype: saveAndEdit,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Select City",
                mandatory: true,
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CustomDropDownSingle(
            model: controller.loadingCity.value == true
                ? controller.cityList
                : ["No data"],
            callbackFunction: callbackCity,
            initialSelectedValue: controller.loadingCity.value == true
                ? controller.cityList[0]
                : "No data",
            choosefieldtype: saveAndEdit,
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
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
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
                mandatory: true,
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
              keyboardType: TextInputType.number,
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
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
            value: socialMedia,
            onChanged: (newValue) {
              setState(() {
                socialMedia = newValue!;
              });
            },
            controlAffinity:
                ListTileControlAffinity.leading, //  <-- leading Checkbox
          ),
          if (socialMedia == true)
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
          if (socialMedia == true)
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: instagramId,
                scrollPadding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).viewInsets.bottom + 30),
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
          if (socialMedia == true)
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
          if (socialMedia == true)
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: facebookId,
                scrollPadding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).viewInsets.bottom + 30),
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
          if (socialMedia == true)
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
          if (socialMedia == true)
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: snapchatId,
                scrollPadding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).viewInsets.bottom + 30),
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
              onTap: () {
                getToast("Auto Selected");
              },
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
              readOnly: true,
              decoration: InputDecoration(
                hintText: "Assigned Advisors",
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
              onTap: () {
                getToast("Auto Selected");
              },
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
              readOnly: true,
              decoration: InputDecoration(
                hintText: "Assiged Advisors",
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
              onTap: () {
                getToast("Auto Selected");
              },
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
              readOnly: true,
              decoration: InputDecoration(
                hintText: "Service",
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
              onTap: () {
                getToast("Auto Selected");
              },
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
              readOnly: true,
              decoration: InputDecoration(
                hintText: "First country of Interest",
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
              onTap: () {
                getToast("Auto Selected");
              },
              controller: otherCountryinterested,
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
              readOnly: true,
              decoration: InputDecoration(
                hintText: "Other Country",
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
                          // Id and Dob const
                          updatePesonalDetail(
                              78623,
                              firstName.text,
                              lastName.text,
                              "12/13/1990",
                              genderId!,
                              maritalStatusId!,
                              childrenCount!,
                              mobileNumber.text,
                              email.text,
                              int.parse(whatsappNumber.text),
                              // int.parse(secondaryNumber.text),
                              countryId!,
                              stateId!,
                              cityId!,
                              street.text,
                              int.parse(zipCode.text),
                              facebookId.text,
                              snapchatId.text,
                              instagramId.text,
                              secondaryEmail.text);
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
      ),
    );
  }

  // Funcation

  callbackCity(varTopic) {
    initialSelectedCity = varTopic;
    for (var i = 0; i < controller.cityList.length; i++) {
      if (controller.cityList[i] == varTopic) {
        cityId = int.parse(controller.cityCode[i]);
        controller.getCity("[${controller.cityCode[i]}]");
      }
    }
    setState(() {});
  }

  calllbackState(varTopic) {
    initialSelectedState = varTopic;
    for (var i = 0; i < controller.stateList.length; i++) {
      if (controller.stateList[i] == varTopic) {
        stateId = int.parse(controller.stateCode[i]);
        controller.getCity("[${controller.stateCode[i]}]");
      }
    }
    setState(() {});
  }

  callbackCountry(varTopic) {
    initialSelectedCountry = varTopic;
    for (var i = 0; i < controller.countryList.length; i++) {
      if (controller.countryList[i] == varTopic) {
        countryId = int.parse(controller.countryCode[i]);
        controller.getState("[${controller.countryCode[i]}]");
      }
    }
    setState(() {});
  }

  callbackGender(varTopic) {
    initialSelectedGender = varTopic;
    List<String> temp = ["Male", "Female", "Other"];
    for (var i = 0; i < temp.length; i++) {
      if (temp[i].toString() == varTopic.toString()) {
        genderId = i + 1;
      }
    }
    setState(() {});
  }

  callbackMaritalStatus(varTopic) {
    initialSelectedMaritalStatus = varTopic;
    List<String> temp = [
      "Married",
      "Unmarried",
      "Divorced",
      "Live-in",
      "Annulled Marriage"
    ];
    for (var i = 1; i < temp.length; i++) {
      if (temp[i].toString() == varTopic.toString()) {
        maritalStatusId = i + 1;
      }
    }
    setState(() {});
  }

  callbackChildrenCount(varTopic) {
    initialSelectedChildCount = varTopic;
    childrenCount = int.parse(varTopic);
    setState(() {});
  }

  callbackDOB(data) {
    controller.dob = data;
    controller.update();
  }

  updatePesonalDetail(
      @required int id,
      @required String firstName,
      @required String lastName,
      @required dateOfBirth,
      @required int genderId,
      @required int maritalStatusId,
      int childCount,
      @required String mobile,
      @required String email,
      int whatsappNumber,
      // int secondaryNumber,
      @required int countryId,
      @required int stateId,
      @required int cityId,
      String street,
      @required int pincode,
      String facebookId,
      String snapchatId,
      String instagramId,
      String secondaryEmail) {
    PersonalInformationModel personalInformationModel =
        PersonalInformationModel(
            id: id,
            dateOfBirth: dateOfBirth,
            genderId: genderId,
            enquiryName: firstName,
            familyName: lastName,
            email: email,
            secondaryEmail: secondaryEmail,
            mobile: mobile,
            maritalStatusId: maritalStatusId,
            childrenCount: childCount,
            whatsappNumber: whatsappNumber,
            // alternateNumber: secondaryNumber,
            countryId: countryId,
            stateId: stateId,
            cityId: cityId,
            street: street,
            zipCode: pincode,
            instagramId: instagramId,
            facebookId: facebookId,
            snapchatId: snapchatId);
    controller.updateData(personalInformationModel);

    // saveAndEdit = true;
    // setState(() {});
  }
}
