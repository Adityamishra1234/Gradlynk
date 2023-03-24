import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CustomPDFViewer extends StatelessWidget {
  String url;

  GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  CustomPDFViewer({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SfPdfViewer.network(
                canShowScrollHead: false,
                url,
                key: _pdfViewerKey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, right: 20),
            child: Align(
              alignment: AlignmentDirectional.topEnd,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: ThemeConstants.lightgreycolor,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.close,
                      color: ThemeConstants.blackcolor,
                      size: 30,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
