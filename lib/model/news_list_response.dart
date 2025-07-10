import 'package:ragdanews/model/news.dart';

class NewsListResponse {
  final String status;
  final int totalResults;
  final List<News> articles;

  NewsListResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsListResponse.fromJson(Map<String, dynamic> json) {
    return NewsListResponse(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: List<News>.from(
        json['articles'].map((x) => News.fromJson(x)),
      ),
    );
  }
}
