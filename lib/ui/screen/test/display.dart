import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/test/camera.dart';

class DisplayImage extends StatelessWidget {
  String imagepath;
  DisplayImage({Key? key, required this.imagepath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 20,
              top: 20,
              child: IconButton(
                icon: Icon(Icons.abc),
                onPressed: () {
                  String id = DateTime.now().toIso8601String();
                  Get.to(CameraApp(id: id));
                },
              )),
          Center(
              child: Container(
            child: Image.file(File(imagepath)),
          )),
        ],
      ),
    );
  }
}
