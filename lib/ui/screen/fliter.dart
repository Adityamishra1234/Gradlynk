import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/filtercontroller.dart';
import 'package:studentpanel/ui/models/filterModel.dart';
import 'package:studentpanel/ui/screen/courseshortlist.dart';
import 'package:studentpanel/ui/screen/finalshortlist.dart';
import 'package:studentpanel/ui/screen/reviewshortlist.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';
import 'package:studentpanel/widgets/customgroupcheckboxwithcallback.dart';
import 'package:studentpanel/widgets/test.dart';

class Filter extends StatefulWidget {
  CourseModelFilter courseModelFilter = CourseModelFilter();
  String? previousRoute;
  Filter({Key? key, required this.courseModelFilter, this.previousRoute})
      : super(key: key);
  static const routeNamed = '/Filter';

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  // List<CheckBoxModel> favoriteMovies = [];
  String? previousRoute;
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
  String? firstRankingSelect = "";
  String? secondRankingSelect = "";
  int indexRanking = 0;
  String? itemsSelected;
  CourseModelFilter courseModelFilter = CourseModelFilter();
  int choosefilter = 0;
  var controller = Get.put(FilterController());
  @override
  void initState() {
    courseModelFilter = widget.courseModelFilter;
    controller.courseModelFilter = courseModelFilter;
    controller.filterModel = courseModelFilter.filterModel;
    previousRoute = widget.previousRoute;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    courseModelFilter.filterModel = controller.filterModel;
    return Scaffold(
        appBar: CustomAppBar("title"),
        drawer: CustomDrawer(),
        body: GetBuilder<FilterController>(
            builder: (controller1) => controller1.loadingfuncation.value == true
                ? Column(
                    children: [
                      if (controller1.loadingfuncation.value == true)
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
                      if (controller1.loadingfuncation.value == true)
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height - 240,
                                  width: MediaQuery.of(context).size.width / 2 -
                                      10,
                                  color: ThemeConstants.whitecolor,
                                  child: ListView(
                                    controller: ScrollController(),
                                    children: [
                                      if (courseModelFilter
                                              .filterModel.universityname !=
                                          null)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: SizedBox(
                                            height: 40,
                                            child: TextButton(
                                                onPressed: () async {
                                                  choosefilter = 0;
                                                  indexRanking = 4;
                                                  if (itemsSelected != null) {
                                                    await loadingFilter();
                                                  }
                                                  setState(() {});
                                                },
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "University Name",
                                                )),
                                          ),
                                        ),
                                      if (courseModelFilter
                                              .filterModel.intakeMonth !=
                                          null)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: SizedBox(
                                            height: 40,
                                            child: TextButton(
                                                onPressed: () async {
                                                  choosefilter = 1;
                                                  indexRanking = 4;
                                                  if (itemsSelected != null) {
                                                    await loadingFilter();
                                                  }
                                                  setState(() {});
                                                },
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Intake Month",
                                                )),
                                          ),
                                        ),
                                      if (courseModelFilter
                                              .filterModel.intakeYear !=
                                          null)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: SizedBox(
                                            height: 40,
                                            child: TextButton(
                                                onPressed: () async {
                                                  choosefilter = 2;
                                                  indexRanking = 4;
                                                  if (itemsSelected != null) {
                                                    await loadingFilter();
                                                  }
                                                  setState(() {});
                                                },
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Intake Year",
                                                )),
                                          ),
                                        ),
                                      if (courseModelFilter.filterModel
                                          .academicPercentage.isNotEmpty)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: SizedBox(
                                            height: 40,
                                            child: TextButton(
                                                onPressed: () async {
                                                  choosefilter = 3;
                                                  indexRanking = 4;
                                                  if (itemsSelected != null) {
                                                    await loadingFilter();
                                                  }
                                                  setState(() {});
                                                },
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Academic %",
                                                )),
                                          ),
                                        ),
                                      if (courseModelFilter
                                          .filterModel.budget.isNotEmpty)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: SizedBox(
                                            height: 40,
                                            child: TextButton(
                                                onPressed: () async {
                                                  choosefilter = 4;
                                                  indexRanking = 4;
                                                  if (itemsSelected != null) {
                                                    await loadingFilter();
                                                  }
                                                  setState(() {});
                                                },
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Budget",
                                                )),
                                          ),
                                        ),
                                      if (courseModelFilter
                                              .filterModel.countryName !=
                                          null)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: SizedBox(
                                            height: 40,
                                            child: TextButton(
                                                onPressed: () async {
                                                  choosefilter = 5;
                                                  indexRanking = 4;
                                                  if (itemsSelected != null) {
                                                    await loadingFilter();
                                                  }
                                                  setState(() {});
                                                },
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Country Name",
                                                )),
                                          ),
                                        ),
                                      if (courseModelFilter
                                              .filterModel.selectRanking !=
                                          null)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: SizedBox(
                                            height: 40,
                                            child: TextButton(
                                                onPressed: () async {
                                                  choosefilter = 17;
                                                  indexRanking = 0;

                                                  if (itemsSelected != null) {
                                                    await loadingFilter();
                                                  }
                                                  setState(() {});
                                                },
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Select Ranking",
                                                )),
                                          ),
                                        ),
                                      if (courseModelFilter.filterModel
                                              .institutePrivatePublic !=
                                          null)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: SizedBox(
                                            height: 60,
                                            child: TextButton(
                                                onPressed: () async {
                                                  choosefilter = 6;
                                                  indexRanking = 4;
                                                  if (itemsSelected != null) {
                                                    await loadingFilter();
                                                  }
                                                  setState(() {});
                                                },
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text:
                                                      "Institute -public/private",
                                                )),
                                          ),
                                        ),
                                      if (courseModelFilter
                                              .filterModel.instituteLevel !=
                                          null)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: SizedBox(
                                            height: 40,
                                            child: TextButton(
                                                onPressed: () async {
                                                  choosefilter = 7;
                                                  indexRanking = 4;
                                                  if (itemsSelected != null) {
                                                    await loadingFilter();
                                                  }
                                                  setState(() {});
                                                },
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Institute Level",
                                                )),
                                          ),
                                        ),
                                      if (courseModelFilter
                                              .filterModel.scholarship !=
                                          null)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: SizedBox(
                                            height: 40,
                                            child: TextButton(
                                                onPressed: () async {
                                                  choosefilter = 8;
                                                  indexRanking = 4;
                                                  if (itemsSelected != null) {
                                                    await loadingFilter();
                                                  }
                                                  setState(() {});
                                                },
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Scholarship",
                                                )),
                                          ),
                                        ),
                                      if (courseModelFilter
                                              .filterModel.siecPriority !=
                                          null)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: SizedBox(
                                            height: 40,
                                            child: TextButton(
                                                onPressed: () async {
                                                  choosefilter = 9;
                                                  indexRanking = 4;
                                                  if (itemsSelected != null) {
                                                    await loadingFilter();
                                                  }
                                                  setState(() {});
                                                },
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "SIEC Priority",
                                                )),
                                          ),
                                        ),
                                      if (courseModelFilter
                                              .filterModel.conditionalOffer !=
                                          null)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: SizedBox(
                                            height: 40,
                                            child: TextButton(
                                                onPressed: () async {
                                                  choosefilter = 10;
                                                  indexRanking = 4;
                                                  if (itemsSelected != null) {
                                                    await loadingFilter();
                                                  }
                                                  setState(() {});
                                                },
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Conditional Offer",
                                                )),
                                          ),
                                        ),
                                      if (courseModelFilter
                                              .filterModel.backlogAcceptable !=
                                          null)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: SizedBox(
                                            height: 40,
                                            child: TextButton(
                                                onPressed: () async {
                                                  choosefilter = 11;
                                                  indexRanking = 4;
                                                  if (itemsSelected != null) {
                                                    await loadingFilter();
                                                  }
                                                  setState(() {});
                                                },
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Backlog Acceptabe",
                                                )),
                                          ),
                                        ),
                                      if (courseModelFilter
                                              .filterModel.applicationfee !=
                                          null)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: SizedBox(
                                            height: 40,
                                            child: TextButton(
                                                onPressed: () async {
                                                  choosefilter = 12;
                                                  indexRanking = 4;
                                                  if (itemsSelected != null) {
                                                    await loadingFilter();
                                                  }
                                                  setState(() {});
                                                },
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Application Fee",
                                                )),
                                          ),
                                        ),
                                      if (courseModelFilter
                                              .filterModel.offerTAT !=
                                          null)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: SizedBox(
                                            height: 40,
                                            child: TextButton(
                                                onPressed: () async {
                                                  choosefilter = 13;
                                                  indexRanking = 4;
                                                  if (itemsSelected != null) {
                                                    await loadingFilter();
                                                  }
                                                  setState(() {});
                                                },
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Offer TAT(In days)",
                                                )),
                                          ),
                                        ),
                                      if (courseModelFilter
                                              .filterModel.visaTAT !=
                                          null)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: SizedBox(
                                            height: 40,
                                            child: TextButton(
                                                onPressed: () async {
                                                  choosefilter = 14;
                                                  indexRanking = 4;
                                                  if (itemsSelected != null) {
                                                    await loadingFilter();
                                                  }
                                                  setState(() {});
                                                },
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Visa TAT(In days)",
                                                )),
                                          ),
                                        ),
                                      if (courseModelFilter
                                              .filterModel.placementSandwich !=
                                          null)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: SizedBox(
                                            height: 60,
                                            child: TextButton(
                                                onPressed: () async {
                                                  choosefilter = 15;
                                                  indexRanking = 4;
                                                  if (itemsSelected != null) {
                                                    await loadingFilter();
                                                  }
                                                  setState(() {});
                                                },
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text:
                                                      "Placement/Sandwich year",
                                                )),
                                          ),
                                        ),
                                      if (courseModelFilter
                                              .filterModel.siecRep !=
                                          null)
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: SizedBox(
                                            height: 40,
                                            child: TextButton(
                                                onPressed: () async {
                                                  choosefilter = 16;
                                                  indexRanking = 4;

                                                  if (itemsSelected != null) {
                                                    await loadingFilter();
                                                  }
                                                  setState(() {});
                                                },
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "SIEC Represented",
                                                )),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height - 240,
                                  child: const VerticalDivider()),
                              Padding(
                                padding: const EdgeInsets.only(right: 9),
                                child: SizedBox(
                                    height: MediaQuery.of(context).size.height -
                                        240,
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            10,
                                    child: getFilterOption(choosefilter)),
                              ),
                            ],
                          ),
                        ),
                      if (controller1.loadingfuncation.value == true)
                        Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          color: ThemeConstants.whitecolor,
                          child: Row(
                            children: [
                              const Spacer(),
                              ElevatedButton(
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              ThemeConstants.whitecolor),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              ThemeConstants.whitecolor),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              side: BorderSide(
                                                  color: ThemeConstants
                                                      .TextColor)))),
                                  onPressed: () {},
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Clear Filter ",
                                    fontWeight: FontWeight.bold,
                                    textColor: ThemeConstants.TextColor,
                                  )),
                              const Spacer(),
                              ElevatedButton(
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              ThemeConstants.bluecolor),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              ThemeConstants.bluecolor),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              side: BorderSide(
                                                  color: ThemeConstants
                                                      .bluecolor)))),
                                  onPressed: () async {
                                    if (itemsSelected != null) {
                                      await loadingFilter();
                                    }
                                    if (controller1.loadingfuncation.value ==
                                        true) {
                                      if (previousRoute ==
                                          FinalShortList.routeNamed) {
                                        Get.to(FinalShortList(
                                          courseModelFilter:
                                              controller1.courseModelFilter,
                                        ));
                                      }
                                      if (previousRoute ==
                                          ReviewShortList.routeNamed) {
                                        Get.to(ReviewShortList(
                                          courseModelFilter:
                                              controller1.courseModelFilter,
                                        ));
                                      }
                                      if (previousRoute ==
                                          CourseSearchList.routeNamed) {
                                        Get.to(CourseSearchList(
                                          filterRedirect: true,
                                          courseModelFilter: courseModelFilter,
                                        ));
                                      }
                                    }
                                  },
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Apply  Filter ",
                                    fontWeight: FontWeight.bold,
                                    textColor: ThemeConstants.whitecolor,
                                  )),
                              const Spacer(),
                            ],
                          ),
                        ),
                      if (controller1.loadingfuncation.value == false)
                        const Center(child: CircularProgressIndicator()),
                    ],
                  )
                : const CircularProgressIndicator()));
  }

  // Function
  Widget getFilterOption(int i) {
    List<String> budgetlist = [];
    List<String> academicPercentage = [];

    // create budget filter
    for (var i = 0; i < courseModelFilter.filterModel.budget.length; i++) {
      if (courseModelFilter.filterModel.budget[i].entries.first.value == true) {
        budgetlist
            .add(courseModelFilter.filterModel.budget[i].entries.first.key);
      }
    }

// create academic Percentage filter
    for (var i = 0;
        i < courseModelFilter.filterModel.academicPercentage.length;
        i++) {
      if (courseModelFilter
              .filterModel.academicPercentage[i].entries.first.value ==
          true) {
        academicPercentage.add(courseModelFilter
            .filterModel.academicPercentage[i].entries.first.key);
      }
    }

    return ListView(
      controller: ScrollController(),
      children: [
        //University Name
        if (i == 0)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.universityname,
            callbackItemSelected: callback,
            itemSelectedlist: courseModelFilter
                .filterModel.filterSelected.universitynameSelected,
            indexSelected: "0",
          ),

// Intake Month
        if (i == 1)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.intakeMonth,
            callbackItemSelected: callback,
            itemSelectedlist: courseModelFilter
                    .filterModel.filterSelected.intakeMonthSelected ??
                [],
            indexSelected: "1",
          ),
        // Intake year
        if (i == 2)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.intakeYear,
            callbackItemSelected: callback,
            itemSelectedlist: courseModelFilter
                    .filterModel.filterSelected.intakeYearSelected ??
                [],
            indexSelected: "2",
          ),

