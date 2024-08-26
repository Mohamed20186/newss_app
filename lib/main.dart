import 'package:flutter/material.dart';
import 'package:news_app/core/config/app_router.dart';
import 'package:news_app/core/theme/application_theme_manager.dart';
import 'package:news_app/features/splash/pages/splash_view.dart';

import 'core/config/page_route_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PageRouteName.initial,
      onGenerateRoute: AppRouter.onGenerateRoute,
      title: 'NEWS APP',
      theme: ApplicationThemeManager.lightThemeData,
    );
  }
}
