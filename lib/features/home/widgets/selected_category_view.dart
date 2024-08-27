import 'package:flutter/material.dart';
import 'package:news_app/core/network/api_manager.dart';
import 'package:news_app/core/theme/colors_palette.dart';
import 'package:news_app/features/home/widgets/atrical_view.dart';
import 'package:news_app/features/home/widgets/category_view.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/models/category_data.dart';
import 'package:news_app/models/source_model.dart';

class SelectedCategoryView extends StatefulWidget {
  const SelectedCategoryView({super.key, required this.categoryData});
  final CategoryData categoryData;

  @override
  State<SelectedCategoryView> createState() => _SelectedCategoryViewState();
}

class _SelectedCategoryViewState extends State<SelectedCategoryView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<List<Source>>(
          future: ApiManager.fetchSourcesList(
              categoryName: widget.categoryData.categoryId),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Error fetching sources');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorsPalette.primaryColor,
                ),
              );
            }
            List<Source> sourcesList = snapshot.data ?? [];
            return CategoryView(
              sourcesList: sourcesList,
            );
          },
        ),
        FutureBuilder<List<Article>>(
          future: ApiManager.fetchArticlesList(
            categoryName: widget.categoryData.categoryId,
          ),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("Error: ${snapshot.error}");
              return const Text('Error fetching articles');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              print("Loading...");
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorsPalette.primaryColor,
                ),
              );
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              print("No data found");
              return const Text('No articles found');
            }

            List<Article> articleList = snapshot.data ?? [];
            print("Articles fetched: ${articleList.length}");

            return Expanded(
              child: ListView.builder(
                itemCount: articleList.length,
                itemBuilder: (context, index) {
                  print("Rendering article at index $index");
                  return AtricalView(article: articleList[index]);
                },
              ),
            );
          },
        )
      ],
    );
  }
}


/* 

 Expanded(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return AtricalView();
            },
          ),
        ),
*/