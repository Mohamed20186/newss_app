import 'package:flutter/material.dart';
import 'package:news_app/core/theme/colors_palette.dart';
import 'package:news_app/features/home/widgets/category_item_widget.dart';
import 'package:news_app/features/home/widgets/custom_drower_widget.dart';
import 'package:news_app/features/home/pages/selected_category_view.dart';
import 'package:news_app/core/data/models/category_data.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryData> categoryDataList = [
    CategoryData(
      categoryId: 'sports',
      categoryName: 'Sports',
      categoryIcon: 'assets/icons/sports.png',
      categoryBackGroundColor: ColorsPalette.customRed,
    ),
    CategoryData(
      categoryId: 'business',
      categoryName: 'Bussines',
      categoryIcon: 'assets/icons/bussines.png',
      categoryBackGroundColor: ColorsPalette.customBrown,
    ),
    CategoryData(
      categoryId: 'politics',
      categoryName: 'Politics',
      categoryIcon: 'assets/icons/Politics.png',
      categoryBackGroundColor: ColorsPalette.customBlue,
    ),
    CategoryData(
      categoryId: 'health',
      categoryName: 'Health',
      categoryIcon: 'assets/icons/health.png',
      categoryBackGroundColor: ColorsPalette.customPink,
    ),
    CategoryData(
      categoryId: 'environment',
      categoryName: 'Environment',
      categoryIcon: 'assets/icons/environment.png',
      categoryBackGroundColor: ColorsPalette.customLightBlue,
    ),
    CategoryData(
      categoryId: 'science',
      categoryName: 'Science',
      categoryIcon: 'assets/icons/science.png',
      categoryBackGroundColor: ColorsPalette.customRed,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        color: ColorsPalette.white,
        image: DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: mediaQuery.height * 0.11,
          title: Text(
            selectedCategoryData == null
                ? 'News App'
                : selectedCategoryData!.categoryName,
            style: theme.textTheme.titleMedium!.copyWith(fontSize: 28),
          ),
          actions: [
            if (selectedCategoryData != null)
              Padding(
                padding: const EdgeInsets.all(12),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                  iconSize: 40,
                ),
              ),
          ],
        ),
        drawer: CustomDrowerWidget(
          onCategoryChangedClicked: onCategoryChangedClicked,
        ),
        body: selectedCategoryData == null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: Text(
                      'Pick your category \n of interest.....',
                      style: theme.textTheme.bodyLarge!
                          .copyWith(color: Colors.black, height: 1.2),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15,
                              childAspectRatio: 0.90),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 30),
                      itemCount: categoryDataList.length,
                      itemBuilder: (context, index) => CategoryItemWidget(
                        onCategoryClicked: onCategoryClicked,
                        categoryData: categoryDataList[index],
                        index: index,
                      ),
                    ),
                  )
                ],
              )
            : SelectedCategoryView(
                categoryData: selectedCategoryData!,
              ),
      ),
    );
  }

  CategoryData? selectedCategoryData;

  onCategoryClicked(CategoryData categoryData) {
    setState(() {
      selectedCategoryData = categoryData;
    });
  }

  onCategoryChangedClicked() {
    setState(() {
      selectedCategoryData = null;
      Navigator.pop(context);
    });
  }
}
