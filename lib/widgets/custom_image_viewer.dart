import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CustomImageViewer extends StatelessWidget {
  String url;

  static final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  CustomImageViewer({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Image.network(url)),
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
