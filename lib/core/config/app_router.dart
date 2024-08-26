import 'package:flutter/material.dart';
import 'package:news_app/core/config/page_route_name.dart';
import 'package:news_app/features/splash_view.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
          settings: settings,
        );
      case PageRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
          settings: settings,
        );
    }
  }
}
