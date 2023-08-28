import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/bookanAppointmentCounsellorAddress.dart';
import 'package:studentpanel/ui/models/branchWithImageResModel.dart';
import 'package:studentpanel/ui/models/serviceAssignesmodel.dart';
import 'package:studentpanel/utils/endpoint.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';

class BookAnAppointmentController extends GetxController with StateMixin {
  ApiServices apiServices = ApiServices();
  List<ServiceAssigneersModel> model = [];

  String dateSelected = "";
  String? timeSelected = "";

  //DropDown fields
  List<String> name = [];
  List<int> nameID = [];

  //Select
  String? nameSelected;
  int? nameSelectedID;
  Rx<int> selectMeetingBranch = 0.obs;
  RxBool loadingServiceAssigned = false.obs;
  List<BranchWithImagesModel> branchListwithFlag = <BranchWithImagesModel>[];
  bool showConnectVierually = false;

  @override
  void onInit() async {
    change(null, status: RxStatus.loading());

    await getServiceAssigned();
    await getBranchData2();
    change(null, status: RxStatus.success());
    super.onInit();
  }

  String selectedBranchAdressFromList = '';
  getBranchData2() async {
    // print('fvffg');
    var res = await apiServices.allBranch2();

    // var data =
    //     List<AllUserModel>.from(res.map((e) => AllUserModel.fromJson(e)));

    var data = List<BranchWithImagesModel>.from(
        res.map((e) => BranchWithImagesModel.fromJson(e)));
    print(data.toString());

    branchListwithFlag = data;

    // allBranchList.value = data;

    update();
  }

  // String dateSelected = '';
  callbackDatePicker(data) {
    // String temp = data.toString().split(' ')[0];
    // List<String> date = temp.split('-');
    // controller.dateSelected = date[0] + "-" + date[1] + '-' + date[2];
    dateSelected = data;

    update();
  }

  callbackTimePicker(data) {
    // String temp = data.toString().split(' ')[0];
    // List<String> date = temp.split('-');
    // controller.dateSelected = date[0] + "-" + date[1] + '-' + date[2];
    timeSelected = data;

    update();
  }

  getServiceAssigned() async {
    try {
      var res = await apiServices.getServicesAssigned(
          Endpoints.serviceAssigness! +
              Get.find<BaseController>().model1.id.toString());
      if (res != null) {
        // name.add("Select your counsellor");
        // nameID.add(0);
        model = res;
        for (var element in model) {
          name.add(element.name!);
          nameID.add(element.id!);
        }
        loadingServiceAssigned = true.obs;
        update();
      }
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }

  String branchOfAssignedCounsellor = '';

  callbackOfSelectedCounsellor(int index) async {
    change(null, status: RxStatus.loading());
    var counsellorId = nameID[index];
    BookAnAppointmentCounsellorAddress res =
        await getCounsellorBranchAddress(counsellorId);
    branchOfAssignedCounsellor = res.address!.address!;
    update();
    change(null, status: RxStatus.success());
  }

  getCounsellorBranchAddress(int counsellorId) async {
    try {
      var res = await apiServices.getCounsellorBranchAddress(counsellorId);
      if (res != null) {
        var data = BookAnAppointmentCounsellorAddress.fromJson(res);
        // name.add("Select your counsellor");
        // nameID.add(0);
        BookAnAppointmentCounsellorAddress modelc =
            BookAnAppointmentCounsellorAddress();

        modelc = data;
        return modelc;
      }
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }

  addBookAppointment() async {
    try {
      var res = await apiServices.getSheduleExpertCall(
          Endpoints.bookAnAppointmentpart1! +
              Get.find<BaseController>().model1.id.toString() +
              Endpoints.bookAnAppointmentpart2! +
              dateSelected +
              Endpoints.bookAnAppointmentpartpart3! +
              timeSelected! +
              Endpoints.bookAnAppointmentpartpart4! +
              nameSelectedID.toString(),
          SnackBarConstants.bookAnAppointment!);
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }
}
