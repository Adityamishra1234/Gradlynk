import 'dart:io';

import 'package:adv_camera/adv_camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/test/display.dart';

class CameraApp extends StatefulWidget {
  final String id;

  const CameraApp({Key? key, required this.id}) : super(key: key);

  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  List<String> pictureSizes = <String>[];
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdvCamera(
        initialCameraType: CameraType.rear,
        onCameraCreated: _onCameraCreated,
        onImageCaptured: (String path) {
          if (this.mounted)
            setState(() {
              imagePath = path;
            });
        },

        // focusRectColor: Colors.purple,
        // focusRectSize: 200,
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "GoToNextPage",
            child: Icon(Icons.navigate_next),
            onPressed: () async {
              await cameraController!.turnOffCamera();
              await Get.to(DisplayImage(imagepath: imagePath!));
              await cameraController!.turnOnCamera();
            },
          ),
          Container(height: 16.0),
          FloatingActionButton(
            heroTag: "capture",
            child: Icon(Icons.camera),
            onPressed: () {
              cameraController!.captureImage();
            },
          ),
        ],
      ),
    );
  }

  AdvCameraController? cameraController;

  _onCameraCreated(AdvCameraController controller) {
    this.cameraController = controller;

    this.cameraController!.getPictureSizes().then((pictureSizes) {
      setState(() {
        this.pictureSizes = pictureSizes ?? <String>[];
      });
    });
  }

  Widget buildFlashSettings(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text("Flash Setting"),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            child: Row(
              children: [
                TextButton(
                  child: Text("Auto"),
                  onPressed: () {
                    cameraController!.setFlashType(FlashType.auto);
                  },
                ),
                TextButton(
                  child: Text("On"),
                  onPressed: () {
                    cameraController!.setFlashType(FlashType.on);
                  },
                ),
                TextButton(
                  child: Text("Off"),
                  onPressed: () {
                    cameraController!.setFlashType(FlashType.off);
                  },
                ),
                TextButton(
                  child: Text("Torch"),
                  onPressed: () {
                    cameraController!.setFlashType(FlashType.torch);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildRatioSettings(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text("Ratio Setting"),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            child: Row(
              children: [
                TextButton(
                  child: Text(Platform.isAndroid ? "1:1" : "Low"),
                  onPressed: () {
                    cameraController!.setPreviewRatio(CameraPreviewRatio.r1);
                    cameraController!.setSessionPreset(CameraSessionPreset.low);
                  },
                ),
                TextButton(
                  child: Text(Platform.isAndroid ? "4:3" : "Medium"),
                  onPressed: () {
                    cameraController!.setPreviewRatio(CameraPreviewRatio.r4_3);
                    cameraController!
                        .setSessionPreset(CameraSessionPreset.medium);
                  },
                ),
                TextButton(
                  child: Text(Platform.isAndroid ? "11:9" : "High"),
                  onPressed: () {
                    cameraController!.setPreviewRatio(CameraPreviewRatio.r11_9);
                    cameraController!
                        .setSessionPreset(CameraSessionPreset.high);
                  },
                ),
                TextButton(
                  child: Text(Platform.isAndroid ? "16:9" : "Best"),
                  onPressed: () {
                    cameraController!.setPreviewRatio(CameraPreviewRatio.r16_9);
                    cameraController!
                        .setSessionPreset(CameraSessionPreset.photo);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildImageOutputSettings(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text("Image Output Setting"),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: this.pictureSizes.map((pictureSize) {
              return TextButton(
                child: Text(pictureSize),
                onPressed: () {
                  cameraController!.setPictureSize(
                      int.tryParse(pictureSize.substring(
                              0, pictureSize.indexOf(":"))) ??
                          0,
                      int.tryParse(pictureSize.substring(
                              pictureSize.indexOf(":") + 1,
                              pictureSize.length)) ??
                          0);
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
