import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:flutter_share/flutter_share.dart';

class CustomDownloadFile extends StatefulWidget {
  String url;
  CustomDownloadFile({Key? key, required this.url});
  @override
  _CustomDownloadFileState createState() => _CustomDownloadFileState();
}

class _CustomDownloadFileState extends State<CustomDownloadFile> {
  final Dio dio = Dio();
  bool loading = false;
  double progress = 0;

  Future<bool> saveVideo(String url, String fileName) async {
    Directory directory;
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = (await getExternalStorageDirectory())!;
          String newPath = "";
          print(directory);
          List<String> paths = directory.path.split("/");
          for (int x = 1; x < paths.length; x++) {
            String folder = paths[x];
            if (folder != "Android") {
              newPath += "/$folder";
            } else {
              break;
            }
          }
          newPath = "$newPath/SIEC";
          directory = Directory(newPath);
        } else {
          return false;
        }
      } else {
        if (await _requestPermission(Permission.storage)) {
          print("aman2");
          directory = await getApplicationDocumentsDirectory();
          print("aman3");
        } else {
          return false;
        }
      }
      File saveFile = File("${directory.path}/$fileName");
      if (!await directory.exists()) {
        print("aman4");
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        print("aman5");
        await dio.download(url, saveFile.path,
            onReceiveProgress: (value1, value2) {
          setState(() {
            progress = value1 / value2;
            print(progress);
          });
        });
        if (Platform.isIOS) {
          print("aman6");

          shareFile(saveFile.path);
        }
        return true;
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

  downloadFile() async {
    setState(() {
      loading = true;
      progress = 0;
    });
    bool downloaded = await saveVideo(
        widget.url,
        reverseStringUsingSplit(
            reverseStringUsingSplit(widget.url).split("/")[0]));
    if (downloaded) {
      Get.snackbar("File download", "complete download",
          snackPosition: SnackPosition.BOTTOM);
    } else {
      print("Problem Downloading File");
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: loading
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: LinearProgressIndicator(
                  minHeight: 10,
                  value: progress,
                ),
              )
            : ElevatedButton.icon(
                icon: const Icon(
                  Icons.download_rounded,
                  color: Colors.white,
                ),
                onPressed: downloadFile,

                // downloadFile,
                label: const Text(
                  "Download Video",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )),
      ),
    );
  }

//
  Future<void> shareFile(String filepath) async {
    print("aman1");
    await FlutterShare.shareFile(
      title: filepath,
      filePath: filepath,
    );
    print("aman7");
  }
}
