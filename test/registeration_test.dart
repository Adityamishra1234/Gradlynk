import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('registeration_widget', () {
    testWidgets('valid phone number', (WidgetTester tester) async {
      var name = find.byKey(const Key('registration_name_field'));
      var phoneNumber = find.byKey(const Key('registration_phoneNumber_field'));
      var email = find.byKey(const Key('registration_email_field'));
      var siecBranch = find.byKey(const Key('registration_siec_branch'));
      var targetService = find.byKey(const Key('registration_target_service'));
      var targetTest = find.byKey(const Key('registration_target_test'));
      var targetDestination =
          find.byKey(const Key('registration_target_destination'));

      var hearAboutUs = find.byKey(const Key('registration_hear_about_us'));

      await tester.enterText(name, 'test');
      await tester.enterText(phoneNumber, '9918810901');
      await tester.enterText(email, 'testets@gmail.com');

      await tester.tap(siecBranch);

      // final fieldValidator = Field;
    });
  });
}
