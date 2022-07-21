import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final Icon _icon;
  final String _placeholder;
  final TextEditingController _controller;
  TextInputType keybord;
  CustomTextField(this._icon, this._placeholder, this._controller, this.keybord,
      {Key? key})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final bool _is_focus = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        controller: widget._controller,
        keyboardType: widget.keybord,
        cursorColor: Theme.of(context).primaryColor,
        style: TextStyle(
            color: _is_focus ? Theme.of(context).primaryColor : Colors.black),
        decoration: InputDecoration(
          filled: true,
          prefixIcon: widget._icon,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          fillColor: _is_focus
              ? Theme.of(context).primaryColor.withOpacity(0.2)
              : const Color.fromRGBO(235, 235, 235, 1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          hintText: widget._placeholder,
          hintStyle: const TextStyle(
              fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.3)),
        ),
      ),
    );
  }
}
