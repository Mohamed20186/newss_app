import 'package:flutter/material.dart';

class CategoryData {
  final String categoryId;
  final String categoryName;
  final String categoryIcon;
  final Color categoryBackGroundColor;

  CategoryData(
      {required this.categoryId,
      required this.categoryName,
      required this.categoryIcon,
      required this.categoryBackGroundColor});
}
