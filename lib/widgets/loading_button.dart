import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:nice_loading_button/nice_loading_button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:studentpanel/ui/screen/test/downloadtestfile.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CustomLoadingButton extends StatefulWidget {
  String buttonName;
  dynamic Function(Function, Function, ButtonState)? onTap;
  CustomLoadingButton(
      {Key? key, required this.buttonName, required this.onTap});

  @override
  State<CustomLoadingButton> createState() => _CustomLoadingButtonState();
}

class _CustomLoadingButtonState extends State<CustomLoadingButton> {
  @override
  Widget build(BuildContext context) {
    return LoadingButton(
        height: 35,
        borderRadius: 8,
        animate: true,
        color: Colors.indigo,
        width: 120,
        loader: Container(
          padding: const EdgeInsets.all(10),
          width: 30,
          height: 30,
          child: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
        onTap: widget.onTap,
        child: CustomAutoSizeTextMontserrat(
          text: widget.buttonName,
          textColor: ThemeConstants.whitecolor,
        ));
  }
}
