import 'package:flutter/material.dart';
import 'package:news_app/core/data/models/articles_model.dart';
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
        padding: const EdgeInsets.all(15),
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
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(
                argument.source,
                style: theme.textTheme.displaySmall,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              argument.title,
              style: theme.textTheme.displayMedium!
                  .copyWith(overflow: TextOverflow.ellipsis),
              maxLines: 3,
            ),
            const SizedBox(height: 10),
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
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              width: mediaQuery.width,
              decoration: BoxDecoration(
                color:
                    const Color.fromARGB(255, 151, 150, 150).withOpacity(0.1),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  Text(
                    maxLines: 12,
                    overflow: TextOverflow.ellipsis,
                    argument.description,
                    style: theme.textTheme.displayMedium!.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w400, height: 1.5),
                  ),
                  const SizedBox(height: 20),
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
                            style: theme.textTheme.displaySmall!.copyWith(
                                fontSize: 15, fontWeight: FontWeight.w800),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_right,
                          color: Colors.black,
                        ),
                      ],
                    ),
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
