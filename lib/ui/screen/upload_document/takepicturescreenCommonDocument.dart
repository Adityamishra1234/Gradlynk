import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/applicationcompletedetails.dart';
import 'package:studentpanel/ui/controllers/uploaddocumentcontroller.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';

class TakePictureScreenCommonDocument extends StatefulWidget {
  TakePictureScreenCommonDocument(
      {super.key,
      required this.camera,
      required this.id,
      required this.orgName});

  final CameraDescription camera;
  String? id;

  String? orgName;

  @override
  TakePictureScreenCommonDocumentState createState() =>
      TakePictureScreenCommonDocumentState();
}

class TakePictureScreenCommonDocumentState
    extends State<TakePictureScreenCommonDocument> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  var cameras;
  bool backCamera = true;

  @override
  initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.low,
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
            return Center(
              child: getLoading(context),
            );
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
                            id: widget.id,

                            applicationId: widget.orgName,
                          ),
                        ),
                      );
                    } catch (e) {
                      // If an error occurs, log the error to the console.
                      print(e);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: svgImage(
                        "cameracapture", ThemeConstants.whitecolor, 25, 25),
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
                  child: svgImage(
                      "switchcamera", ThemeConstants.bluecolor, 20, 20),
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
  String? id;
  String? index;
  String? applicationId;

  DisplayPictureScreen(
      {super.key,
      required this.imagePath,
      this.id,
      this.index,
      required this.applicationId});

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
            padding: const EdgeInsets.only(left: 10, top: 45),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: InkWell(
                onTap: () async {
                  final cameras = await availableCameras();

                  // Get a specific camera from the list of available cameras.
                  final firstCamera = cameras.first;
                  // String id = DateTime.now().toIso8601String();   //TODO
                  Get.to(TakePictureScreenCommonDocument(
                    camera: firstCamera,
                    id: id,
                    orgName: applicationId,
                  ));
                },
                child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        color: ThemeConstants.whitecolor,
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.close,
                      size: 25,
                      color: ThemeConstants.bluecolor,
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
                  // String id = DateTime.now().toIso8601String();   //TODO
                  Get.to(TakePictureScreenCommonDocument(
                    camera: firstCamera,
                    id: id,
                    orgName: applicationId,
                  ));
                },
                child: InkWell(
                  onTap: () {
                    print("object");
                    Get.find<UploadDocumentController>().uploadFileCamera(
                        id!, imagePath,
                        orgName: applicationId!);
                  },
                  child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: ThemeConstants.bluecolor,
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.check,
                        size: 35,
                        color: ThemeConstants.whitecolor,
                      )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
