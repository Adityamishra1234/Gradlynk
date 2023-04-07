import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/controllers/countryguidecontroller.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

class CountryGuide extends StatelessWidget {
  CountryGuide({super.key});
  static const routeNamed = '/CountryGuide';
  GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  var controller = Get.put(CountryGuideController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("title", false),
        drawer: CustomDrawer(
          index: 8,
        ),
        body: GetBuilder<CountryGuideController>(
          builder: (_) => _.loadingCountryGuide.value == true
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomAutoSizeTextMontserrat(
                            text: "Country Guide",
                            textColor: ThemeConstants.bluecolor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: CustomAutoSizeTextMontserrat(
                            text: "Country",
                            mandatory: true,
                            // fontWeight: FontWeight.bold,,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        // width: 300,
                        height: 45,
                        child: CustomDropDownSingle(
                          model: getDropdownModel(
                            true,
                            _.countrySelected,
                            _.countrylist,
                          ),
                          initialSelectedValue: getSelectedDropDown(
                            true,
                            _.countrySelected,
                            _.countrylist,
                          ),
                          choosefieldtype: false,
                          callbackFunction: callback,
                        ),
                      ),
                      if (_.viewDetailsSelected != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 10, right: 10),
                          child: Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: ThemeConstants.whitecolor,
                                side: BorderSide(
                                    color: ThemeConstants.orangeColor),
                                backgroundColor:
                                    ThemeConstants.whitecolor, // foreground
                              ),
                              onPressed: () {
                                _launchURL(_.viewDetailsSelected!);
                              },
                              child: CustomAutoSizeTextMontserrat(
                                text: "View details",
                                textColor: ThemeConstants.orangeColor,
                              ),
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: Align(
                                alignment: AlignmentDirectional.topStart,
                                child: InteractiveViewer(
                                    child: Image.network(_.url ?? "")))),
                      ),
                    ],
                  ),
                )
              : getLoading(context),
        ));
  }

  // Function
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

  callback(data) {
    for (var i = 0; i < controller.model.length; i++) {
      if (data == controller.model[i].country) {
        controller.url = controller.model[i].document;
        controller.countrySelected = controller.model[i].country;
        controller.viewDetailsSelected = controller.model[i].details;
      }
    }
    controller.update();
  }

  _launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
