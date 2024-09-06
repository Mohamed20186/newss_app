import 'package:flutter/material.dart';
import 'package:news_app/controller/artical_view_model.dart';
import 'package:news_app/core/network/api_manager.dart';
import 'package:news_app/features/home/widgets/atrical_view.dart';
import 'package:news_app/core/data/models/articles_model.dart';
import 'package:news_app/core/data/models/source_model.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/colors_palette.dart';

class ArticalsBySources extends StatelessWidget {
  const ArticalsBySources({super.key, required this.source});
  final Source source;
  @override
  Widget build(BuildContext context) {
    return Consumer<ArticalViewModel>(builder: (context, vm, child) {
      if (vm.articlesList.isEmpty) {
        return Center(child: const CircularProgressIndicator());
      }
      return Expanded(
        child: ListView.builder(
          itemCount: vm.articlesList.length,
          itemBuilder: (context, index) {
            return AtricalView(article: vm.articlesList[index]);
          },
        ),
      );
    });
    return FutureBuilder<List<Article>>(
      future: ApiManager.fetchArticlesList(
        sources: source.id,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Image.asset(
              'assets/images/warning.png',
              scale: 5,
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsPalette.primaryColor,
            ),
          );
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Image.asset(
              'assets/images/warning.png',
              scale: 5,
            ),
          );
        }

        List<Article> articleList = snapshot.data ?? [];

        return Expanded(
          child: ListView.builder(
            itemCount: articleList.length,
            itemBuilder: (context, index) {
              return AtricalView(article: articleList[index]);
            },
          ),
        );
      },
    );
  }
}
