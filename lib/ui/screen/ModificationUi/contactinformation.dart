import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/contactinformationcontroller.dart';
import 'package:studentpanel/ui/models/personalinformation.dart';

import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customDatePicker.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';

class ContactInformationCopy extends StatefulWidget {
  ContactInformationCopy({Key? key}) : super(key: key);
  static const routeNamed = '/ContactInformationCopy';

  @override
  State<ContactInformationCopy> createState() => _ContactInformationCopyState();
}

class _ContactInformationCopyState extends State<ContactInformationCopy> {
  bool saveAndEdit = true;
  static TextEditingController firstName = TextEditingController();
  static TextEditingController lastName = TextEditingController();
  static TextEditingController mobileNumber = TextEditingController();
  static TextEditingController alt_Number = TextEditingController();
  static TextEditingController email = TextEditingController();
  static TextEditingController whatsappNumber = TextEditingController();
  static TextEditingController secondaryNumber = TextEditingController();
  static TextEditingController secondaryEmail = TextEditingController();
  static TextEditingController street = TextEditingController();
  static TextEditingController zipCode = TextEditingController();
  static TextEditingController instagramId = TextEditingController();
  static TextEditingController facebookId = TextEditingController();
  static TextEditingController snapchatId = TextEditingController();

  static TextEditingController otherCountryinterested = TextEditingController();
  static TextEditingController assignedBranch = TextEditingController();
  static TextEditingController service = TextEditingController();
  static TextEditingController firstCountryInterest = TextEditingController();
  static TextEditingController assignedAdvisors = TextEditingController();

  var controller = Get.put(ContactInformationController());
  GlobalKey globalKey = GlobalKey();
  bool socialMedia = false;
  List gender = ["Select gender", "Male", "Female", "Other"];
  List martialStatus = [
    "Select marital status",
    "Married",
    "Unmarried",
    "Divorced",
    "Live-in",
    "Annulled Marriage"
  ];

