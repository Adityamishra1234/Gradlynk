import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/Custom%20Dropdown/expand_section.dart';

// import 'package:studentpanel/widgets/Custom%20Dropdown/expand_section.dart';
// import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CustomizableDropdown2 extends StatefulWidget {
  /// Color of the dropdown list
  final Color? listColor;

  /// Create the seperator of each dropdown item. If you pass Null it will take defalt Divider
  final Widget? seperator;

  /// Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
  final double? maxHeight;

  /// set dropdown list each title widget
  final Widget? listTitle;

  /// set dropdown list each title alight
  final TextAlign? titleAlign;

  /// Style the dropdown title
  final TextStyle? titleStyle;

  /// set the dropdown icon
  final Widget? icon;

  /// set the dropdown crossAxisAlignment
  final CrossAxisAlignment? crossAxisAlignment;

  /// set the dropdown mainAxisAlignment
  final MainAxisAlignment? mainAxisAlignment;

  /// decorate the dropdown
  final Decoration? decoration;

  /// set the dropdown height
  final double? height;

  /// set the dropdown width
  final double? width;

  /// A placeholder widget that is displayed by the dropdown
  final Widget? placeholder;

  /// must set the dropdown item list
  final List<dynamic> itemList;

  /// receive the selected item call back function
  /// The list of items the user can select
  final Function(String item) onSingleSelectedItem;

  final Function(List item)? onMultiSelectedItem;

  final String initalValue;

  /// Give padding of the dropdown container
  final EdgeInsetsGeometry? dropDownPadding;

  /// set the dropdown container colour
  final Color? colorDropDown;

  /// set the dropdown container constraint
  final BoxConstraints? constraintsDropDown;

  /// Give the margin of the dropdown container
  final EdgeInsetsGeometry? marginDropDown;

  // Selected Dropdown
  final String? selectedItem;

//Bool for Multi
  final bool multiSelectEnable;

  /// Here we go the dropdown StateFull Widget
  const CustomizableDropdown2(
      {Key? key,
      required this.initalValue,
      this.selectedItem,
      required this.itemList,
      required this.onSingleSelectedItem,
      this.placeholder,
      this.maxHeight,
      this.height,
      this.width,
      this.decoration,
      this.crossAxisAlignment,
      this.mainAxisAlignment,
      this.icon,
      this.listTitle,
      this.seperator,
      this.colorDropDown,
      this.constraintsDropDown,
      this.dropDownPadding,
      this.marginDropDown,
      this.listColor,
      this.titleAlign,
      this.titleStyle,
      this.onMultiSelectedItem,
      this.multiSelectEnable = false})
      : super(key: key);

  @override
  _CustomizableDropdown2State createState() => _CustomizableDropdown2State();
}

class _CustomizableDropdown2State extends State<CustomizableDropdown2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final ScrollController scrollControler = ScrollController();

  /// If the [Placeholder] is null
  /// this will displayed the selected index of List
  String? selectedItem;

  /// this variable is used to open/close the drop down is user touch dropdown container or list of dropdown selected
  /// Default is false to it hide the dropdown
  bool isExpanded = false;

