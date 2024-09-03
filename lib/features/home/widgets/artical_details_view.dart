import 'package:flutter/material.dart';
import 'package:news_app/core/theme/colors_palette.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticalDetailsView extends StatelessWidget {
  const ArticalDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    final Article argument =
        ModalRoute.of(context)!.settings.arguments as Article;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        toolbarHeight: mediaQuery.height * 0.11,
        title: Text(
          "News App",
          style: theme.textTheme.titleMedium!.copyWith(fontSize: 28),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/pattern.png'),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(argument.urlToImage),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(
                argument.source,
                style: theme.textTheme.displaySmall,
              ),
            ),
            SizedBox(height: 10),
            Text(
              argument.title,
              style: theme.textTheme.displayMedium!
                  .copyWith(overflow: TextOverflow.ellipsis),
              maxLines: 3,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    argument.formattedPublishedAt,
                    style: theme.textTheme.displaySmall!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              width: mediaQuery.width,
              decoration: BoxDecoration(
                color: ColorsPalette.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                maxLines: 12,
                overflow: TextOverflow.ellipsis,
                "Through limiting access to grazing land, outpost settlers like Moshe Sharvit are able to put Palestinian farmers in increasingly precarious positions, says Moayad Shaaban, the head of the Palestinian… [+1444 chars] Through limiting access to grazing land, outpost settlers like Moshe Sharvit are able to put Palestinian farmers in increasingly precarious positions, says Moayad Shaaban, the head of the Palestinian… [+1444 chars] Through limiting access to grazing land, outpost settlers like Moshe Sharvit are able to put Palestinian farmers in increasingly precarious positions, says Moayad Shaaban, the head of the Palestinian… [+1444 chars] Through limiting access to grazing land, outpost settlers like Moshe Sharvit are able to put Palestinian farmers in increasingly precarious positions, says Moayad Shaaban, the head of the Palestinian… [+1444 chars] Through limiting access to grazing land, outpost settlers like Moshe Sharvit are able to put Palestinian farmers in increasingly precarious positions, says Moayad Shaaban, the head of the Palestinian… [+1444 chars] Through limiting access to grazing land, outpost settlers like Moshe Sharvit are able to put Palestinian farmers in increasingly precarious positions, says Moayad Shaaban, the head of the Palestinian… [+1444 chars]",
                style: theme.textTheme.displayMedium!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () async {
                await launchInBrowser(url: argument.url);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      'View Full Article',
                      style: theme.textTheme.displaySmall!
                          .copyWith(fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Icon(
                    Icons.arrow_right,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> launchInBrowser({required String url}) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
