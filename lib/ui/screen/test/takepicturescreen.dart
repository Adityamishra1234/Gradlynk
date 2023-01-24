import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/utils/theme.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  var cameras;
  bool backCamera = true;

  getcamera() async {
    cameras = await availableCameras();
  }

  @override
  initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.ultraHigh,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
    backCamera = true;
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: CameraPreview(_controller));
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: SizedBox(
              height: 65,
              width: 65,
              child: FloatingActionButton(
                  backgroundColor: ThemeConstants.bluecolor,
                  // Provide an onPressed callback.
                  onPressed: () async {
                    // Take the Picture in a try / catch block. If anything goes wrong,
                    // catch the error.
                    try {
                      // Ensure that the camera is initialized.
                      await _initializeControllerFuture;

                      // Attempt to take a picture and get the file `image`
                      // where it was saved.
                      final image = await _controller.takePicture();

                      if (!mounted) return;

                      // If the picture was taken, display it on a new screen.
                      await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DisplayPictureScreen(
                            // Pass the automatically generated path to
                            // the DisplayPictureScreen widget.
                            imagePath: image.path,
                          ),
                        ),
                      );
                    } catch (e) {
                      // If an error occurs, log the error to the console.
                      print(e);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/icons/cameracapture.svg",
                      color: ThemeConstants.whitecolor,
                    ),
                  )),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Container(
              height: 50,
              width: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () async {
                    if (backCamera == true) {
                      final cameras =
                          await availableCameras(); //get list of available cameras
                      final frontCam = cameras[1];

                      _controller = CameraController(
                        // Get a specific camera from the list of available cameras.
                        frontCam,
                        // Define the resolution to use.
                        ResolutionPreset.ultraHigh,
                      );

                      // Next, initialize the controller. This returns a Future.
                      _initializeControllerFuture = _controller.initialize();
                      backCamera = false;
                    } else {
                      final cameras =
                          await availableCameras(); //get list of available cameras
                      final back = cameras.first;
                      _controller = CameraController(
                        // Get a specific camera from the list of available cameras.
                        back,
                        // Define the resolution to use.
                        ResolutionPreset.ultraHigh,
                      );

                      // Next, initialize the controller. This returns a Future.
                      _initializeControllerFuture = _controller.initialize();
                      backCamera = true;
                    }
                    setState(() {});
                  },
                  child: SvgPicture.asset(
                    "assets/icons/switchcamera.svg",
                    color: ThemeConstants.bluecolor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Stack(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Image.file(
                File(imagePath),
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 40),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: InkWell(
                onTap: () async {
                  final cameras = await availableCameras();

                  // Get a specific camera from the list of available cameras.
                  final firstCamera = cameras.first;
                  // String id = DateTime.now().toIso8601String();
                  Get.to(TakePictureScreen(
                    camera: firstCamera,
                  ));
                },
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: ThemeConstants.lightgreycolor,
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.close,
                      size: 40,
                      color: ThemeConstants.whitecolor,
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, bottom: 40),
            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: InkWell(
                onTap: () async {
                  final cameras = await availableCameras();

                  // Get a specific camera from the list of available cameras.
                  final firstCamera = cameras.first;
                  // String id = DateTime.now().toIso8601String();
                  Get.to(TakePictureScreen(
                    camera: firstCamera,
                  ));
                },
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: ThemeConstants.bluecolor,
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.check,
                      size: 40,
                      color: ThemeConstants.whitecolor,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
