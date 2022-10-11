import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/filtercontroller.dart';
import 'package:studentpanel/ui/models/checkbox.dart';
import 'package:studentpanel/ui/models/filterModel.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customgroupcheckboxwithcallback.dart';

class Filter extends StatefulWidget {
  CourseModelFilter courseModelFilter = CourseModelFilter();
  Filter({Key? key, required this.courseModelFilter}) : super(key: key);
  static const routeNamed = '/Filter';

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  List<String>? selectedUniversitylist = [];
  List<String>? selectedintakeMonth = [];
  List<String>? selectedUintakeYear = [];
  List<String>? selectedacademic = [];
  List<String>? selectedBudget = [];
  List<String>? selectedCountryName = [];
  List<String>? selectedSelectRanking = [];
  List<String>? selectedSelectedRanking = [];
  List<String>? selectedInstitutePublicPrivate = [];
  List<String>? selectedInstituteLevel = [];
  List<String>? selectedScholarship = [];
  List<String>? selectedSIECPriority = [];
  List<String>? selectedConditionalOffer = [];
  List<String>? selectedBacklogAcceptable = [];
  List<String>? selectedApplicationFee = [];
  List<String>? selectedOfferTAT = [];
  List<String>? selectedVisaTAT = [];
  List<String>? selectedPlacementSandwichYear = [];
  List<String>? selectedSIECRepresented = [];
  String? itemsSelected;
  CourseModelFilter courseModelFilter = CourseModelFilter();
  int choosefilter = 0;
  var controller = Get.put(FilterController());
  @override
  void initState() {
    courseModelFilter = widget.courseModelFilter;
    controller.courseModelFilter = courseModelFilter;
    controller.filterModel = courseModelFilter.filterModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    courseModelFilter.filterModel = controller.filterModel;
    return Scaffold(
        appBar: CustomAppBar("title"),
        body: GetBuilder<FilterController>(
          builder: (controller1) => Column(
            children: [
              if (controller1.loadingfuncation!.value == true)
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  color: ThemeConstants.lightorangeColor,
                  child: Row(
                    children: [
                      const Spacer(),
                      CustomAutoSizeTextMontserrat(
                        text: "Filter",
                        textColor: ThemeConstants.orangeColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SvgPicture.asset(
                        "assets/icons/filter.svg",
                        color: ThemeConstants.orangeColor,
                        height: 14,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              if (controller1.loadingfuncation!.value == true)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          height: MediaQuery.of(context).size.height - 220,
                          width: MediaQuery.of(context).size.width / 2 - 10,
                          color: ThemeConstants.whitecolor,
                          child: ListView(
                            children: [
                              if (courseModelFilter
                                      .filterModel.universityname !=
                                  null)
                                Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: SizedBox(
                                    height: 40,
                                    child: TextButton(
                                        onPressed: () async {
                                          choosefilter = 0;
                                          if (itemsSelected != null) {
                                            await loadingFilter();
                                          }
                                          setState(() {});
                                        },
                                        child: CustomAutoSizeTextMontserrat(
                                          text: "University Name",
                                        )),
                                  ),
                                ),
                              Align(
                                alignment: AlignmentDirectional.topStart,
                                child: SizedBox(
                                  height: 40,
                                  child: TextButton(
                                      onPressed: () async {
                                        choosefilter = 1;
                                        if (itemsSelected != null) {
                                          await loadingFilter();
                                        }
                                        setState(() {});
                                      },
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Intake Month",
                                      )),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.topStart,
                                child: SizedBox(
                                  height: 40,
                                  child: TextButton(
                                      onPressed: () async {
                                        choosefilter = 2;
                                        if (itemsSelected != null) {
                                          await loadingFilter();
                                        }
                                        setState(() {});
                                      },
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Intake Year",
                                      )),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.topStart,
                                child: SizedBox(
                                  height: 40,
                                  child: TextButton(
                                      onPressed: () async {
                                        choosefilter = 3;
                                        if (itemsSelected != null) {
                                          await loadingFilter();
                                        }
                                        setState(() {});
                                      },
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Academic %",
                                      )),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.topStart,
                                child: SizedBox(
                                  height: 40,
                                  child: TextButton(
                                      onPressed: () async {
                                        choosefilter = 4;
                                        if (itemsSelected != null) {
                                          await loadingFilter();
                                        }
                                        setState(() {});
                                      },
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Budget",
                                      )),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.topStart,
                                child: SizedBox(
                                  height: 40,
                                  child: TextButton(
                                      onPressed: () async {
                                        choosefilter = 5;
                                        if (itemsSelected != null) {
                                          await loadingFilter();
                                        }
                                        setState(() {});
                                      },
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Country Name",
                                      )),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.topStart,
                                child: SizedBox(
                                  height: 40,
                                  child: TextButton(
                                      onPressed: () async {
                                        choosefilter = 17;
                                        if (itemsSelected != null) {
                                          await loadingFilter();
                                        }
                                        setState(() {});
                                      },
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Select Ranking",
                                      )),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.topStart,
                                child: SizedBox(
                                  height: 60,
                                  child: TextButton(
                                      onPressed: () async {
                                        choosefilter = 6;
                                        if (itemsSelected != null) {
                                          await loadingFilter();
                                        }
                                        setState(() {});
                                      },
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Institute -public/private",
                                      )),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.topStart,
                                child: SizedBox(
                                  height: 40,
                                  child: TextButton(
                                      onPressed: () async {
                                        choosefilter = 7;
                                        if (itemsSelected != null) {
                                          await loadingFilter();
                                        }
                                        setState(() {});
                                      },
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Institute Level",
                                      )),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.topStart,
                                child: SizedBox(
                                  height: 40,
                                  child: TextButton(
                                      onPressed: () async {
                                        choosefilter = 8;
                                        if (itemsSelected != null) {
                                          await loadingFilter();
                                        }
                                        setState(() {});
                                      },
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Scholarship",
                                      )),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.topStart,
                                child: SizedBox(
                                  height: 40,
                                  child: TextButton(
                                      onPressed: () async {
                                        choosefilter = 9;
                                        if (itemsSelected != null) {
                                          await loadingFilter();
                                        }
                                        setState(() {});
                                      },
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "SIEC Priority",
                                      )),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.topStart,
                                child: SizedBox(
                                  height: 40,
                                  child: TextButton(
                                      onPressed: () async {
                                        choosefilter = 10;
                                        if (itemsSelected != null) {
                                          await loadingFilter();
                                        }
                                        setState(() {});
                                      },
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Conditional Offer",
                                      )),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.topStart,
                                child: SizedBox(
                                  height: 40,
                                  child: TextButton(
                                      onPressed: () async {
                                        choosefilter = 11;
                                        if (itemsSelected != null) {
                                          await loadingFilter();
                                        }
                                        setState(() {});
                                      },
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Backlog Acceptabe",
                                      )),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.topStart,
                                child: SizedBox(
                                  height: 40,
                                  child: TextButton(
                                      onPressed: () async {
                                        choosefilter = 12;
                                        if (itemsSelected != null) {
                                          await loadingFilter();
                                        }
                                        setState(() {});
                                      },
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Application Fee",
                                      )),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.topStart,
                                child: SizedBox(
                                  height: 40,
                                  child: TextButton(
                                      onPressed: () async {
                                        choosefilter = 13;
                                        if (itemsSelected != null) {
                                          await loadingFilter();
                                        }
                                        setState(() {});
                                      },
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Offer TAT(In days)",
                                      )),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.topStart,
                                child: SizedBox(
                                  height: 40,
                                  child: TextButton(
                                      onPressed: () async {
                                        choosefilter = 14;
                                        if (itemsSelected != null) {
                                          await loadingFilter();
                                        }
                                        setState(() {});
                                      },
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Visa TAT(In days)",
                                      )),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.topStart,
                                child: SizedBox(
                                  height: 60,
                                  child: TextButton(
                                      onPressed: () async {
                                        choosefilter = 15;
                                        if (itemsSelected != null) {
                                          await loadingFilter();
                                        }
                                        setState(() {});
                                      },
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Placement/Sandwich year",
                                      )),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.topStart,
                                child: SizedBox(
                                  height: 40,
                                  child: TextButton(
                                      onPressed: () async {
                                        choosefilter = 16;
                                        if (itemsSelected != null) {
                                          await loadingFilter();
                                        }
                                        setState(() {});
                                      },
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "SIEC Represented",
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height - 220,
                          child: const VerticalDivider()),
                      Padding(
                        padding: const EdgeInsets.only(right: 9),
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height - 220,
                            width: MediaQuery.of(context).size.width / 2 - 10,
                            child: getFilterOption(choosefilter)),
                      ),
                    ],
                  ),
                ),
              if (controller1.loadingfuncation!.value == true)
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  color: ThemeConstants.whitecolor,
                  child: Row(
                    children: [
                      const Spacer(),
                      ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  ThemeConstants.whitecolor),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  ThemeConstants.whitecolor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      side: BorderSide(
                                          color: ThemeConstants.TextColor)))),
                          onPressed: () {},
                          child: CustomAutoSizeTextMontserrat(
                            text: "Clear Filter ",
                            fontWeight: FontWeight.bold,
                            textColor: ThemeConstants.TextColor,
                          )),
                      const Spacer(),
                      ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  ThemeConstants.bluecolor),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  ThemeConstants.bluecolor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      side: BorderSide(
                                          color: ThemeConstants.bluecolor)))),
                          onPressed: () {},
                          child: CustomAutoSizeTextMontserrat(
                            text: "Apply  Filter ",
                            fontWeight: FontWeight.bold,
                            textColor: ThemeConstants.whitecolor,
                          )),
                      const Spacer(),
                    ],
                  ),
                ),
              if (controller1.loadingfuncation!.value == false)
                const Center(child: CircularProgressIndicator()),
            ],
          ),
        ));
  }

  // Function
  Widget getFilterOption(int i) {
    return ListView(
      children: [
        //University Name
        if (i == 0)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.universityname,
            callbackItemSelected: callback,
            itemSelectedlist: selectedUniversitylist,
            indexSelected: "0",
          ),

// Intake Month
        if (i == 1)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.intakeMonth,
            callbackItemSelected: callback,
            itemSelectedlist: selectedintakeMonth,
            indexSelected: "1",
          ),
        // Intake year
        if (i == 2)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.intakeYear,
            callbackItemSelected: callback,
            itemSelectedlist: selectedUintakeYear,
            indexSelected: "2",
          ),

