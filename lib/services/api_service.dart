import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ragdanews/model/news_list_response.dart';

class ApiServices {
  static const String _baseUrl = 'https://newsapi.org/v2';
  static const String _apiKey = '3083aa33f8444f3c80b129ca0ae55117';

  Future<NewsListResponse> fetchTopHeadlines({String country = 'us'}) async {
    final response = await http.get(
      Uri.parse(
        '$_baseUrl/top-headlines?country=$country&category=business&apiKey=$_apiKey',
      ),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return NewsListResponse.fromJson(data);
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
