import 'package:flutter/material.dart';
import 'package:news_app/controller/artical_view_model.dart';
import 'package:news_app/features/home/widgets/atrical_view.dart';
import 'package:news_app/core/data/models/source_model.dart';
import 'package:provider/provider.dart';

class ArticalsBySources extends StatelessWidget {
  const ArticalsBySources({super.key, required this.source});
  final Source source;
  @override
  Widget build(BuildContext context) {
    return Consumer<ArticalViewModel>(builder: (context, vm, child) {
      if (vm.articlesList.isEmpty) {
        return const Center(child: CircularProgressIndicator());
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
  }
}
