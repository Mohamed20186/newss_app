import 'package:flutter/material.dart';
import 'package:news_app/models/category_data.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({super.key, required this.categoryData});
  final CategoryData categoryData;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: categoryData.categoryBackGroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
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
    );
  }
}
