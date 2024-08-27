import 'package:flutter/material.dart';
import 'package:news_app/models/source_model.dart';

import 'tap_bar_item.dart';

class CategoryView extends StatefulWidget {
  final List<Source> sourcesList;

  const CategoryView({
    super.key,
    required this.sourcesList,
  });

  @override
  State<CategoryView> createState() =>
      _CategoryViewState(sourcesList: sourcesList);
}

class _CategoryViewState extends State<CategoryView> {
  final List<Source> sourcesList;
  int selectedIndex = 0;

  _CategoryViewState({required this.sourcesList});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: sourcesList.length,
          child: TabBar(
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
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
      ],
    );
  }
}
