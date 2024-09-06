import 'package:flutter/material.dart';
import 'package:news_app/core/data/models/articles_model.dart';
import 'package:news_app/core/network/api_manager.dart';

class ArticalViewModel extends ChangeNotifier {
  List<Article> _articlesList = [];
  List<Article> get articlesList => _articlesList;
  Future getArticlesList({required String sourceName}) async {
    _articlesList = await ApiManager.fetchArticlesList(sources: sourceName);
    notifyListeners();
  }
}
