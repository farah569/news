import 'package:news/news/data/data_sources/news_api_data_source.dart';
import 'package:news/news/data/data_sources/news_data_source.dart';
import 'package:news/sources/data/data_source/sources_api_data_source.dart';
//import 'package:news/sources/data/data_source/sources_api_data_source.dart';
import 'package:news/sources/data/data_source/sources_data_source.dart';
//import 'package:news/sources/data/data_source/sources_firebase_data_sources.dart';

class ServiceLocator {
  static SourcesDataSource sourcesDataSource=SourcesAPIDataSource();
  static NewsDataSource newsDataSource=NewsAPIDataSource();

}