  // Local key
  static final firstNameKey = GlobalKey<FormState>();
  static final lastNameKey = GlobalKey<FormState>();
  static final mobileNameKey = GlobalKey<FormState>();
  static final alternateNumberKey = GlobalKey<FormState>();
  static final emailKey = GlobalKey<FormState>();
  static final whatsappNumberkey = GlobalKey<FormState>();
  static final secondaryemailKey = GlobalKey<FormState>();
  static final streetkey = GlobalKey<FormState>();
  static final zipcodekey = GlobalKey<FormState>();
  static final instragramkey = GlobalKey<FormState>();
  static final facebookkey = GlobalKey<FormState>();
  static final snapchatkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactInformationController>(builder: (_) {
      if (_.loadingStudentPanelData.value == 1) {
        for (var i = 0; i < _.model.addtionalDetails!.length; i++) {
          if (_.model.addtionalDetails![i].serviceName == "Student Visa") {
            assignedBranch.text = _.model.addtionalDetails![i].branchName ?? "";
            service.text = _.model.addtionalDetails![i].serviceName ?? "";
            firstCountryInterest.text =
                _.model.addtionalDetails![i].countryName ?? "";
            assignedAdvisors.text =
                _.model.addtionalDetails![i].assigned_advisor! +
                    _.model.addtionalDetails![i].assigne!;
          }
        }
        firstName.text = _.model.enquiryName ?? "";
        lastName.text = _.model.lastname ?? "";
        mobileNumber.text = getNUllChecker(_.model.mobile) == false
            ? _.model.mobile.toString()
            : "";
        email.text = _.model.email ?? "";
        whatsappNumber.text =
            getNUllChecker(_.model.whatsappNumber.toString()) == false
                ? _.model.whatsappNumber.toString()
                : "";
        alt_Number.text =
            getNUllChecker(_.model.alternateNumber.toString()) == false
                ? _.model.alternateNumber.toString()
                : "";
        _.selectedChildCount = _.model.child_count.toString();
        secondaryEmail.text = _.model.secondaryEmail ?? "";
        street.text = _.model.street ?? "";
        zipCode.text = getNUllChecker(_.model.pincode) == false
            ? _.model.pincode.toString()
            : "";
        _.genderSelected = _.model.gender ?? gender[0];
        _.maritalStatusSelected = _.model.maritalStatus;
        _.countrySelected = _.model.countryName;
        _.stateSelected = _.model.stateName;
        _.citySelected = _.model.cityName;
        String? temp = "";
        if (_.model.otherCountryOfInterest != null) {
          for (var i = 0; i < _.model.otherCountryOfInterest!.length; i++) {
            if (i == 0) {
              temp = _.model.otherCountryOfInterest![i].countryName!;
            } else {
              temp =
                  "${temp!},${_.model.otherCountryOfInterest![i].countryName!}";
            }
          }
        }
        otherCountryinterested.text = temp!;
        _.loadingStudentPanelData.value = 3;
        _.update();
      }

      return _.loadingStudentPanelData.value == 3
          ? SingleChildScrollView(
              reverse: false,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: InkWell(
                    onTap: () {
                      Get.snackbar(
                          "Image Upload Process ", "Image Upload Process",
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
                      backgroundImage: const NetworkImage(
                          "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250"),
                      backgroundColor: Colors.transparent,
                    ),
                  )),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Row(
                        children: [
                          CustomAutoSizeTextMontserrat(
                            text: "First Name",
                            //textColor: ThemeConstants.TextColor,
                            mandatory: true,
                            fontSize: 16,
                            // fontWeight: FontWeight.bold,
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
                                      _.genderId!,
                                      _.maritalStatusId!,
                                      _.childrenCount!,
                                      mobileNumber.text,
                                      email.text,
                                      int.parse(whatsappNumber.text),
                                      int.parse(alt_Number.text),
                                      _.countryId!,
                                      _.stateId!,
                                      _.cityId!,
                                      street.text,
                                      int.parse(zipCode.text),
                                      facebookId.text,
                                      snapchatId.text,
                                      instagramId.text,
                                      secondaryEmail.text);
                                },
                                child: CustomAutoSizeTextMontserrat(
                                  text: "save",
                                  // fontWeight: FontWeight.bold,
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
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  textColor: ThemeConstants.bluecolor,
                                ))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Form(
                      key: firstNameKey,
                      child: TextFormField(
                        controller: firstName,
                        scrollPadding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).viewInsets.bottom + 30),
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
                        style: ThemeConstants.montserrattextstyle2,
                        onChanged: (value) {
                          if (firstNameKey.currentState!.validate()) {
                            firstNameKey.currentState!.save();
                          }
                        },
                        validator: (value) {
                          if (value == "") {
                            return "Please enter First Name";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomAutoSizeTextMontserrat(
                        text: "Last Name",
                        mandatory: true,
                        // textColor: ThemeConstants.blackcolor,
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Form(
                      key: lastNameKey,
                      child: TextFormField(
                        controller: lastName,
                        scrollPadding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).viewInsets.bottom + 30),
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
                        style: ThemeConstants.montserrattextstyle2,
                        onChanged: (value) {
                          if (lastNameKey.currentState!.validate()) {
                            lastNameKey.currentState!.save();
                          }
                        },
                        validator: (value) {
                          if (value == "") {
                            return "Please enter Last Name";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomAutoSizeTextMontserrat(
                        text: "Date of Birth",
                        mandatory: true,
                        //textColor: ThemeConstants.TextColor,
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
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
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomAutoSizeTextMontserrat(
                        text: "Gender",
                        mandatory: true,
                        //textColor: ThemeConstants.TextColor,
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CustomDropDownSingle(
                    model: getDropdownModel(true, _.genderSelected, gender),
                    callbackFunction: callbackGender,
                    initialSelectedValue:
                        getSelectedDropDown(true, _.genderSelected, gender),
                    choosefieldtype: saveAndEdit,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomAutoSizeTextMontserrat(
                        text: "Marital status",
                        mandatory: true,
                        //textColor: ThemeConstants.TextColor,
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CustomDropDownSingle(
                    model: getDropdownModel(_.loadingmartialStatus.value,
                        _.maritalStatusSelected, _.martialStatusList),
                    callbackFunction: callbackMaritalStatus,
                    initialSelectedValue: getSelectedDropDown(
                        _.loadingmartialStatus.value,
                        _.maritalStatusSelected,
                        _.martialStatusList),
                    choosefieldtype: saveAndEdit,
                  ),
                  if (_.maritalStatusId == 1 || _.maritalStatusId == 3)
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Children Count",
                          //textColor: ThemeConstants.TextColor,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  if (_.maritalStatusId == 1 || _.maritalStatusId == 3)
                    CustomDropDownSingle(
                      model: const ["0", "1", "2", "3", "4"],
                      callbackFunction: callbackChildrenCount,
                      initialSelectedValue: _.childrenCount != null
                          ? _.childrenCount.toString()
                          : "0",
                      choosefieldtype: saveAndEdit,
                    ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomAutoSizeTextMontserrat(
                        text: "Mobile Number",
                        mandatory: true,
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                        //textColor: ThemeConstants.TextColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Form(
                      key: mobileNameKey,
                      child: TextFormField(
                        controller: mobileNumber,
                        keyboardType: TextInputType.number,
                        scrollPadding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).viewInsets.bottom + 30),
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
                        style: ThemeConstants.montserrattextstyle2,
                        onChanged: (value) {
                          // RenderObject? object =
                          //     globalKey.currentContext!.findRenderObject();
                          // object!.showOnScreen();
                          if (mobileNameKey.currentState!.validate()) {
                            mobileNameKey.currentState!.save();
                          }
                        },
                        validator: (value) {
                          return getPhoneNumbervalidation(value);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomAutoSizeTextMontserrat(
                        text: "Alternate Number",
                        mandatory: true,
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                        //textColor: ThemeConstants.TextColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Form(
                      key: alternateNumberKey,
                      child: TextFormField(
                        controller: alt_Number,
                        keyboardType: TextInputType.number,
                        scrollPadding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).viewInsets.bottom + 30),
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
                        style: ThemeConstants.montserrattextstyle2,
                        onChanged: (value) {
                          RenderObject? object =
                              globalKey.currentContext!.findRenderObject();
                          object!.showOnScreen();
                          if (alternateNumberKey.currentState!.validate()) {
                            alternateNumberKey.currentState!.save();
                          }
                        },
                        validator: (value) {
                          return getPhoneNumbervalidation(value);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomAutoSizeTextMontserrat(
                        text: "Email",
                        mandatory: true,
                        //textColor: ThemeConstants.TextColor,
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Form(
                      key: emailKey,
                      child: TextFormField(
                        controller: email,
                        scrollPadding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).viewInsets.bottom + 30),
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
                        style: ThemeConstants.montserrattextstyle2,
                        onChanged: (value) {
                          if (emailKey.currentState!.validate()) {
                            emailKey.currentState!.save();
                          }
                        },
                        validator: (value) {
                          return getEmailvaliation(value);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomAutoSizeTextMontserrat(
                        text: "Whatsapp Number",
                        //textColor: ThemeConstants.TextColor,
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Form(
                      key: whatsappNumberkey,
                      child: TextFormField(
                        controller: whatsappNumber,
                        keyboardType: TextInputType.number,
                        scrollPadding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).viewInsets.bottom + 30),
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
                        style: ThemeConstants.montserrattextstyle2,
                        onChanged: (value) {
                          if (whatsappNumberkey.currentState!.validate()) {
                            whatsappNumberkey.currentState!.save();
                          }
                        },
                        validator: (value) {
                          return getPhoneNumbervalidation(value);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomAutoSizeTextMontserrat(
                        text: "Secondary Email",
                        //textColor: ThemeConstants.TextColor,
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Form(
                      key: secondaryemailKey,
                      child: TextFormField(
                        controller: secondaryEmail,
                        scrollPadding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).viewInsets.bottom + 30),
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
                        style: ThemeConstants.montserrattextstyle2,
                        onChanged: (value) {
                          if (secondaryemailKey.currentState!.validate()) {
                            secondaryemailKey.currentState!.save();
                          }
                        },
                        validator: (value) {
                          return getEmailvaliation(value);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomAutoSizeTextMontserrat(
                        text: "Country of residence",
                        mandatory: true,
                        //textColor: ThemeConstants.TextColor,
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CustomDropDownSingle(
                    model: getDropdownModel(_.loadingCountry.value,
                        _.countrySelected, _.countryList),
                    callbackFunction: callbackCountry,
                    initialSelectedValue: getSelectedDropDown(
                        _.loadingCountry.value,
                        _.countrySelected,
                        _.countryList),
                    choosefieldtype: saveAndEdit,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomAutoSizeTextMontserrat(
                        text: "Select State",
                        mandatory: true,
                        //textColor: ThemeConstants.TextColor,
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CustomDropDownSingle(
                    model: getDropdownModel(
                        _.loadingState.value, _.stateSelected, _.stateList),
                    callbackFunction: calllbackState,
                    initialSelectedValue: getSelectedDropDown(
                        _.loadingState.value, _.stateSelected, _.stateList),
                    choosefieldtype: saveAndEdit,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomAutoSizeTextMontserrat(
                        text: "Select City",
                        mandatory: true,
                        //textColor: ThemeConstants.TextColor,
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CustomDropDownSingle(
                    model: getDropdownModel(
                        _.loadingCity.value, _.citySelected, _.cityList),
                    callbackFunction: callbackCity,
                    initialSelectedValue: getSelectedDropDown(
                        _.loadingCity.value, _.citySelected, _.cityList),
                    choosefieldtype: saveAndEdit,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomAutoSizeTextMontserrat(
                        text: "street",
                        //textColor: ThemeConstants.TextColor,
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Form(
                      key: streetkey,
                      child: TextFormField(
                        controller: street,
                        scrollPadding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).viewInsets.bottom + 30),
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
                        style: ThemeConstants.montserrattextstyle2,
                        onChanged: (value) {
                          if (streetkey.currentState!.validate()) {
                            streetkey.currentState!.save();
                          }
                        },
                        validator: (value) {
                          if (value == "") {
                            return "Please enter street";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomAutoSizeTextMontserrat(
                        text: "Zip Code",
                        mandatory: true,
                        //textColor: ThemeConstants.TextColor,
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Form(
                      key: zipcodekey,
                      child: TextFormField(
                        controller: zipCode,
                        keyboardType: TextInputType.number,
                        scrollPadding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).viewInsets.bottom + 30),
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
                        style: ThemeConstants.montserrattextstyle2,
                        onChanged: (value) {
                          if (zipcodekey.currentState!.validate()) {
                            zipcodekey.currentState!.save();
                          }
                        },
                        validator: (value) {
                          if (value == "") {
                            return "Please enter Zip code";
                          } else {
                            return null;
                          }
                        },
                      ),
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
                    controlAffinity: ListTileControlAffinity
                        .leading, //  <-- leading Checkbox
                  ),
                  if (socialMedia == true)
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Instagram Id",
                          //textColor: ThemeConstants.TextColor,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  if (socialMedia == true)
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Form(
                        key: instragramkey,
                        child: TextFormField(
                          controller: instagramId,
                          scrollPadding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).viewInsets.bottom +
                                      30),
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
                          style: ThemeConstants.montserrattextstyle2,
                          onChanged: (value) {
                            if (instragramkey.currentState!.validate()) {
                              instragramkey.currentState!.save();
                            }
                          },
                          validator: (value) {
                            if (value == "") {
                              return "Please enter Instagram";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                  if (socialMedia == true)
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Facebook Id",
                          //textColor: ThemeConstants.TextColor,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  if (socialMedia == true)
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Form(
                        key: facebookkey,
                        child: TextFormField(
                          controller: facebookId,
                          scrollPadding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).viewInsets.bottom +
                                      30),
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
                          style: ThemeConstants.montserrattextstyle2,
                          onChanged: (value) {
                            if (facebookkey.currentState!.validate()) {
                              facebookkey.currentState!.save();
                            }
                          },
                          validator: (value) {
                            if (value == "") {
                              return "Please enter Facebook";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                  if (socialMedia == true)
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Snapchat Id",
                          //textColor: ThemeConstants.TextColor,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  if (socialMedia == true)
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Form(
                        key: snapchatkey,
                        child: TextFormField(
                          controller: snapchatId,
                          scrollPadding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).viewInsets.bottom +
                                      30),
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
                          style: ThemeConstants.montserrattextstyle2,
                          onChanged: (value) {
                            if (firstNameKey.currentState!.validate()) {
                              firstNameKey.currentState!.save();
                            }
                          },
                          validator: (value) {
                            if (value == "") {
                              return "Please enter snapchat";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomAutoSizeTextMontserrat(
                        text: "Assigned Advisors",
                        //textColor: ThemeConstants.TextColor,
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
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
                          vertical:
                              MediaQuery.of(context).viewInsets.bottom + 30),
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: assignedAdvisors.text,
                        filled: true,
                        fillColor: ThemeConstants.lightblueColor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      style: ThemeConstants.montserrattextstyle2,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomAutoSizeTextMontserrat(
                        text: "Assigned Branch",
                        //textColor: ThemeConstants.TextColor,
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
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
                          vertical:
                              MediaQuery.of(context).viewInsets.bottom + 30),
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: assignedBranch.text,
                        filled: true,
                        fillColor: ThemeConstants.lightblueColor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      style: ThemeConstants.montserrattextstyle2,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomAutoSizeTextMontserrat(
                        text: "Service",
                        //textColor: ThemeConstants.TextColor,
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
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
                          vertical:
                              MediaQuery.of(context).viewInsets.bottom + 30),
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: service.text,
                        filled: true,
                        fillColor: ThemeConstants.lightblueColor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      style: ThemeConstants.montserrattextstyle2,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomAutoSizeTextMontserrat(
                        text: "First Country of Interest",
                        //textColor: ThemeConstants.TextColor,
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
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
                          vertical:
                              MediaQuery.of(context).viewInsets.bottom + 30),
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: firstCountryInterest.text,
                        filled: true,
                        fillColor: ThemeConstants.lightblueColor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      style: ThemeConstants.montserrattextstyle2,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomAutoSizeTextMontserrat(
                        text: "Other country interested",
                        //textColor: ThemeConstants.TextColor,
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: TextField(
                      onTap: () {
                        getToast("Auto Selected");
                      },
                      // controller: otherCountryinterested,
                      scrollPadding: EdgeInsets.symmetric(
                          vertical:
                              MediaQuery.of(context).viewInsets.bottom + 30),
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: otherCountryinterested.text,
                        filled: true,
                        fillColor: ThemeConstants.lightblueColor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      style: ThemeConstants.montserrattextstyle2,
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
                                  foregroundColor: ThemeConstants.whitecolor,
                                  side: BorderSide(
                                      color: ThemeConstants.bluecolor),
                                  backgroundColor:
                                      ThemeConstants.whitecolor, // foreground
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
                                  foregroundColor: ThemeConstants.whitecolor,
                                  side: BorderSide(
                                      color: ThemeConstants.bluecolor),
                                  backgroundColor:
                                      ThemeConstants.whitecolor, // foreground
                                ),
                                onPressed: () {
                                  // Id and Dob const
                                  updatePesonalDetail(
                                      78623,
                                      firstName.text,
                                      lastName.text,
                                      _.dob,
                                      _.genderId!,
                                      _.maritalStatusId!,
                                      _.childrenCount!,
                                      mobileNumber.text,
                                      email.text,
                                      int.parse(whatsappNumber.text),
                                      int.parse(alt_Number.text),
                                      _.countryId!,
                                      _.stateId!,
                                      _.cityId!,
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
            )
          : const Center(
              child: CircularProgressIndicator(),
            );
    });
  }

  // Funcation

  callbackCity(varTopic) {
    for (var i = 0; i < controller.cityList.length; i++) {
      if (i == 0) {
      } else {
        if (controller.cityList[i] == varTopic) {
          controller.citySelected = controller.cityList[i];
          controller.cityId = int.parse(controller.cityCode[i]);
          // controller.getCity("${controller.cityCode[i]}");
          controller.update();
        }
      }
    }
    // setState(() {});
  }

  calllbackState(varTopic) {
    for (var i = 0; i < controller.stateList.length; i++) {
      if (i == 0) {
      } else {
        if (controller.stateList[i] == varTopic) {
          controller.stateSelected = varTopic;
          controller.stateId = int.parse(controller.stateCode[i]);
          controller.getCity(controller.stateCode[i]);
        }
      }
    }
  }

  callbackCountry(varTopic) {
    for (var i = 0; i < controller.countryList.length; i++) {
      if (i == 0) {
      } else {
        if (controller.countryList[i] == varTopic) {
          controller.countrySelected = varTopic;
          controller.countryId = int.parse(controller.countryCode[i]);
          controller.getState(controller.countryCode[i]);
          controller.update();
        }
      }
    }
  }

  callbackGender(varTopic) {
    for (var i = 0; i < gender.length; i++) {
      if (gender[i].toString() == varTopic.toString()) {
        controller.genderSelected = gender[i];
        controller.genderId = i + 1;
        controller.update();
      }
    }
  }

  callbackMaritalStatus(varTopic) {
    for (var i = 1; i < controller.martialStatusList.length; i++) {
      if (controller.martialStatusList[i].toString() == varTopic.toString()) {
        controller.maritalStatusSelected = controller.martialStatusList[i];
        controller.maritalStatusId = i;
        controller.update();
      }
    }
  }

  callbackChildrenCount(varTopic) {
    controller.childrenCount = int.parse(varTopic);
    setState(() {});
  }

  callbackDOB(data) {
    controller.dob = data;
    controller.update();
  }

  updatePesonalDetail(
      int id,
      String firstName,
      String lastName,
      String? dateOfBirth,
      int genderId,
      int maritalStatusId,
      int childCount,
      String mobile,
      String email,
      int whatsappNumber,
      int secondaryNumber,
      int countryId,
      int stateId,
      int cityId,
      String street,
      int pincode,
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
            alternateNumber: secondaryNumber,
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

  List getDropdownModel(bool loading, String? selected, List model) {
    if (loading == true) {
      return model;
    } else {
      return ["No data"];
    }
  }

  String getSelectedDropDown(bool loading, String? selected, List model) {
    if (loading == true) {
      if (selected == null) {
        return model[0].toString();
      } else {
        return selected;
      }
    } else {
      return "No data";
    }
  }
}
