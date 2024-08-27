import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/config/constans.dart';
import 'package:news_app/models/source_model.dart';

class ApiManager {
  static Future<List<Source>> fetchSourcesList(
      {required String categoryName}) async {
    var url = Uri.https(Constans.domain, '/v2/top-headlines/sources', {
      'apiKey': Constans.apiKey,
      'category': categoryName,
    });
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      SourceModel source = SourceModel.fromJson(json: data);
      return source.sources;
    } else {
      throw Exception('faild to get sources');
    }
  }
}
