import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:nice_loading_button/nice_loading_button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/Custom_downloder_notification/custom_download_button.dart';
import 'package:studentpanel/widgets/Custom_downloder_notification/custom_notification_payload_types.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class FileDownload extends StatefulWidget {
  String url;
  FileDownload({super.key, required this.url});

  @override
  State<FileDownload> createState() => _FileDownloadState();
}

class _FileDownloadState extends State<FileDownload> {
  final Dio dio = Dio();
  bool loading = false;
  double progress = 0;

  final ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();

    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = DownloadTaskStatus(data[1]);
      int progress = data[2];
      setState(() {});
    });

    FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      //TODO for Android
      return Text("test");
      // CustomDownloadButton(
      //     path: widget.url, payload: PayloadTypes.download);
    } else {
      return LoadingButton(
        height: 35,
        borderRadius: 8,
        animate: true,
        color: Colors.indigo,
        width: 120,
        loader: Container(
          padding: const EdgeInsets.all(20),
          width: 30,
          height: 30,
          child: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
        child: Icon(
          Icons.download_rounded,
          size: 16,
        ),

        // CustomAutoSizeTextMontserrat(
        //   text: "Download",
        //   textColor: ThemeConstants.whitecolor,
        // ),
        onTap: (startLoading, stopLoading, buttonState) async {
          if (buttonState == ButtonState.idle) {
            startLoading();
            // Do something here
            // getToast("Please wait for download");
            if (Platform.isAndroid) {
              await download(widget.url);
            } else if (Platform.isIOS) {
              await downloadFile(widget.url);
            }
            stopLoading();
          }
        },
      );
    }
  }

  Future<bool> saveVideo(String url, String fileName) async {
    Directory directory;
    try {
      if (Platform.isAndroid) {
        //TODO
        download(url);
        // if (await _requestPermission(Permission.storage)) {
        //   directory = (await getExternalStorageDirectory())!;
        //   String newPath = "";
        //   List<String> paths = directory.path.split("/");
        //   for (int x = 1; x < paths.length; x++) {
        //     String folder = paths[x];
        //     if (folder != "Android") {
        //       newPath += "/$folder";
        //     } else {
        //       break;
        //     }
        //   }
        //   newPath = "$newPath/SIEC";
        //   directory = Directory(newPath);
        // } else {
        //   return false;
        // }
      } else {
        if (await _requestPermission(Permission.storage)) {
          directory = await getApplicationDocumentsDirectory();

          File saveFile = File("${directory.path}/$fileName");
          if (!await directory.exists()) {
            await directory.create(recursive: true);
          }
          if (await directory.exists()) {
            await dio.download(url, saveFile.path,
                onReceiveProgress: (value1, value2) {
              setState(() {
                progress = value1 / value2;
                print(progress);
              });
            });
            if (Platform.isIOS) {
              shareFile(saveFile.path);
            }
            return true;
          }
        } else {
          return false;
        }
      }

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  downloadFile(String url) async {
    setState(() {
      loading = true;
      progress = 0;
    });
    bool downloaded = await saveVideo(url,
        reverseStringUsingSplit(reverseStringUsingSplit(url).split("/")[0]));
    if (downloaded) {
      // if (Platform.isAndroid) {
      //   Get.snackbar("File download", "complete download",
      //       snackPosition: SnackPosition.BOTTOM);
      // }
    } else {
      print("Problem Downloading File");
    }
    setState(() {
      loading = false;
    });
  }

  Future<void> shareFile(String filepath) async {
    await FlutterShare.shareFile(
      title: filepath,
      filePath: filepath,
    );
  }

  Future download(String url) async {
    try {
      var status = await Permission.storage.request();
      await getExternalStorageDirectories();
      if (await Permission.storage.request().isGranted) {
        final Directory tempDir = await getTemporaryDirectory();

        final Directory appDocumentsDir =
            await getApplicationDocumentsDirectory();

        bool dirDownloadExists = true;
        String directory;
        if (Platform.isIOS) {
          directory = (await getApplicationDocumentsDirectory()).path;
        } else {
          directory = "/storage/emulated/0/Download/";

          dirDownloadExists = await Directory(directory).exists();
          if (dirDownloadExists) {
            directory = "/storage/emulated/0/Download/";
          } else {
            directory = "/storage/emulated/0/Downloads/";
          }
        }
        var res = await FlutterDownloader.enqueue(
          url: url,

          headers: {}, // optional: header send with url (auth token etc)
          savedDir: directory,

          saveInPublicStorage: true,
          showNotification:
              true, // show download progress in status bar (for Android)
          openFileFromNotification:
              false, // click on notification to open downloaded file (for Android)
        );
      }
    } catch (e) {
      print("object");
    }
  }
}
