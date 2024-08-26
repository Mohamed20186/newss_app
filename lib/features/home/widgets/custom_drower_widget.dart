import 'package:flutter/material.dart';
import 'package:news_app/core/theme/colors_palette.dart';

class CustomDrowerWidget extends StatelessWidget {
  const CustomDrowerWidget({super.key, required this.onCategoryChangedClicked});
  final void Function() onCategoryChangedClicked;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      width: mediaQuery.width * 0.75,
      decoration: const BoxDecoration(
        color: ColorsPalette.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: ColorsPalette.primaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
              ),
            ),
            alignment: Alignment.center,
            height: mediaQuery.height * 0.2,
            width: mediaQuery.width,
            child: Text(
              'News App!',
              style: theme.textTheme.bodyLarge,
            ),
          ),
          GestureDetector(
            onTap: () {
              onCategoryChangedClicked();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.list,
                    color: ColorsPalette.black,
                    size: 45,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Categories',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: ColorsPalette.black, fontSize: 30),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.settings,
                    color: ColorsPalette.black,
                    size: 45,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Settings',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: ColorsPalette.black, fontSize: 30),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