//Academic Percentage
        if (i == 3)
          CustomgroupCheckBoxCallBack(
            data: academicPercentage,
            callbackItemSelected: callback,
            itemSelectedlist: courseModelFilter
                    .filterModel.filterSelected.academicPercentageSelected ??
                [],
            indexSelected: "3",
          ),

        // Budget
        if (i == 4)
          CustomgroupCheckBoxCallBack(
            data: budgetlist,
            callbackItemSelected: callback,
            itemSelectedlist:
                courseModelFilter.filterModel.filterSelected.budgetSelected ??
                    [],
            indexSelected: "4",
          ),

        //country
        if (i == 5)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.countryName,
            callbackItemSelected: callback,
            itemSelectedlist: courseModelFilter
                    .filterModel.filterSelected.countryNameSelected ??
                [],
            indexSelected: "5",
          ),

        //Select Ranking
        if (i == 17) getRankingFilter(indexRanking),
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
            itemSelectedlist: courseModelFilter.filterModel.filterSelected
                    .institutePrivatePublicSelected ??
                [],
            indexSelected: "6",
          ),

        if (i == 7)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.instituteLevel,
            callbackItemSelected: callback,
            itemSelectedlist: courseModelFilter
                    .filterModel.filterSelected.instituteLevelSelected ??
                [],
            indexSelected: "7",
          ),

        //Scholarship
        if (i == 8)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.scholarship,
            callbackItemSelected: callback,
            itemSelectedlist: courseModelFilter
                    .filterModel.filterSelected.scholarshipSelected ??
                [],
            indexSelected: "8",
          ),
        //Siec Priority
        if (i == 9)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.siecPriority,
            callbackItemSelected: callback,
            itemSelectedlist: courseModelFilter
                    .filterModel.filterSelected.siecPrioritySelected ??
                [],
            indexSelected: "9",
          ),

        //Conditional Offer
        if (i == 10)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.conditionalOffer,
            callbackItemSelected: callback,
            itemSelectedlist: courseModelFilter
                    .filterModel.filterSelected.conditionalOfferSelected ??
                [],
            indexSelected: "10",
          ),

        //backlog acceptable
        if (i == 11)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.backlogAcceptable,
            callbackItemSelected: callback,
            itemSelectedlist: courseModelFilter
                    .filterModel.filterSelected.backlogAcceptableSelected ??
                [],
            indexSelected: "11",
          ),
        //Application Fee
        if (i == 12)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.applicationfee,
            callbackItemSelected: callback,
            itemSelectedlist: courseModelFilter
                    .filterModel.filterSelected.applicationfeeSelected ??
                [],
            indexSelected: "12",
          ),
        if (i == 13)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.offerTAT,
            callbackItemSelected: callback,
            itemSelectedlist:
                courseModelFilter.filterModel.filterSelected.offerTATSelected ??
                    [],
            indexSelected: "13",
          ),

        if (i == 14)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.visaTAT,
            callbackItemSelected: callback,
            itemSelectedlist:
                courseModelFilter.filterModel.filterSelected.visaTATSelected ??
                    [],
            indexSelected: "14",
          ),

        //code Update
        //Placement/Sandwich Years
        if (i == 15)
          CustomgroupCheckBoxCallBack(
            data: const ["Yes", "No"],
            callbackItemSelected: callback,
            itemSelectedlist: courseModelFilter
                    .filterModel.filterSelected.placementSandwichSelected ??
                [],
            indexSelected: "15",
          ),
        //SIEC Represented
        if (i == 16)
          CustomgroupCheckBoxCallBack(
            data: courseModelFilter.filterModel.siecRep,
            callbackItemSelected: callback,
            itemSelectedlist:
                courseModelFilter.filterModel.filterSelected.siecRepSelected ??
                    [],
            indexSelected: "16",
          ),
      ],
    );
  }

  Widget getRankingFilter(int i) {
    return Column(
      children: [
        CustomAutoSizeTextMontserrat(
          text: "Ranking",
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomDropDown(
          text: "Ranking",
          callbackFunction: callbackRanking,
          model: const [
            "Times Ranking",
            "ARWU Ranking",
            "US News Ranking",
            "QS world Ranking"
          ],
          hint: "Ranking",
          border: true,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomAutoSizeTextMontserrat(
          text: "Selected Highest Ranking",
          fontWeight: FontWeight.w500,
        ),
        // Select Ranking
        if (i == 0)
          CustomDropDown(
            callbackFunction: callbackFirstRanking,
            model: courseModelFilter.filterModel.timesRanking,
            hint: "Times Ranking",
            border: true,
          ),
        if (i == 1)
          CustomDropDown(
            callbackFunction: callbackFirstRanking,
            model: courseModelFilter.filterModel.arwuNewsRanking,
            hint: "ARWU News Ranking",
            border: true,
          ),
        if (i == 2)
          CustomDropDown(
            callbackFunction: callbackFirstRanking,
            model: courseModelFilter.filterModel.usNewsRanking,
            hint: "US News Ranking",
            border: true,
          ),
        if (i == 3)
          CustomDropDown(
            callbackFunction: callbackFirstRanking,
            model: courseModelFilter.filterModel.qsWorldRanking,
            hint: "QS world Ranking",
            border: true,
          ),
        const SizedBox(
          height: 10,
        ),
        CustomAutoSizeTextMontserrat(
          text: "Select Lowest ranking",
          fontWeight: FontWeight.w500,
        ),
        if (i == 0)
          CustomDropDown(
            callbackFunction: callbackSecondRanking,
            model: courseModelFilter.filterModel.timesRanking,
            hint: "Times Ranking",
            border: true,
          ),
        if (i == 1)
          CustomDropDown(
            callbackFunction: callbackSecondRanking,
            model: courseModelFilter.filterModel.arwuNewsRanking,
            hint: "ARWU News Ranking",
            border: true,
          ),
        if (i == 2)
          CustomDropDown(
            callbackFunction: callbackSecondRanking,
            model: courseModelFilter.filterModel.usNewsRanking,
            hint: "US News Ranking",
            border: true,
          ),
        if (i == 3)
          CustomDropDown(
            callbackFunction: callbackSecondRanking,
            model: courseModelFilter.filterModel.qsWorldRanking,
            hint: "QS world Ranking",
            border: true,
          ),
      ],
    );

    //   CustomgroupCheckBoxCallBack(
  }

  callback(varTopic) {
    if (varTopic != null) itemsSelected = varTopic;
  }

  callbackRanking(varTopic) {
    ["Times Ranking", "ARWU Ranking", "US News Ranking", "QS world Ranking"];
    if (varTopic != null) {
      switch (varTopic) {
        case "Times Ranking":
          indexRanking = 0;
          firstRankingSelect = "";
          secondRankingSelect = "";
          setState(() {});
          break;
        case "ARWU Ranking":
          indexRanking = 1;
          firstRankingSelect = "";
          secondRankingSelect = "";
          setState(() {});
          break;
        case "US News Ranking":
          indexRanking = 2;
          firstRankingSelect = "";
          secondRankingSelect = "";
          setState(() {});
          break;
        case "QS world Ranking":
          indexRanking = 3;
          firstRankingSelect = "";
          secondRankingSelect = "";
          setState(() {});
          break;
        default:
      }
    }
  }

  callbackFirstRanking(varTopics) {
    firstRankingSelect = varTopics.toString();
    if (secondRankingSelect!.isNotEmpty) {
      controller.getRanking(indexRanking, int.parse(firstRankingSelect!),
          int.parse(secondRankingSelect!));
    }
  }

  callbackSecondRanking(varTopic) {
    secondRankingSelect = varTopic.toString();
    if (firstRankingSelect != null || firstRankingSelect != "") {
      controller.getRanking(indexRanking, int.parse(firstRankingSelect!),
          int.parse(secondRankingSelect!));
    }
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
    // Academic
    if (listSelectedItems[0] == "3") {
      await controller.getAcademic(itemsSelected);
      selectedacademic = itemsSelected!.split(",");
      selectedacademic!.removeAt(0);
    }
    if (listSelectedItems[0] == "4") {
      //Budget
      await controller.getBudget(itemsSelected);
      selectedBudget = itemsSelected!.split(",");
      selectedBudget!.removeAt(0);
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
