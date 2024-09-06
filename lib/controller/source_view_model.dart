import 'package:flutter/material.dart';
import 'package:news_app/core/network/api_manager.dart';
import 'package:news_app/core/data/models/source_model.dart';

class SourceViewModel extends ChangeNotifier {
  List<Source> _sourcesList = [];

  List<Source> get sourcesList => _sourcesList;

  Future getSourcesList({required String categoryName}) async {
    _sourcesList =
        await ApiManager.fetchSourcesList(categoryName: categoryName);
    notifyListeners();
  }
}
