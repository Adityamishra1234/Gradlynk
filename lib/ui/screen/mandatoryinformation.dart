import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/dashboardcontroller.dart';
import 'package:studentpanel/ui/controllers/profilepagecontroller.dart';
import 'package:studentpanel/ui/models/dropdownmodel.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownbutton.dart';

class MandatoryInformation extends StatelessWidget {
  MandatoryInformation({
    Key? key,
  }) : super(key: key);

  var controller = Get.put(ProfilePageController());

  callback(varTopic) {


    controller.setdropdown1(varTopic);
  }

  @override
  Widget build(BuildContext context) {
    return GetX<DashboardController>(
        builder: (controller1) => Column(
              children: [
                if (controller1.loadingStudentPanelData.value == true)
                  Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 10, top: 30),
                        child: SizedBox(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Branch Type",
                                  maxLines: 1,
                                  textColor: Colors.grey,
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: 200,
                                // custom Text field
                                child: Padding(
                                    padding: const EdgeInsets.only(),
                                    child: CustomDropDown(
                                      hint: "Branch Type",
                                      model:
                                          controller1.createModelForDropdown(),
                                      callbackFunction: callback,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Divider(
                          height: 5,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 10, top: 10),
                        child: SizedBox(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Branch Name",
                                  maxLines: 1,
                                  textColor: Colors.grey,
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: 200,
                                // custom Text field
                                child: controller.loadingBranchname.value ==
                                        true
                                    ? CustomDropDown(
                                        hint: controller.dropdown1!.value,
                                        model: controller1.createDropDownData(
                                            controller.dropdown1!.value),
                                        callbackFunction: callback,
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: CustomAutoSizeTextMontserrat(
                                          text: "Branch Name",
                                          maxLines: 1,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Divider(
                          height: 5,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 10, top: 10),
                        child: SizedBox(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: controller1.loadingServiceName.value ==
                                        true
                                    ? CustomDropDown(
                                        hint: controller.dropdown1!.value,
                                        model: controller1.createDropDownData(
                                            controller.dropdown1!.value),
                                        callbackFunction: callback,
                                      )
                                    : CustomAutoSizeTextMontserrat(
                                        text: "Service Name",
                                        maxLines: 1,
                                        textColor: Colors.grey,
                                      ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: 200,
                                // custom Text field
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: controller1.studentPanel
                                            .addtionalDetails![1].serviceName ??
                                        "",
                                    maxLines: 1,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Divider(
                          height: 5,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 10, top: 10),
                        child: SizedBox(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: CustomAutoSizeTextMontserrat(
                                  text: "1st Country of Interest",
                                  maxLines: 1,
                                  textColor: Colors.grey,
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: 150,
                                // custom Text field
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: controller1.studentPanel
                                            .addtionalDetails![1].countryName ??
                                        "",
                                    maxLines: 1,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Divider(
                          height: 5,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 10, top: 10),
                        child: SizedBox(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Other Country of Interest",
                                  maxLines: 1,
                                  textColor: Colors.grey,
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: 150,
                                // custom Text field
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Gurugram",
                                    maxLines: 1,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Divider(
                          height: 5,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 10, top: 10),
                        child: SizedBox(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Decision Marker",
                                  maxLines: 1,
                                  textColor: Colors.grey,
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: 150,
                                // custom Text field
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "",
                                    maxLines: 1,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Divider(
                          height: 5,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 10, top: 10),
                        child: SizedBox(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Passport Available",
                                  maxLines: 1,
                                  textColor: Colors.grey,
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: 150,
                                // custom Text field
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: controller1
                                            .studentPanel.passportAvailable ??
                                        "",
                                    maxLines: 1,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Divider(
                          height: 5,
                          thickness: 1,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 60))
                    ],
                  ),
                if (controller1.loadingStudentPanelData.value == false)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ));
  }
}
