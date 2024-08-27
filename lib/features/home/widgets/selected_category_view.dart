import 'package:flutter/material.dart';
import 'package:news_app/core/network/api_manager.dart';
import 'package:news_app/core/theme/colors_palette.dart';
import 'package:news_app/features/home/widgets/category_view.dart';
import 'package:news_app/features/home/widgets/tap_bar_item.dart';
import 'package:news_app/models/category_data.dart';
import 'package:news_app/models/source_model.dart';

class SelectedCategoryView extends StatefulWidget {
  const SelectedCategoryView({super.key, required this.categoryData});
  final CategoryData categoryData;

  @override
  State<SelectedCategoryView> createState() => _SelectedCategoryViewState();
}

class _SelectedCategoryViewState extends State<SelectedCategoryView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Source>>(
      future: ApiManager.fetchSourcesList(
          categoryName: widget.categoryData.categoryId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error fetch');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsPalette.primaryColor,
            ),
          );
        }
        List<Source> sourcesList = snapshot.data ?? [];
        return CategoryView(sourcesList: sourcesList);
      },
    );
  }
}