//Academic Percentage
        if (i == 3)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.academicPercentage,
            callbackItemSelected: callback,
            itemSelectedlist: selectedacademic,
            indexSelected: "3",
          ),

        //Budget
        // if (i == 4)
        // CustomgroupCheckBoxCallBack(
        //   data: courseModelFilter.filterModel.academicPercentage,
        //               callbackItemSelected: callback,
        // itemSelectedlist: [],
        //   indexSelected: "3",
        // ),

        //country
        if (i == 5)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.countryName,
            callbackItemSelected: callback,
            itemSelectedlist: selectedCountryName,
            indexSelected: "5",
          ),

        //Select Ranking
        //   CustomgroupCheckBoxCallBack(
        //   data: courseModelFilter.filterModel.countryName,
        //               callbackItemSelected: callback,
        // itemSelectedlist: [],
        //   indexSelected: "5",
        // ),

        // Institute -Public/Private
        if (i == 6)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.institutePrivatePublic,
            callbackItemSelected: callback,
            itemSelectedlist: selectedInstitutePublicPrivate,
            indexSelected: "6",
          ),

        if (i == 7)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.instituteLevel,
            callbackItemSelected: callback,
            itemSelectedlist: selectedInstituteLevel,
            indexSelected: "7",
          ),

        //Scholarship
        if (i == 8)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.scholarship,
            callbackItemSelected: callback,
            itemSelectedlist: selectedScholarship,
            indexSelected: "8",
          ),
        //Siec Priority
        if (i == 9)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.siecPriority,
            callbackItemSelected: callback,
            itemSelectedlist: selectedSIECPriority,
            indexSelected: "9",
          ),

        //Conditional Offer
        if (i == 10)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.conditionalOffer,
            callbackItemSelected: callback,
            itemSelectedlist: selectedConditionalOffer,
            indexSelected: "10",
          ),

        //backlog acceptable
        if (i == 11)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.backlogAcceptable,
            callbackItemSelected: callback,
            itemSelectedlist: selectedBacklogAcceptable,
            indexSelected: "11",
          ),
        //Application Fee
        if (i == 12)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.applicationfee,
            callbackItemSelected: callback,
            itemSelectedlist: selectedApplicationFee,
            indexSelected: "12",
          ),
        if (i == 13)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.offerTAT,
            callbackItemSelected: callback,
            itemSelectedlist: selectedOfferTAT,
            indexSelected: "13",
          ),

        if (i == 14)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.visaTAT,
            callbackItemSelected: callback,
            itemSelectedlist: selectedVisaTAT,
            indexSelected: "14",
          ),

        //code Update
        //Placement/Sandwich Years
        if (i == 15)
          CustomgroupCheckBoxCallBack(
            data: const ["Yes", "No"],
            callbackItemSelected: callback,
            itemSelectedlist: selectedPlacementSandwichYear,
            indexSelected: "15",
          ),
        //SIEC Represented
        if (i == 16)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.siecRep,
            callbackItemSelected: callback,
            itemSelectedlist: selectedSIECRepresented,
            indexSelected: "16",
          ),
      ],
    );
  }

  List<CheckBoxModel> favoriteMovies = [];

  callback(varTopic) {
    if (varTopic != null) itemsSelected = varTopic;
  }

  loadingFilter() async {
    List<String>? listSelectedItems = [];
    listSelectedItems = itemsSelected!.split(",");
    if (listSelectedItems[0] == "0") {
      selectedUniversitylist = itemsSelected!.split(",");
      selectedUniversitylist!.removeAt(0);
      controller.getUniversity(itemsSelected);
    }
    if (listSelectedItems[0] == "1") {
      await controller.getIntakeMonth(itemsSelected);
      selectedintakeMonth = itemsSelected!.split(",");
      selectedintakeMonth!.removeAt(0);
    }

    if (listSelectedItems[0] == "2") {
      await controller.getIntakeYear(itemsSelected);
      selectedUintakeYear = itemsSelected!.split(",");
      selectedUintakeYear!.removeAt(0);
    }
    if (listSelectedItems[0] == "3") {
      // Academic

    }
    if (listSelectedItems[0] == "4") {
      //Budget
    }
    if (listSelectedItems[0] == "5") {
      await controller.getCountryName(itemsSelected);
      selectedCountryName = itemsSelected!.split(",");
      selectedCountryName!.removeAt(0);
    }
    // Select Ranking

    if (listSelectedItems[0] == "6") {
      await controller.getInstitutePublicPrivate(itemsSelected);
      selectedInstitutePublicPrivate = itemsSelected!.split(",");
      selectedInstitutePublicPrivate!.removeAt(0);
    }
    if (listSelectedItems[0] == "7") {
      await controller.getInstituteLevel(itemsSelected);
      selectedInstituteLevel = itemsSelected!.split(",");
      selectedInstituteLevel!.removeAt(0);
    }

    if (listSelectedItems[0] == "8") {
      controller.getScholarship(itemsSelected);
      selectedScholarship = itemsSelected!.split(",");
      selectedScholarship!.removeAt(0);
    }
    if (listSelectedItems[0] == "9") {
      controller.getSiecPriority(itemsSelected);
      selectedSIECPriority = itemsSelected!.split(",");
      selectedSIECPriority!.removeAt(0);
    }
    if (listSelectedItems[0] == "10") {
      controller.getConditionalOffer(itemsSelected);
      selectedConditionalOffer = itemsSelected!.split(",");
      selectedConditionalOffer!.removeAt(0);
    }
    if (listSelectedItems[0] == "11") {
      controller.getBackLogAcceptable(itemsSelected);
      selectedBacklogAcceptable = itemsSelected!.split(",");
      selectedBacklogAcceptable!.removeAt(0);
    }
    if (listSelectedItems[0] == "12") {
      controller.getApplicationFee(itemsSelected);
      selectedApplicationFee = itemsSelected!.split(",");
      selectedApplicationFee!.removeAt(0);
    }
    if (listSelectedItems[0] == "13") {
      controller.getOfferTAT(itemsSelected);
      selectedOfferTAT = itemsSelected!.split(",");
      selectedOfferTAT!.removeAt(0);
    }
    if (listSelectedItems[0] == "14") {
      controller.getVisaTAT(itemsSelected);
      selectedVisaTAT = itemsSelected!.split(",");
      selectedVisaTAT!.removeAt(0);
    }
    if (listSelectedItems[0] == "15") {
      controller.getplacementSandwich(itemsSelected);
      selectedPlacementSandwichYear = itemsSelected!.split(",");
      selectedPlacementSandwichYear!.removeAt(0);
    }
    if (listSelectedItems[0] == "16") {
      controller.getSiecRepresent(itemsSelected);
      selectedSIECRepresented = itemsSelected!.split(",");
      selectedSIECRepresented!.removeAt(0);
    }
  }
}

class VerticalDivider extends StatelessWidget {
  const VerticalDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      width: 1.0,
      color: ThemeConstants.lightgreycolor,
    );
  }
}
