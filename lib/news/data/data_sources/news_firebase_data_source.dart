import 'package:news/news/data/data_sources/news_data_source.dart';
import 'package:news/news/data/models/news.dart';

class NewsFirebaseDataSource extends NewsDataSource
 {
  @override
  Future<List<News>> getNews(String sourceId) async{
    //Firebase logic
    return [];

  }
  }