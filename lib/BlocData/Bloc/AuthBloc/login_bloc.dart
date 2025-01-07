

import '../../Repositories/auth_repo/login_repo.dart';




class LoginBloc {
  final LoginRepo _repo;
  LoginBloc(this._repo);



  // ValueNotifier<bool> loginLoading = ValueNotifier(false);
  //
  // Future getLoginData() async {
  //   loginLoading.value = true;
  //   try {
  //     if (loginLoading.value == true) {
  //       var res = await _repo.fetchLoginData();
  //       if (res != null) {
  //         profileDataModel = ProfileDataModel.fromJson(res);
  //       }
  //     }
  //   } catch (e, s) {
  //     debugPrint('$e');
  //     debugPrintStack(stackTrace: s);
  //   } finally {
  //     loginLoading.value = false;
  //   }
  // }

}
