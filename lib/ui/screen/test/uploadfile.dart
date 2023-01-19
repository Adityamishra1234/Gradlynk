import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomFileUpload extends StatefulWidget {
  const CustomFileUpload({Key? key}) : super(key: key);

  @override
  State<CustomFileUpload> createState() => _CustomFileUploadState();
}

class _CustomFileUploadState extends State<CustomFileUpload> {
  String uploadFilename = "";
  Uint8List? csvFile;
  PlatformFile? csvFile2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Spacer(),
              Text('File: $uploadFilename'),
              ElevatedButton(
                  onPressed: () async {
                    final results = await FilePicker.platform.pickFiles(
                      allowMultiple: false,
                      type: FileType.custom,
                      allowedExtensions: ['jpeg'],
                    );
                    csvFile2 = results!.files.first;
                    uploadFilename = results.files.first.name;
                    sendFile(csvFile2, uploadFilename);
                    setState(() {});
                  },
                  child: const Text('CSV Take')),
              // const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  sendFile(file, uploadFilename) async {
    var url = Uri.parse(
        "http://14.97.86.202:205/api/upload-application-document?enq_id=78623&id=29463");
    var request = http.MultipartRequest("POST", url);

    request.files.add(await http.MultipartFile.fromPath('doc', file.path,
        filename: "test.jpeg"));

    // request.headers.addAll({"Authorization": "Bearer $token"});

    request.send().then((response) {
      print("test");
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("Uploaded!");
      }
    });
  }
}
