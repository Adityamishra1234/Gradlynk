import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/registeration/registeration_controller.dart';
import 'package:studentpanel/ui/screen/registeration/registeration_only_form_widget.dart';
import 'package:studentpanel/utils/field_validators.dart';

void main() {
  group('email_validation_check', () {
    final fieldValidator = FieldValidators();
    test('valid email address', () {
      var result = fieldValidator.getEmailvaliation('test@gmail.com');

      expect(result, '');

      // final fieldValidator = Field;
    });

    test('no valid email address', () {
      var result = fieldValidator.getEmailvaliation('test@gmail');

      expect(result, 'Enter a valid email address');
      // final fieldValidator = Field;
    });

    test('empty email address', () {
      var result = fieldValidator.getEmailvaliation('');

      expect(result, 'Please enter email address');
      // final fieldValidator = Field;
    });
  });

  group('registration_check', () {
    late RegisterationCopntroller registrationController;

    setUp(() {
      registrationController = RegisterationCopntroller();
    });

    test('Registeration_Copntroller_check ', () async {
      expect(registrationController.subServiceDropDownListName, []);
      Get.put(registrationController);

      expect(registrationController.subServiceDropDownListName, []);
    });
  });
}
