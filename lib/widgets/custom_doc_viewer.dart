import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomDocumentViewer extends StatefulWidget {
  String url;
  CustomDocumentViewer({Key? key, required this.url}) : super(key: key);
  @override
  State<CustomDocumentViewer> createState() => _CustomDocumentViewerState();
}

class _CustomDocumentViewerState extends State<CustomDocumentViewer> {
  late final WebViewController controller;

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
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
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
