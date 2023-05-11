import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/receiveACallback/controllers/receiveACallback_controller.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/Custom%20Dropdown/custom_dropdown.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customdrawer.dart';
import 'package:studentpanel/widgets/dropdown_multi_select/custom_dropdown.dart';

class ReceiveACallBackView extends StatelessWidget {
  ReceiveACallBackView({super.key});

  var controller = Get.put(ReceiveACallbackController());

  static String routeNamed = '/recieveACallback';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("sss"),
        drawer: CustomDrawer(),
        body: controller.obx(
            (state) => Container(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomDropDownSingle(
                          model: controller.name,
                          initialSelectedValue: "${controller.oo.value}",
                          choosefieldtype: false,
                          callbackFunction: (value) {
                            controller.oo.value = value;
                            controller.update();
                            // controller.updatedata(value);
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: ThemeConstants.bluecolor,
                              borderRadius: BorderRadius.circular(10)),
                          child: InkWell(
                            onTap: () {
                              if (controller.oo.value !=
                                  'Receive a call back') {
                                getToast(SnackBarConstants.receiveACallback);
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Text(
                                'Submit',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                        // CustomDropDownSingleMulti(
                        //     model: controller.name,
                        //     enableMultiSelect: false,
                        //     initialSelectedValue: "initialSelectedValue")
                      ]),
                ),
            onLoading: getLoading(context)));
  }
}
