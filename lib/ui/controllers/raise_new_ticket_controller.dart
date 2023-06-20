
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';

class RaiseYourTicketController extends GetxController with StateMixin {
  RxBool raiseAnIssue = true.obs;
  RxBool suggestAnImprovisation = false.obs;

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  sendFile(String enqId, String? issue, String? suggestion,
      [file, file2]) async {
    try {
      change(null, status: RxStatus.loading());
      var url = Uri.parse(
          "${Endpoints.baseUrl}contact-us?enq_id=$enqId&issue=$issue&suggestion=$suggestion");
      var request = http.MultipartRequest("POST", url);

      if (getNUllChecker(file) == false) {
        request.files.add(await http.MultipartFile.fromPath('doc1', file.path,
            filename: "sample.jpeg"));
      }
      if (getNUllChecker(file2) == false) {
        request.files.add(await http.MultipartFile.fromPath('doc2', file2.path,
            filename: "sample.jpeg"));
      }

      var res = await request.send();
      var responsed = await http.Response.fromStream(res);
      if (responsed.statusCode == 200) {
        change(null, status: RxStatus.success());
        return responsed.body;
      } else {
        return null;
      }
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }
}
