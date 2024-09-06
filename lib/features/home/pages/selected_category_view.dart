import 'package:flutter/material.dart';
import 'package:news_app/controller/source_view_model.dart';
import 'package:news_app/features/home/widgets/category_view.dart';
import 'package:news_app/core/data/models/category_data.dart';
import 'package:provider/provider.dart';

class SelectedCategoryView extends StatefulWidget {
  const SelectedCategoryView({super.key, required this.categoryData});
  final CategoryData categoryData;

  @override
  State<SelectedCategoryView> createState() => _SelectedCategoryViewState();
}

class _SelectedCategoryViewState extends State<SelectedCategoryView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SourceViewModel()
        ..getSourcesList(
          categoryName: widget.categoryData.categoryId,
        ),
      child: Consumer<SourceViewModel>(builder: (context, vm, child) {
        if (vm.sourcesList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return CategoryView(
          sourcesList: vm.sourcesList,
        );
      }),
    );
  }
}
