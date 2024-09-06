import 'package:flutter/material.dart';
import 'package:news_app/core/data/models/category_data.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget(
      {super.key,
      required this.categoryData,
      required this.index,
      required this.onCategoryClicked});
  final int index;
  final CategoryData categoryData;
  final Function(CategoryData) onCategoryClicked;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: () {
        onCategoryClicked(categoryData);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: categoryData.categoryBackGroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: index % 2 == 0
                  ? const Radius.circular(25)
                  : const Radius.circular(0),
              bottomRight: index % 2 == 0
                  ? const Radius.circular(0)
                  : const Radius.circular(25),
              topLeft: const Radius.circular(25),
              topRight: const Radius.circular(25),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(categoryData.categoryIcon),
            Text(
              categoryData.categoryName,
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
