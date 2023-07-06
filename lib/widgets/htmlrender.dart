import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HtmlRender extends StatefulWidget {
  String htmlString;
  HtmlRender({Key? key, required this.htmlString}) : super(key: key);
  @override
  State<HtmlRender> createState() => _HtmlRenderState();
}

class _HtmlRenderState extends State<HtmlRender> {
  late final WebViewController controller;
  bool loading = false;
  bool errorMessage = false;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() {
              loading = true;
            });
          },
          onWebResourceError: (WebResourceError error) {
            print("object");
            print(error.description);
            print(error.errorCode);
            print(error.errorType);
            print(error.isForMainFrame);
            setState(() {
              print("object");
              errorMessage = true;
            });
          },
        ),
      )
      ..loadHtmlString(widget.htmlString);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading == false
          ? getLoading(context)
          : Stack(
              children: [
                errorMessage == true
                    ? Container(
                        color: ThemeConstants.whitecolor,
                        alignment: Alignment.center,
                        child: CustomAutoSizeTextMontserrat(
                          text:
                              "SomeThing went wrong \n Please try after some time !!",
                          textColor: ThemeConstants.TextColor,
                          fontWeight: FontWeight.bold,
                        ))
                    : SafeArea(
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: WebViewWidget(controller: controller)),
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
