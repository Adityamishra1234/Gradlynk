import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/cupertino.dart';

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
    return EasySearchBar(
        title: const Text('Example'),
        onSearch: (value) => setState(() => searchValue = value));
  }
}
