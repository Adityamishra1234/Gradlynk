import 'dart:async';

import 'package:fpdart/fpdart.dart';

abstract class RegistrationRepository {
  Future<Either<Map, int>> getSubServiceDropDownData({required ServiceID});
}
