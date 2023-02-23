import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CountryGuide extends StatelessWidget {
  CountryGuide({super.key});
  static const routeNamed = '/CountryGuide';
  GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("title"),
      drawer: CustomDrawer(
        index: 8,
      ),
      body: SingleChildScrollView(
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
                  Get.find<BaseController>().countrylist[0],
                  Get.find<BaseController>().countrylist,
                ),
                initialSelectedValue: getSelectedDropDown(
                  true,
                  Get.find<BaseController>().countrylist[0],
                  Get.find<BaseController>().countrylist,
                ),
                choosefieldtype: false,
                callbackFunction: callback,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10),
              child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: ThemeConstants.whitecolor,
                    side: BorderSide(color: ThemeConstants.orangeColor),
                    backgroundColor: ThemeConstants.whitecolor, // foreground
                  ),
                  onPressed: () {
                    // getViewDocument(_.model.fullOfferDoc);
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
                child: SfPdfViewer.network(
                  canShowScrollHead: false,
                  'https://www.africau.edu/images/default/sample.pdf',
                  key: _pdfViewerKey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
    print(data);
  }
}
