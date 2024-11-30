import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/shared/widgets/api_constants.dart';
import 'package:news/sources/data/data_source/article.dart';

class ArticlesAPIDataSource {
  Future<List<Article>> getArticles({String? category}) async {
    final uri = Uri.https(
      ApiConstants.baseURL,
      ApiConstants.newsEndpoint,
      {
        'apiKey': ApiConstants.apiKey,
        if (category != null) 'category': category,
        'country': 'us', 
      },
    );

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final articles = json['articles'] as List<dynamic>;
      return articles.map((e) => Article.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch articles');
    }
  }
}
