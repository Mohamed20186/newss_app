import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/core/theme/color_palette.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
        drawer: Drawer(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Pick your category \n of interest.....',
                style: theme.textTheme.bodyLarge!
                    .copyWith(color: Colors.black, height: 1.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
