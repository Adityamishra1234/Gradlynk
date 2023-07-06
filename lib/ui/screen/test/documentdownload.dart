import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:studentpanel/widgets/permission_service.dart';
import 'package:wakelock/wakelock.dart';
import 'package:path_provider/path_provider.dart';

class DocumentTest extends StatefulWidget {
  static const routeNamed = '/DocumentTest';

  const DocumentTest({super.key});
  @override
  _DocumentTestState createState() => _DocumentTestState();
}

class _DocumentTestState extends State<DocumentTest> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    Wakelock.enable();
    super.initState();
    if (!Platform.isMacOS) initCheckPermission();
    initPlatformState();
  }

  void initCheckPermission() async {
    final handler = PermissionsService();
    await handler.requestPermission(
      Permission.storage,
      onPermissionDenied: () => setState(
        () => debugPrint("Error: "),
      ),
    );
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String filePath;

    const url = "https://filesamples.com/samples/document/pdf/sample3.pdf";
    //
    // Platform messages may fail, so we use a try/catch PlatformException.
    //"https://file-examples-com.github.io/uploads/2017/02/file_example_XLS_5000.xls";
    //"https://file-examples-com.github.io/uploads/2017/02/file_example_XLS_5000.xls";
    //"https://file-examples-com.github.io/uploads/2017/02/zip_10MB.zip";

    // final name = await OpenDocument.getNameFile(url: url);

    final path = (await getExternalStorageDirectory())!;
    filePath = "$path";

    // final isCheck = await OpenDocument.checkDocument(filePath: filePath);

    // debugPrint("Exist: $isCheck \nPath: $filePath");
    // try {
    // if (!isCheck) {
    filePath = await downloadFile(filePath: filePath, url: url);
    // }
    // await OpenDocument.openDocument(
    //   filePath: filePath,
    // );
    // }
    //  on OpenDocumentException catch (e) {
    //   debugPrint("ERROR: ${e.errorMessage}");
    //   filePath = 'Failed to get platform version.';
    // }

    setState(() {
      _platformVersion = filePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    // StyleMyFile.elevatedButtonText = "Compartilhar";
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.open_in_new),
        ),
      ),
    );
  }

  Future<String> downloadFile(
      {required String filePath, required String url}) async {
    // CancelToken cancelToken = CancelToken();
    Dio dio = Dio();
    await dio.download(
      url,
      filePath,
      onReceiveProgress: (count, total) {
        debugPrint('---Download----Rec: $count, Total: $total');
        setState(() {
          _platformVersion = "${((count / total) * 100).toStringAsFixed(0)}%";
        });
      },
    );

    return filePath;
  }

  // _pushScreen() async {
  //   String name = await OpenDocument.getNameFolder(widowsFolder: "Julia");

  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => MyFilesScreen(filePath: name),
  //     ),
  //   );
  // }
}
