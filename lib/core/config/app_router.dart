import 'package:flutter/material.dart';
import 'package:news_app/core/config/page_route_name.dart';
import 'package:news_app/features/home/pages/home_view.dart';
import 'package:news_app/features/splash/pages/splash_view.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
          settings: settings,
        );
      case PageRouteName.homeView:
        return MaterialPageRoute(
          builder: (context) => HomeView(),
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
