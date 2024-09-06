import 'package:flutter/material.dart';
import 'package:news_app/controller/artical_view_model.dart';
import 'package:news_app/core/data/models/source_model.dart';
import 'package:provider/provider.dart';

import 'articals_by_sources.dart';
import 'tap_bar_item.dart';

class CategoryView extends StatefulWidget {
  final List<Source> sourcesList;
  var atricalsViewModel = ArticalViewModel();
  CategoryView({
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
                  widget.atricalsViewModel.getArticlesList(
                      sourceName: widget.sourcesList[selectedIndex].id);
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
          ChangeNotifierProvider(
            create: (context) => widget.atricalsViewModel
              ..getArticlesList(
                  sourceName: widget.sourcesList[selectedIndex].id),
            child: Consumer<ArticalViewModel>(builder: (context, vm, child) {
              return Expanded(
                  child: ArticalsBySources(
                      source: widget.sourcesList[selectedIndex]));
            }),
          ),
        ],
      ),
    );
  }
}
