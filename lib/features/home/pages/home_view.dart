import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/core/theme/color_palette.dart';
import 'package:news_app/features/home/widgets/category_item_widget.dart';
import 'package:news_app/models/category_data.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  List<CategoryData> categoryDataList = [
    CategoryData(
      categoryId: 'sports',
      categoryName: 'Sports',
      categoryIcon: 'assets/icons/sports.png',
      categoryBackGroundColor: ColorPalette.customRed,
    ),
    CategoryData(
      categoryId: 'bussines',
      categoryName: 'Bussines',
      categoryIcon: 'assets/icons/bussines.png',
      categoryBackGroundColor: ColorPalette.customBrown,
    ),
    CategoryData(
      categoryId: 'politics',
      categoryName: 'Politics',
      categoryIcon: 'assets/icons/Politics.png',
      categoryBackGroundColor: ColorPalette.customBlue,
    ),
    CategoryData(
      categoryId: 'health',
      categoryName: 'Health',
      categoryIcon: 'assets/icons/health.png',
      categoryBackGroundColor: ColorPalette.customPink,
    ),
    CategoryData(
      categoryId: 'environment',
      categoryName: 'Environment',
      categoryIcon: 'assets/icons/environment.png',
      categoryBackGroundColor: ColorPalette.customLightBlue,
    ),
    CategoryData(
      categoryId: 'science',
      categoryName: 'Science',
      categoryIcon: 'assets/icons/science.png',
      categoryBackGroundColor: ColorPalette.customRed,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        color: ColorPalette.white,
        image: DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: mediaQuery.height * 0.11,
          title: Text(
            'News App',
            style: theme.textTheme.titleMedium,
          ),
        ),
        drawer: const Drawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Pick your category \n of interest.....',
                style: theme.textTheme.bodyLarge!
                    .copyWith(color: Colors.black, height: 1.2),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 0.90),
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
                itemCount: categoryDataList.length,
                itemBuilder: (context, index) => CategoryItemWidget(
                  categoryData: categoryDataList[index],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
