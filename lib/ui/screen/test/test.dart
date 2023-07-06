import 'package:flutter/material.dart';

import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});
  static const routeNamed = '/TestWidget';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: "Enter your email",
              filled: true,
              fillColor: ThemeConstants.lightblueColor,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            style: ThemeConstants.montserrattextstyle2,
            // onChanged: (value) {
            //   if (controller.emailKey.currentState!.validate()) {
            //     controller.emailKey.currentState!.save();
            //   }
            // },
            validator: (value) {
              return getEmailvaliation(value);
            },
          ),
          //TODO
          // creat dropdown with validation.
          // CustomDropDownSingle()
          const Spacer(),
        ],
      ),
    );
  }
}