// Create list using for search
  List items = [];

  List selectedItemsList = [];

  late String singleSelectedItem;

  // For Search field
  TextEditingController editingController = TextEditingController();

  bool isSelected = false;

  //Finally its removing the animated Controller
  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    singleSelectedItem = widget.initalValue;

    /// We need to hold these animations as state because of their
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      upperBound: 0.5,
    );
    // filterSearchResults("");
    super.initState();
    items = widget.itemList;
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.selectedItem);
    selectedItem = widget.selectedItem;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              child: GestureDetector(
            onTap: () {
              setState(() {
                isExpanded
                    ? _controller.reverse(from: 0.5)
                    : _controller.forward(from: 0.25);
                isExpanded = !isExpanded;
              });
            },
            child: Container(
              // decoration: BoxDecoration(color: Colors.red),
              decoration: widget.decoration,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Container(
                  // padding: widget.dropDownPadding,
                  color: widget.colorDropDown,
                  constraints: widget.constraintsDropDown,
                  margin: widget.marginDropDown,
                  height: widget.height ?? 30,
                  width: widget.width ?? double.infinity,
                  child: Row(
                    mainAxisAlignment:
                        widget.mainAxisAlignment ?? MainAxisAlignment.center,
                    crossAxisAlignment:
                        widget.crossAxisAlignment ?? CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: widget.multiSelectEnable
                                ? SizedBox(
                                    width: double.infinity,
                                    height: 30,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: ListView.separated(
                                          separatorBuilder: (context, index) {
                                            return const SizedBox(
                                              width: 10,
                                            );
                                          },
                                          scrollDirection: Axis.horizontal,
                                          itemCount: selectedItemsList.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                                height: 10,
                                                alignment: Alignment.center,
                                                padding:
                                                    const EdgeInsets.all(6),
                                                decoration: BoxDecoration(
                                                    color: ThemeConstants
                                                        .ultraLightgreyColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                        '${selectedItemsList[index]}'),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        selectedItemsList.remove(
                                                            selectedItemsList[
                                                                index]);
                                                        setState(() {});
                                                        widget.onMultiSelectedItem!(
                                                            selectedItemsList);

                                                        // print(
                                                        //     selectedItemsList);
                                                      },
                                                      child: CircleAvatar(
                                                          backgroundColor:
                                                              ThemeConstants
                                                                  .bluelightgreycolor,
                                                          child: const Icon(
                                                            Icons.close,
                                                            size: 17,
                                                          )),
                                                    )
                                                  ],
                                                ));
                                          },
                                        )),
                                      ],
                                    ),
                                  )
                                : Text(singleSelectedItem)
                            // if selectedItem has null placeholder string available

                            // widget.placeholder

                            // selectedItem == null
                            //     ? widget.placeholder
                            //     : CustomAutoSizeTextMontserrat(
                            //         text: selectedItem ?? "",
                            //         // textAlign: widget.titleAlign,
                            //         // style: widget.titleStyle
                            //       ),
                            ),
                      )),
                      // if it has icon dropdown available on right side icon and with rotate animated
                      widget.icon != null
                          ? SizedBox(
                              width: 30,
                              child: RotationTransition(
                                  turns: Tween(begin: 1.25, end: 2.25)
                                      .animate(_controller),
                                  child: widget.icon),
                            )
                          : Container()
                    ],
                  ),
                ),
                //Expanded Dropdown list
                expandedSection()
              ]),
            ),
          )),
        ]),
      ],
    );
  }

  ExpandedSection expandedSection() => ExpandedSection(
      height: 50,
      expand: isExpanded,
      child: SizedBox(
        height: 230,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: TextField(
                  onChanged: (value) {
                    filterSearchResults(value.toString());
                  },
                  controller: editingController,
                  decoration: const InputDecoration(
                      labelText: "Search",
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                ),
              ),
            ),
            SizedBox(
              height: widget.maxHeight,
              child: Scrollbar(
                thumbVisibility: true,
                controller: scrollControler,
                child: ListView.builder(
                  controller: scrollControler,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(2),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          if (widget.multiSelectEnable == true) {
                            if (selectedItemsList.contains(items[index])) {
                              selectedItemsList.remove(items[index]);
                              widget.onMultiSelectedItem!(selectedItemsList);
                              setState(() {
                                // isSelected = false;
                              });
                              widget.onMultiSelectedItem!(selectedItemsList);
                            } else {
                              selectedItemsList.add(items[index]);
                              widget.onMultiSelectedItem!(selectedItemsList);
                              setState(() {
                                // isSelected = false;
                              });
                            }
                            // print(selectedItemsList);
                          } else {
                            // widget.onSelectedItem(items[index]);
                            isExpanded
                                ? _controller.reverse(from: 0.5)
                                : _controller.forward(from: 0.25);
                            isExpanded = !isExpanded;

                            singleSelectedItem = items[index];

                            widget.onSingleSelectedItem(singleSelectedItem);

                            setState(() {
                              /// it detects the user click and display the new selected value
                              // of onChanged callback here.
                            });
                          }
                        },
                        child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            // color: Colors.red,
                            color: widget.listColor,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(widget.itemList.elementAt(index),
                                      textAlign: TextAlign.start,
                                      style: widget.titleStyle),
                                  if (items.isNotEmpty) ...[
                                    selectedItemsList.contains(items[index])
                                        ? const Icon(Icons.check_rounded)
                                        : const Icon(
                                            Icons.check_rounded,
                                            color:
                                                Color.fromARGB(0, 247, 55, 55),
                                          )
                                  ] else ...[
                                    const Icon(Icons.abc)
                                  ]
                                ],
                              ),
                              // widget.listTitle ??
                              //     Text(items.elementAt(index),
                              //         textAlign: TextAlign.start,
                              //         style: widget.titleStyle),
                            )));
                  },
                  // separatorBuilder: (BuildContext context, int index) =>
                  //     widget.seperator ??
                  //     const Divider(
                  //       thickness: 0.5,
                  //     ),
                ),
              ),
            ),
          ],
        ),
      ));
  //Function
  void filterSearchResults(String query) {
    setState(() {
      items = widget.itemList
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
}
