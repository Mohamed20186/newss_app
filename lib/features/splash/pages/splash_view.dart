import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/core/config/page_route_name.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context, PageRouteName.homeView),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/pattern.png',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/icons/logo.png',
            scale: 0.72,
          )
        ],
      ),
    );
  }
}
