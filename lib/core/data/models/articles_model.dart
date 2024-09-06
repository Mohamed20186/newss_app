import 'package:intl/intl.dart';

class ArticlesModel {
  final String status;
  final List<Article> articles;

  ArticlesModel({required this.status, required this.articles});

  factory ArticlesModel.fromJson({required Map<String, dynamic> json}) {
    return ArticlesModel(
      status: json['status'],
      articles: List<Article>.from(
        json['articles'].map((article) => Article.fromJson(article)),
      ),
    );
  }
}

class Article {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String source;

  Article(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      author: json['author'] ?? 'Unknown',
      title: json['title'] ?? 'Unknown',
      description: json['description'] ?? 'Unknown',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ??
          'https://thumbs.dreamstime.com/b/error-rubber-stamp-word-error-inside-illustration-109026446.jpg',
      publishedAt: json['publishedAt'] ?? 'Unknown',
      source: json['source']['name'] ?? 'Unknown',
    );
  }
  String get formattedPublishedAt {
    DateTime dateTime = DateTime.parse(publishedAt);
    return DateFormat('yyyy-MM-dd hh:mm a').format(dateTime);
  }
}
