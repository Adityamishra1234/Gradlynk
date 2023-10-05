import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/getAllCourseBroadFieldModel.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/utils/endpoint.dart';

class LetsGetStartedController extends GetxController with StateMixin {
  ApiServices api = ApiServices();
  var baseController = Get.find<BaseController>();
  int questionNumberToShow = 0;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void onInit() async {
    await whichConsentFormToShow();

    change(null, status: RxStatus.success());

    getCourseBoardField();
    //
    //TODO: implement onInit
    // super.onInit();
  }

  showEnglishTestNextQuestion() {
    widthOfSlider = widthOfSlider + 40;
    questionToShowInEnglsihTest = questionToShowInEnglsihTest + 1;
    update();
  }

  List<bool> questionsToShowList = [];
  List<String> questionsToShowString = [];

  bool showConsentTermsForm = false;

  whichConsentFormToShow() async {
    try {
      questionsToShowList = [];
      var res = await api.whichConsentForm(baseController.model1.id.toString());

      var map = Map<String, bool>.from(res);

      questionsToShowList.addAll(map.values.toList());

      var serviceId = 1;
      if (serviceId != 0) {
        questionsToShowList[4] = true;
        questionsToShowList[5] = true;
      }

      ///todo
      // questionsToShowList = [true, false, true, true, true, true];

      showQuestion();

      update();
      // questionsToShowString.addAll(map.keys.toList());

      print(questionsToShowList);
    } catch (e) {
      await api.errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  double widthOfSlider = 10;

  //firstQuestion
  int? selectedLastQualification = null;

  int? selectedAppearedInEnglishTest = null;

  String? selectedTestYouAppearedFor = null;

  int? specifyYourScore = null;

  int? selectedLevelYouWantToStudy = null;

  bool nextForChange = true;

  int questionToShowInEnglsihTest = 0;

  int indexOfQuestion = 0;

  TextEditingController specifyCourseTextController = TextEditingController();

  showQuestion() {
    if (questionNumberToShow < questionsToShowList.length) {
      // if (questionNumberToShow == 2) {
      //   var toShowOrNot = questionsToShowList[questionNumberToShow];
      //   if (toShowOrNot == true) {
      //     questionNumberToShow = questionNumberToShow + 1;
      //   } else {
      //     questionNumberToShow = questionNumberToShow + 1;
      //     showQuestion();
      //   }
      // } else {
      if (questionNumberToShow != 5) {
        questionNumberToShow++;
      } else {
        questionNumberToShow = 0;
        showConsentTermsForm = true;
        nextForChange = true;
        update();
        return;
      }

      widthOfSlider = widthOfSlider + 40;
      var toShowOrNot = questionNumberToShow == 1
          ? questionsToShowList[questionNumberToShow]
          // : questionNumberToShow == 5
          //     ? questionsToShowList[5]
          : !questionsToShowList[questionNumberToShow];
      if (toShowOrNot == true) {
        nextForChange = true;
        // questionNumberToShow = questionNumberToShow + 1;
        if (questionNumberToShow == 3) {
          nextForChange = false;
        }
      } else if (toShowOrNot == false) {
        nextForChange = true;
        // questionNumberToShow = questionNumberToShow + 1;
        if (questionNumberToShow == 3) {
          nextForChange = false;
        }

        if (questionNumberToShow != 5) {
          showQuestion();
        } else {
          questionNumberToShow = 0;
          showConsentTermsForm = true;
          nextForChange = true;
          update();
          return;
        }

        // if (questionNumberToShow == 5) {
        //   questionNumberToShow = 0;
        //   showConsentTermsForm = true;
        //   nextForChange = true;
        // }

        // }

        print(questionsToShowList);
      }
    }
    update();
  }

  back() {
    widthOfSlider = widthOfSlider - 80;
    // questionToShowInEnglsihTest = 0;
    questionNumberToShow = questionNumberToShow - 2;
    showQuestion();
  }

  backForEnglish() {
    widthOfSlider = widthOfSlider - 80;
    questionToShowInEnglsihTest = questionToShowInEnglsihTest - 2;
    // questionNumberToShow = questionNumberToShow - 2;
    showEnglishTestNextQuestion();
  }

  postLetsGetStartedData() async {
    try {
      change(null, status: RxStatus.loading());
      var endpoint = letsGetStartedSendData(
          enqId: baseController.model1.id,
          consentQualifactionData: selectedLastQualification,
          consentForEnglishtest: selectedAppearedInEnglishTest,
          consentForEnglishOverAll: specifyCourseTextController.text,
          consentForEnglishValue: selectedTestYouAppearedFor,
          consentForLevelToStudy: selectedLevelYouWantToStudy,
          selectedBroadField: selectCourseBoardFieldCode);

      await api.agree(Get.context!);
      var res = await api.postLetsGetStarted(endpoint);

      if (res['status'] == true) {
        change(null, status: RxStatus.success());
        Get.offAllNamed(DashBoard.routeNamed);
      }

      print(res);
    } catch (e) {
      await api.errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  List<Widget> courseFieldWidgetList = [];
  List<GetAllCourseBroadFieldModel> AllCourseSearchBroadField = [];
  int? selectCourseBoardFieldCode;
  int? selectCourseNarrowFieldCode;
  getCourseBoardField() async {
    try {
      var res = await api.getAllCourseBroadField();

      var data = List<GetAllCourseBroadFieldModel>.from(
          res.map((e) => GetAllCourseBroadFieldModel.fromJson(e)));

      AllCourseSearchBroadField = data;
      print(data);

      // for (var i = 0; i < data.length; i++) {
      //   courseFieldWidgetList.add(InkWell(
      //     onTap: () {
      //       selectCourseBoardFieldCode = data[i].id;
      //       getCoursenarrowField(selectCourseBoardFieldCode!);
      //     },
      //     child: Container(
      //       padding: EdgeInsets.symmetric(horizontal: 5),
      //       margin: EdgeInsets.symmetric(horizontal: 10),
      //       width: 140,
      //       decoration: BoxDecoration(
      //           color: selectCourseBoardFieldCode == data[i].id
      //               ? ThemeConstants.ultraLightgreyColor2
      //               : ThemeConstants.GreenColor,
      //           borderRadius: BorderRadius.circular(15),
      //           border: Border.all(width: 1, color: ThemeConstants.bluecolor)),
      //       child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             Container(
      //               width: 50,
      //               height: 50,
      //               child: CachedNetworkImage(
      //                 imageUrl: data[i].imageLink!,
      //               ),
      //             ),
      //             SizedBox(
      //               height: 5,
      //             ),
      //             Text(
      //               '${data[i].broadFieldName}',
      //               textAlign: TextAlign.center,
      //               style: TextStyle(
      //                 fontSize: 12,
      //                 fontWeight: FontWeight.w500,
      //               ),
      //             )
      //           ]),
      //     ),
      //   ));
      // }

      update();
      change(null, status: RxStatus.success());

      // if (res != null) {
      //   Map map = Map<String, dynamic>.from(res);
      //   courseBoardList.add("Select Course Level");
      //   courseBoardCode.add(0);
      //   courseBoardList.addAll(map.keys.toList());
      //   courseBoardCode.addAll(map.values.toList());
      //   loadingCourseBoardField = true.obs;
      //   update();
      // }
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }

  nextQuestion() {}

  selectedQualification(int code) {
    selectedLastQualification = code;
    update();
  }

  bool? haveAppearedInEnglishTest = null;
  // nextPresed({
  //   required int questionNumber,
  // }) {}

  // changeTheWidget() {}

  // bool questionNeedToShow(int index) {
  //   return questionsToShowList[index];
  // }

  bool appearedForEnglishTest = false;
}
