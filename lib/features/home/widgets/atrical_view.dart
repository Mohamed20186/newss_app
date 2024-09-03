import 'package:flutter/material.dart';
import 'package:news_app/core/config/page_route_name.dart';
import 'package:news_app/core/theme/colors_palette.dart';
import 'package:news_app/models/articles_model.dart';

class AtricalView extends StatelessWidget {
  const AtricalView({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          PageRouteName.articalDetailsView,
          arguments: article,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ColorsPalette.black.withOpacity(0.05),
          ),
          width: mediaQuery.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  article.urlToImage ?? '',
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                      'https://thumbs.dreamstime.com/b/error-rubber-stamp-word-error-inside-illustration-109026446.jpg',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  article.source,
                  style: theme.textTheme.displaySmall,
                ),
              ),
              Text(
                article.title,
                style: theme.textTheme.displayMedium!
                    .copyWith(overflow: TextOverflow.ellipsis),
                maxLines: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      article.formattedPublishedAt,
                      style: theme.textTheme.displaySmall!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
