import 'package:Akhbar/models/sourceResponse.dart';
import 'package:Akhbar/screens/widgets/tab_item/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabControllerNav extends StatefulWidget {
  List<Sources> sources;

  TabControllerNav(this.sources);

  @override
  State<TabControllerNav> createState() => _TabControllerNavState();
}

class _TabControllerNavState extends State<TabControllerNav> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources.length,
        child: TabBar(
          isScrollable: true,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          tabs: widget.sources
              .map((source) => Tab(
                  child: TabItem(
                      source, widget.sources.indexOf(source) == selectedIndex)))
              .toList(),
        ));
  }
}
//TabItem(source,sources.indexof(source)==selectedIndex)
