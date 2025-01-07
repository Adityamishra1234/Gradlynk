import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentpanel/new_widgets/text_fields.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';

class DropdownWithMultiselect extends StatefulWidget {
  final String spinnerHintText;
  final String searchHintText;
  final List<String> values;
  final bool isSearch;
  final bool isMultiSelect;
  final Color? textColor;
  final List<String>? initialValues;
  final String? initialValue;
  final void Function(List<String>)? onMultiSelectChanged;
  final void Function(String?)? onChanged;

  const DropdownWithMultiselect(
      {super.key,
      required this.spinnerHintText,
      required this.searchHintText,
      required this.values,
      this.isSearch = false,
      this.isMultiSelect = false,
      this.initialValues,
      this.initialValue,
      this.onMultiSelectChanged,
      this.onChanged,
      this.textColor});

  @override
  DropdownWithMultiselectState createState() => DropdownWithMultiselectState();
}

class DropdownWithMultiselectState extends State<DropdownWithMultiselect> {
  String selectedValue = '';
  List<String> selectedValues = [];
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      selectedValue = '${widget.initialValue}';
    }
    if (widget.isMultiSelect && widget.initialValues != null) {
      selectedValues = widget.initialValues!;
    }
  }

  void _toggleSelectAll(String? value) {
    setState(() {
      if (value == 'deselect_all') {
        selectedValues.clear();
      } else {
        selectedValues = List.from(widget.values);
      }
      if (widget.onMultiSelectChanged != null) {
        widget.onMultiSelectChanged!(selectedValues);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> menuItems = [];

    if (widget.isMultiSelect) {
      menuItems.add(
        selectedValues.length == widget.values.length
            ? DropdownMenuItem<String>(
                value: 'deselect_all',
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'Deselect All',
                          textScaler: TextScaler.noScaling,
                          overflow: TextOverflow.ellipsis,
                          style: buttonStyleOpenSans(
                              widget.textColor ?? ThemeConstants.blackcolor,
                              FontWeight.w500,
                              12),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: ThemeConstants.greenColor,
                              width: 2,
                            ),
                          ),
                          child:  Container(
                            margin: const EdgeInsets.all(2),
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: ThemeConstants.greenColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ))
                    ],
                  ),
                ),
              )
            : DropdownMenuItem<String>(
                value: 'select_all',
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'Select All',
                          textScaler: TextScaler.noScaling,
                          overflow: TextOverflow.ellipsis,
                          style: buttonStyleOpenSans(
                              widget.textColor ?? ThemeConstants.blackcolor,
                              FontWeight.w500,
                              12),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: ThemeConstants.greenColor,
                            width: 2,
                          ),
                        ),
                        child:  Container(
                          margin: const EdgeInsets.all(2),
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: ThemeConstants.whitecolor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ))
                    ],
                  ),
                ),
              ),
      );
    }

    menuItems.addAll(
      widget.values.asMap().entries.map((entry) {
        int index = entry.key;
        String item = entry.value;

        Color backgroundColor = index % 2 == 0
            ? ThemeConstants.whitecolor
            : ThemeConstants.lightgreycolor.withOpacity(0.4);
        return DropdownMenuItem(
          value: item,
          child: StatefulBuilder(
            builder: (context, menuItemState) {
              bool isSelected = selectedValues.contains(item);
              return InkWell(
                onTap: widget.isMultiSelect
                    ? () {
                  menuItemState(() {
                    if (isSelected) {
                      setState(() {
                        selectedValues.remove(item);
                      });
                    } else {
                      setState(() {
                        selectedValues.add(item);
                      });
                    }
                    if (widget.onMultiSelectChanged != null) {
                      widget.onMultiSelectChanged!(selectedValues);
                    }
                  });
                }
                    : null,
                child: Container(
                  color: backgroundColor, // Apply background color
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          item,
                          textScaler: TextScaler.noScaling,
                          overflow: TextOverflow.ellipsis,
                          style: buttonStyleOpenSans(
                            widget.textColor ?? ThemeConstants.blackcolor,
                            FontWeight.w500,
                            12,
                          ),
                        ),
                      ),
                      if (widget.isMultiSelect)
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: ThemeConstants.greenColor,
                              width: 2,
                            ),
                          ),
                          child: isSelected && widget.isMultiSelect
                              ? Container(
                            margin: const EdgeInsets.all(2),
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: ThemeConstants.greenColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          )
                              : Container(
                            margin: const EdgeInsets.all(2),
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: ThemeConstants.whitecolor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      if (!widget.isMultiSelect)
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: ThemeConstants.greenColor,
                              width: 2,
                            ),
                          ),
                          child: selectedValue == item
                              ? Container(
                            margin: const EdgeInsets.all(2),
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: ThemeConstants.greenColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          )
                              : Container(
                            margin: const EdgeInsets.all(2),
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: ThemeConstants.whitecolor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }).toList(),
    );


    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        iconStyleData: IconStyleData(
          openMenuIcon: Icon(
            Icons.arrow_drop_up_outlined,
            color: ThemeConstants.greenColor, // Replace with your primaryColor
          ),
        ),
        hint: Text(
          widget.isMultiSelect
              ? selectedValues.isEmpty
                  ? widget.spinnerHintText
                  : selectedValues.join(', ')
              : selectedValue.isEmpty
                  ? widget.spinnerHintText
                  : selectedValue,
          overflow: TextOverflow.ellipsis,
          textScaler: TextScaler.noScaling,
          style: buttonStyleOpenSans(
              widget.textColor ?? ThemeConstants.blackcolor,
              FontWeight.w500,
              14),
        ),
        items: menuItems,
        onChanged: (value) {
          if (widget.isMultiSelect) {
            _toggleSelectAll(value);
          } else {
            selectedValue = value!;
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          }
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 40,
          width: double.infinity,
        ),
        dropdownStyleData: DropdownStyleData(
            maxHeight: 500,
            scrollbarTheme: ScrollbarThemeData(
              thumbVisibility: MaterialStateProperty.all(false),
              trackVisibility: MaterialStateProperty.all(false),
              thumbColor: MaterialStateProperty.all(Colors.transparent),
              trackColor: MaterialStateProperty.all(Colors.transparent),
            )),
        menuItemStyleData: const MenuItemStyleData(padding: EdgeInsets.zero,
          height: 40,
        ),
        dropdownSearchData: widget.isSearch
            ? DropdownSearchData(
                searchController: textEditingController,
                searchInnerWidgetHeight: 50,
                searchInnerWidget: Container(
                  height: 70,
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 4,
                    right: 8,
                    left: 8,
                  ),
                  child: TextField(
                    cursorColor: ThemeConstants.greenColor,
                    style: buttonStyleOpenSans(
                        ThemeConstants.blackcolor, FontWeight.w400, 12),
                    controller: textEditingController,
                    decoration: textFieldWithIconDecoration(
                        Icons.search, widget.searchHintText, 15),
                  ),
                ),
                searchMatchFn: (item, searchValue) {
                  return item.value
                      .toString()
                      .toLowerCase()
                      .contains(searchValue.toLowerCase());
                },
              )
            : null,
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            textEditingController.clear();
          }
        },
      ),
    );
  }
}
