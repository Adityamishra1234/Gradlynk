import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomMultiSelectSearch extends StatefulWidget {
  const CustomMultiSelectSearch({Key? key}) : super(key: key);

  @override
  State<CustomMultiSelectSearch> createState() =>
      _CustomMultiSelectSearchState();
}

class _CustomMultiSelectSearchState extends State<CustomMultiSelectSearch> {
  String? searchValue;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: EasySearchBar(
            title: Text('Example'),
            onSearch: (value) => setState(() => searchValue = value)));
  }
}
