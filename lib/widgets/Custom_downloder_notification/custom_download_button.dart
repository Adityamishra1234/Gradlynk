import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';

import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:nice_loading_button/nice_loading_button.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:permission_handler/permission_handler.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/Custom_downloder_notification/custom_notification.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CustomDownloadButton extends StatefulWidget {
  final String path;
  final String payload;
  const CustomDownloadButton(
      {super.key, required this.path, required this.payload});

  @override
  State<CustomDownloadButton> createState() => _CustomDownloadButtonState();
}

class _CustomDownloadButtonState extends State<CustomDownloadButton> {
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NotificationService.initializeNotification();
  }

  // downloadFile() async {
  //   var status2 = await Permission.storage.status;
  //   var ImageStatus = await Permission.photos.status;

  //   var status = await Permission.manageExternalStorage.status;
  //   var notificationStatus = await Permission.notification.status;

  //   final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //   AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //   var sdkVersion = await androidInfo.version.sdkInt;

  //   print(sdkVersion);

  //   if (sdkVersion > 30) {
  //     var x = await Permission.manageExternalStorage.request();
  //     var y = await Permission.notification.request();

  //     if (x.isGranted && y.isGranted) {
  //       await downloadMainFunction();
  //     } else {
  //       getToast(SnackBarConstants.flutterStroageToast);
  //     }
  //   }

  //   if (sdkVersion == 30) {
  //     var x = await Permission.manageExternalStorage.request();

  //     var y = await Permission.storage.request();
  //     if (x.isGranted) {
  //       await downloadMainFunction();
  //     } else {
  //       getToast(SnackBarConstants.flutterStroageToast);
  //     }
  //   }

  //   if (sdkVersion < 30) {
  //     var x = await Permission.storage.request();
  //     if (x.isGranted) {
  //       await downloadMainFunction();
  //     } else {
  //       getToast(SnackBarConstants.flutterStroageToast);
  //     }
  //   }

  //   // if (status.isGranted && status2.isGranted) {
  //   //   await downloadMainFunction();
  //   // } else {
  //   //   FlutterToastConstant().getToast('Please give storage access');
  //   // }
  // }

  Future download(String url) async {
    var status = await Permission.storage.request();
    var d = await Permission.photos.request();
    var y = await Permission.notification.request();

    // print(status);
    // if (await Permission.storage.request().isGranted) {
    final io.Directory tempDir = await getTemporaryDirectory();

    final io.Directory appDocumentsDir =
        await getApplicationDocumentsDirectory();

    bool dirDownloadExists = true;
    var directory;
    if (io.Platform.isIOS) {
      directory = (await getApplicationDocumentsDirectory()).path;
    } else {
      directory = "/storage/emulated/0/Download/";

      dirDownloadExists = await io.Directory(directory).exists();
      if (dirDownloadExists) {
        directory = "/storage/emulated/0/Download/";
      } else {
        directory = "/storage/emulated/0/Downloads/";
      }
    }

    String basenames = path.basename(url);
    final finalPath = path.join(directory, basenames);
    io.File saveFile = io.File('$finalPath');

    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    var sdkVersion = await androidInfo.version.sdkInt;

    print(sdkVersion);

// 33=> d
// 30 less=>status
    if (sdkVersion > 30) {
      if (d.isGranted) {
        if (y.isGranted) {
          await FileDownloader.downloadFile(
              url: url,
              name: basenames,
              onDownloadCompleted: (String paths) {
                var newpath = paths;
                NotificationService.showNotification(
                    title: 'Downlaod Completed',
                    body: 'Click to Open',
                    payload: {'path': '$newpath', 'type': '${widget.payload}'});
              },
              onDownloadError: (String error) {
                print('DOWNLOAD ERROR: $error');
              });
        } else {
          await Permission.notification.request();
        }
      } else {
        getToast(SnackBarConstants.flutterStroageToast);
        Future.delayed(const Duration(seconds: 2))
            .then((value) => openAppSettings());
      }
    } else {
      if (status.isGranted) {
        if (y.isGranted) {
          await FileDownloader.downloadFile(
              url: url,
              name: basenames,
              onDownloadCompleted: (String paths) {
                var newpath = paths;
                NotificationService.showNotification(
                    title: 'Downlaod Completed',
                    body: 'Click to Open',
                    payload: {'path': '$newpath', 'type': '${widget.payload}'});
              },
              onDownloadError: (String error) {
                print('DOWNLOAD ERROR: $error');
              });
        } else {
          await Permission.notification.request();
        }
      } else {
        getToast(SnackBarConstants.flutterStroageToast);
        Future.delayed(const Duration(seconds: 2))
            .then((value) => openAppSettings());
      }
    }

    // }

    // await dio.Dio().download(url, saveFile.path);

    // print(saveFile.path);

    setState(() {
      _isLoading = false;
    });

    // var res = await FlutterDownloader.enqueue(
    //   url: url,

    //   headers: {}, // optional: header send with url (auth token etc)
    //   savedDir: directory,
    //   saveInPublicStorage: true,
    //   showNotification:
    //       false, // show download progress in status bar (for Android)
    //   openFileFromNotification:
    //       false, // click on notification to open downloaded file (for Android)
    // );

    // }
  }

  Future<void> downloadMainFunction() async {
    io.HttpClient httpClient = new io.HttpClient();
    io.File file;
    String filePath = '';
    String myUrl = '';
    try {
      String myUrl = '${widget.path}';

      io.Directory? applicationpath = await getExternalStorageDirectory();

      print(applicationpath);

      final indexOf = applicationpath!.path.indexOf('0');
      final pathTemp = applicationpath!.path.substring(0, indexOf + 1);
      var request = await httpClient.getUrl(Uri.parse(myUrl));
      var response = await request.close();
      var theMainPath = "${pathTemp}/gradlynk";
      io.Directory finalDirectory = io.Directory(theMainPath);
      String basenames = path.basename(myUrl);
      final finalPath = path.join(theMainPath, basenames);
      io.File saveFile = io.File('$finalPath');
      if (!await finalDirectory.exists()) {
        await finalDirectory.create(recursive: true);
      }
      if (await finalDirectory.exists()) {
        await dio.Dio().download(myUrl, saveFile.path);
        setState(() {
          _isLoading = false;
        });
        await NotificationService.showNotification(
            title: 'Download Completed',
            body: 'Click to Open',
            payload: {'path': '${saveFile.path}', 'type': '${widget.payload}'});
      } else
        filePath = 'Error code: ' + response.statusCode.toString();
    } catch (ex) {
      filePath = 'Can not fetch url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LoadingButton(
        height: 35,
        borderRadius: 8,
        animate: true,
        color: ThemeConstants.bluecolor,
        width: MediaQuery.of(context).size.width * 0.44,
        loader: Container(
          padding: const EdgeInsets.all(10),
          width: 40,
          height: 40,
          child: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
        child: CustomAutoSizeTextMontserrat(
          text: 'Download',
          textColor: ThemeConstants.whitecolor,
        ),
        onTap: (startLoading, stopLoading, buttonState) async {
          print(widget.path);
          if (buttonState == ButtonState.idle) {
            startLoading();
            await download(widget.path);
            // await Future.delayed(const Duration(seconds: 5))
            stopLoading();
          }
        },
      ),
    );

    //      Container(
    //       width: 150,
    //       height: 40,
    //       // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
    //       alignment: Alignment.center,
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(30),
    //         color: ThemeConstants.bluecolor,
    //       ),
    //       child: _isLoading
    //           ? SizedBox(
    //               child: CircularProgressIndicator(
    //                   color: ThemeConstants.whitecolor),
    //               height: 20.0,
    //               width: 20.0,
    //             )
    //           : Text('Downlaod', style: ThemeConstants.defaultTextStyle),
    //     ),
    //   ),
    // );
  }
}
