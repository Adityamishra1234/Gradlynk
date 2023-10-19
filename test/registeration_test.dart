import 'dart:math';

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
  group('registeration_widget', () {
    testWidgets('valid phone number', (WidgetTester tester) async {
      var name = find.byKey(const Key('registration_name_field'));
      var phoneNumber = find.byKey(const Key('registration_phoneNumber_field'));
      var email = find.byKey(const Key('registration_email_field'));
      expect(result, '');
      var siecBranch = find.byKey(const Key('registration_siec_branch'));
      var targetService = find.byKey(const Key('registration_target_service'));
      var targetTest = find.byKey(const Key('registration_target_test'));
      var targetDestination =
          find.byKey(const Key('registration_target_destination'));

      // final fieldValidator = Field;
      var hearAboutUs = find.byKey(const Key('registration_hear_about_us'));
    });

    test('no valid email address', () {
      var result = fieldValidator.getEmailvaliation('test@gmail');
      await tester.enterText(name, 'test');
      await tester.enterText(phoneNumber, '9918810901');
      await tester.enterText(email, 'testets@gmail.com');

      expect(result, 'Enter a valid email address');
      await tester.tap(siecBranch);
      // final fieldValidator = Field;
    });

    test('empty email address', () {
      var result = fieldValidator.getEmailvaliation('');

      expect(result, 'Please enter email address');
      // final fieldValidator = Field;
      // final fieldValidator = Field;
    });
  });
}

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
