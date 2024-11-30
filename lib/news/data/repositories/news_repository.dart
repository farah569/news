import 'package:news/news/data/data_sources/news_data_source.dart';
import 'package:news/news/data/models/news.dart';

class NewsRepository {
  final NewsDataSource dataSource;
  const NewsRepository(this.dataSource);
  Future<List<News>>getNews(String sourceId)async{
    return dataSource.getNews(sourceId);
  }
}

