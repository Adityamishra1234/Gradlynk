import 'package:date_format/date_format.dart';
import 'package:fpdart/fpdart.dart';
import 'package:studentpanel/domain/repository/registration_repository.dart';

abstract class RegistrationUseCases {
  Future<Either<Map, int>> getSubServiceDropDownData({required ServiceID});
}

class RegistrationUseCasesImpl extends RegistrationUseCases {
  final RegistrationRepository registrationRepository;
  RegistrationUseCasesImpl(this.registrationRepository);

  @override
  Future<Either<Map, int>> getSubServiceDropDownData(
      {required ServiceID}) async {
    var data = await registrationRepository.getSubServiceDropDownData
        .call(ServiceID: ServiceID);

    if (data != []) {
      left(data);
    } else {
      right(0);
    }
    // TODO: implement getSubServiceDropDownData
    throw UnimplementedError();
  }
}
