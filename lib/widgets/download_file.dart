// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:get/get.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:studentpanel/utils/constants.dart';
// import 'package:flutter_share/flutter_share.dart';

// class CustomDownloadFile extends StatefulWidget {
//   String url;
//   CustomDownloadFile({Key? key, required this.url});
//   @override
//   _CustomDownloadFileState createState() => _CustomDownloadFileState();
// }

// class _CustomDownloadFileState extends State<CustomDownloadFile> {
//   final Dio dio = Dio();
//   bool loading = false;
//   double progress = 0;



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: loading
//             ? Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: LinearProgressIndicator(
//                   minHeight: 10,
//                   value: progress,
//                 ),
//               )
//             : ElevatedButton.icon(
//                 icon: const Icon(
//                   Icons.download_rounded,
//                   color: Colors.white,
//                 ),
//                 onPressed: downloadFile,

//                 // downloadFile,
//                 label: const Text(
//                   "Download Video",
//                   style: TextStyle(color: Colors.white, fontSize: 25),
//                 )),
//       ),
//     );
//   }
// }
