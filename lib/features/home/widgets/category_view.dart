import 'package:flutter/material.dart';
import 'package:news_app/models/source_model.dart';

import 'articals_by_sources.dart';
import 'tap_bar_item.dart';

class CategoryView extends StatefulWidget {
  final List<Source> sourcesList;

  const CategoryView({
    super.key,
    required this.sourcesList,
  });

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          DefaultTabController(
            length: widget.sourcesList.length,
            child: TabBar(
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              isScrollable: true,
              tabs: widget.sourcesList
                  .map(
                    (element) => TapBarItem(
                      source: element,
                      isSelected:
                          selectedIndex == widget.sourcesList.indexOf(element),
                    ),
                  )
                  .toList(),
            ),
          ),
          Expanded(
              child:
                  ArticalsBySources(source: widget.sourcesList[selectedIndex])),
        ],
      ),
    );
  }
}
