import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

typedef void OnUploadProgressCallback(int sentBytes, int totalBytes);

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
                      allowedExtensions: ['mp4'],
                    );
                    csvFile2 = results!.files.first;
                    uploadFilename = results.files.first.name;
                    fileUploadMultipart(
                        file: csvFile2, onUploadProgress: callbacktest);
                    // sendFile(csvFile2, uploadFilename);
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

  callbacktest(data) {
    print(data.toString());
  }

  static bool trustSelfSigned = true;
  static HttpClient getHttpClient() {
    HttpClient httpClient = HttpClient()
      ..connectionTimeout = const Duration(seconds: 10)
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);

    return httpClient;
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

  //

  static Future<String> fileUploadMultipart({file, onUploadProgress}) async {
    assert(file != null);

    const url =
        'http://14.97.86.202:205/api/upload-application-document?enq_id=78623&id=29463';

    final httpClient = getHttpClient();

    final request = await httpClient.postUrl(Uri.parse(url));

    int byteCount = 0;

    var multipart = await http.MultipartFile.fromPath('doc', file.path,
        filename: "test.mp4");

    // final fileStreamFile = file.openRead();

    // var multipart = MultipartFile("file", fileStreamFile, file.lengthSync(),
    //     filename: fileUtil.basename(file.path));

    var requestMultipart = http.MultipartRequest("POST", Uri.parse("uri"));

    requestMultipart.files.add(multipart);

    var msStream = requestMultipart.finalize();

    var totalByteLength = requestMultipart.contentLength;

    request.contentLength = totalByteLength;

    request.headers.set(HttpHeaders.contentTypeHeader,
        requestMultipart.headers[HttpHeaders.contentTypeHeader]!);

    Stream<List<int>> streamUpload = msStream.transform(
      StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          sink.add(data);

          byteCount += data.length;

          // if (onUploadProgress != null) {
          //   onUploadProgress(byteCount, totalByteLength);
          //   // CALL STATUS CALLBACK;
          // }
          onUploadProgress!((byteCount / totalByteLength).toStringAsFixed(2));
        },
        handleError: (error, stack, sink) {
          throw error;
        },
        handleDone: (sink) {
          sink.close();
          // UPLOAD DONE;
        },
      ),
    );

    await request.addStream(streamUpload);

    final httpResponse = await request.close();
//
    var statusCode = httpResponse.statusCode;

    if (statusCode ~/ 100 != 2) {
      throw Exception(
          'Error uploading file, Status code: ${httpResponse.statusCode}');
    } else {
      return await readResponseAsString(httpResponse);
    }
  }

  static Future<String> readResponseAsString(HttpClientResponse response) {
    var completer = Completer<String>();
    var contents = StringBuffer();
    response.transform(utf8.decoder).listen((String data) {
      contents.write(data);
    }, onDone: () => completer.complete(contents.toString()));
    return completer.future;
  }

  // static Future<String> fileDownload(
  //     {String fileName, OnUploadProgressCallback onDownloadProgress}) async {
  //   assert(fileName != null);

  //   final url = Uri.encodeFull('$baseUrl/api/file/$fileName');

  //   final httpClient = getHttpClient();

  //   final request = await httpClient.getUrl(Uri.parse(url));

  //   request.headers
  //       .add(HttpHeaders.contentTypeHeader, "application/octet-stream");

  //   var httpResponse = await request.close();

  //   int byteCount = 0;
  //   int totalBytes = httpResponse.contentLength;

  //   Directory appDocDir = await getApplicationDocumentsDirectory();
  //   String appDocPath = appDocDir.path;

  //   //appDocPath = "/storage/emulated/0/Download";

  //   File file = new File(appDocPath + "/" + fileName);

  //   var raf = file.openSync(mode: FileMode.write);

  //   Completer completer = new Completer<String>();

  //   httpResponse.listen(
  //     (data) {
  //       byteCount += data.length;

  //       raf.writeFromSync(data);

  //       if (onDownloadProgress != null) {
  //         onDownloadProgress(byteCount, totalBytes);
  //       }
  //     },
  //     onDone: () {
  //       raf.closeSync();

  //       completer.complete(file.path);
  //     },
  //     onError: (e) {
  //       raf.closeSync();
  //       file.deleteSync();
  //       completer.completeError(e);
  //     },
  //     cancelOnError: true,
  //   );

  //   return completer.future;
  // }
}
