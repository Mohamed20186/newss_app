import 'package:flutter/material.dart';
import 'package:news_app/core/theme/colors_palette.dart';
import 'package:news_app/core/data/models/source_model.dart';

class TapBarItem extends StatelessWidget {
  const TapBarItem({super.key, required this.source, required this.isSelected});
  final Source source;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        alignment: Alignment.center,
        width: 180,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          color: isSelected ? ColorsPalette.primaryColor : ColorsPalette.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: ColorsPalette.primaryColor),
        ),
        child: Text(
          source.name,
          style: theme.textTheme.displayMedium!.copyWith(
            color:
                isSelected ? ColorsPalette.white : ColorsPalette.primaryColor,
          ),
        ),
      ),
    );
  }
}
