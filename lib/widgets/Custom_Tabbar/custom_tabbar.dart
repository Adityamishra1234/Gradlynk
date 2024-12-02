import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CustomTabbar extends StatefulWidget {
  List<String> tablist;
  List<Widget> listWidget;
  CustomTabbar({super.key, required this.tablist, required this.listWidget});

  @override
  State<CustomTabbar> createState() => _CustomTabbarState();
}

class _CustomTabbarState extends State<CustomTabbar>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: widget.tablist.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    print("dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 11,
      child: Container(
        color: ThemeConstants.whitecolor,
        child: Column(
          children: [
            TabBar(
                controller: _tabController,
                labelColor: ThemeConstants.bluecolor,
                indicatorColor: ThemeConstants.firstColor,
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                tabs: getListTabbar(widget.tablist)),
            Flexible(
              child: TabBarView(
                controller: _tabController,
                children: widget.listWidget,
              ),
            ),
          ],
        ),
      ),
    ));
  }

  //Function
  List<Widget> getListTabbar(List<String> tabList) {
    List<Widget> temp = [];
    for (var element in tabList) {
      temp.add(
        Tab(
          // text: element,
          child: CustomAutoSizeTextMontserrat(
            text: element,
            textColor: ThemeConstants.bluegreycolor,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }
    return temp;
  }
}
