import 'package:flutter/material.dart';
import 'package:studentpanel/ui/models/checkbox.dart';
import 'package:studentpanel/widgets/multiselectedcheckbox.dart';

class CustomgroupCheckBoxCallBack extends StatelessWidget {
  List<String>? data = [];
  List<String>? itemSelectedlist = [];
  String? indexSelected;
  Function? callbackItemSelected;

  List<CheckBoxModel> favoriteMovies = [];

  CustomgroupCheckBoxCallBack(
      {Key? key,
      this.data,
      this.itemSelectedlist,
      this.indexSelected,
      required this.callbackItemSelected})
      : super(key: key);

  getCheckBox(List<String>? checkboxlist, List<String>? itemSelectedlist) {
    checkboxlist!.forEach((element) {
      favoriteMovies.add(CheckBoxModel(element, false));
    });
    for (var i = 0; i < itemSelectedlist!.length; i++) {
      for (var j = 0; j < favoriteMovies.length; j++) {
        if (favoriteMovies[j].checkBoxModelName == itemSelectedlist[i]) {
          favoriteMovies[j].isSelected = true;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    getCheckBox(data, itemSelectedlist);
    return MultiSelectionExample(
      checkBoxModel: favoriteMovies,
      callbackItemSelected: callbackItemSelected,
      indexSelected: indexSelected,
    );
  }
}
