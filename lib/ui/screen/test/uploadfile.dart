import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:studentpanel/ui/screen/test/multipartrequest.dart';
import 'package:studentpanel/utils/endpoint.dart';

typedef OnUploadProgressCallback = void Function(int sentBytes, int totalBytes);

class CustomFileUpload extends StatefulWidget {
  String enq_id;
  String id;
  CustomFileUpload({Key? key, required this.enq_id, required this.id})
      : super(key: key);

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
                    // fileUploadMultipart(
                    //     csvFile2, callbacktest, widget.enq_id, widget.id);
                    sendFile(
                        csvFile2, uploadFilename, widget.enq_id, widget.id);
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

  sendFile(file, uploadFilename, String enqId, String id) async {
    var url = Uri.parse(
        "${Endpoints.baseUrl}upload-application-document?enq_id=$enqId&id=$id");
    var request = http.MultipartRequest("POST", url);

    request.files.add(await http.MultipartFile.fromPath('doc', file.path,
        filename: "ample.jpeg"));
    var res = await request.send();
    var responsed = await http.Response.fromStream(res);
    if (responsed.statusCode == 200) {
      responsed.body;
    } else {
      print(responsed.statusCode);
    }
  }

  fileUploadMultipart(file, onUploadProgress, String enqId, String id) async {
    assert(file != null);

    var url = Uri.parse(
        "${Endpoints.baseUrl}upload-application-document?enq_id=$enqId&id=$id");

    final httpClient = getHttpClient();

    final request = await httpClient.postUrl(url);

    int byteCount = 0;

    var multipart = await http.MultipartFile.fromPath('doc', file.path,
        filename: file.path);

    var requestMultipart = http.MultipartRequest("POST", url);

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

  readResponseAsString(HttpClientResponse response) {
    var completer = Completer<String>();
    var contents = StringBuffer();
    response.transform(utf8.decoder).listen((String data) {
      contents.write(data);
    }, onDone: () => completer.complete(contents.toString()));
    return completer.future;
  }

  getielUpload(file, onUploadProgress, String enqId, String id) async {
    var url = Uri.parse(
        "${Endpoints.baseUrl}upload-application-document?enq_id=$enqId&id=$id");
    final request = MultipartRequest(
      'POST',
      url,
      onProgress: (int bytes, int total) {
        final progress = bytes / total;
        print('progress: $progress ($bytes/$total)');
      },
    );

// request.headers['HeaderKey'] = 'header_value';
// request.fields['form_key'] = 'form_value';
    request.files.add(await http.MultipartFile.fromPath('doc', file.path,
        filename: file.path));

    final streamedResponse = await request.send();
  }
}
