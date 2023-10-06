import 'package:fpdart/src/either.dart';
import 'package:studentpanel/domain/repository/registration_repository.dart';
import 'package:studentpanel/services/api_services.dart';

class RegistrationRepositoryImpl extends RegistrationRepository {
  ApiServices api = ApiServices();

  @override
  Future<Either<Map, int>> getSubServiceDropDownData(
      {required ServiceID}) async {
    // TODO: implement getSubServiceDropDownData

    var data = await api.getSubServiceInRegisterData(ServiceID);

    if (data) {
      return left(data);
    } else {
      return right(0);
    }
  }
}
