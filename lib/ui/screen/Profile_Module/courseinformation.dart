import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/courseinformationprofile.dart';
import 'package:studentpanel/ui/screen/Profile_Module/courseinformationWidget.dart';
import 'package:studentpanel/ui/screen/Profile_Module/courseinformationview.dart';

class CourseInformationCopy extends StatefulWidget {
  double? width;
  CourseInformationCopy({Key? key, required this.width}) : super(key: key);

  static const routeNamed = '/CourseInformationCopy';

  @override
  State<CourseInformationCopy> createState() => _CourseInformationCopyState();
}

class _CourseInformationCopyState extends State<CourseInformationCopy> {
  bool viewDetails = false;
  bool saveAndEdit = true;
  bool update = true;
  int? index;

  var controller = Get.put(CourseInformationProfileController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseInformationProfileController>(
        builder: (controller1) => viewDetails
            ? CourseInformationView(
                callbackIndexDelete: callbackIndexDelete,
                callbackIndexEdit: callbackIndexEdit,
                callbackFunction: callbackViewDetails,
                model: controller1.viewCourseInformationList)
            : CourseInformationWidget(
                update: update,
                index: index,
                callbackUpdateButton: callbackUpdateButton,
                callbackCourseLevel: callbackCourseLevel,
                callbackCourseNarrow: callbackCourseNarrow,
                callbackviewDetailsButton: callbackViewDetailsButton,
              ));
  }

  // Funcation
  callbackUpdateButton(varTopic) {
    update = true;
    setState(() {});
  }

  callbackViewDetails(varTopic) {
    viewDetails = false;
    setState(() {});
  }

  callbackCourseLevel(data) {
    controller.callbackCourseLevel(data);
  }

  callbackCourseNarrow(data) {
    controller.callbackCourseNarrow(data);
    setState(() {});
  }

  callbackViewDetailsButton(data) {
    viewDetails = true;
    setState(() {});
  }

  callbackIndexDelete(data) {
    controller.viewCourseInformationList.removeAt(int.parse(data.toString()));
    controller.updateCourseInformation(
        78623, controller.viewCourseInformationList[0].courseBroadId!);
    setState(() {});
  }

  callbackIndexEdit(data) {
    var temp = controller.viewCourseInformationList[int.parse(data.toString())];
    for (var i = 0; i < controller.courseLevelList.length; i++) {
      if (temp.courseLevelId.toString() ==
          controller.courseLevelCode[i].toString()) {
        controller.courseLevelSelectedId = controller.courseLevelCode[i];
        controller.courseLevelSelected = controller.courseLevelList[i];
      }
    }
    controller.courseBroadSelected = temp.broadFieldName;
    controller.courseNarrowSelected = temp.narrowFieldName;
    index = int.parse(data.toString());
    viewDetails = false;
    update = false;
    controller.update();
    setState(() {});
  }
}
