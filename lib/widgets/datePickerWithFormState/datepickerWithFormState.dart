import 'package:flutter/material.dart';

class DatePickerCustom extends FormField<int> {
  DatePickerCustom(
      {super.key,
      required FormFieldSetter onSaved,
      required FormFieldValidator validator,
      int initialValue = 0,
      AutovalidateMode? autovalidate})
      : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidateMode: autovalidate ?? AutovalidateMode.disabled,
            builder: (FormFieldState state) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      // state.didChange(state.value - 1);
                    },
                  ),
                  Text(state.value.toString()),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      // state.didChange(state.value + 1);
                    },
                  ),
                ],
              );
            });
}
