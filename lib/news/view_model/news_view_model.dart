import 'package:flutter/material.dart';
import 'package:news/news/data/models/news.dart';
import 'package:news/news/data/repositories/news_repository.dart';
import 'package:news/shared/widgets/service_locator.dart';

class NewsViewModel with ChangeNotifier{

  late final NewsRepository repository;

  NewsViewModel(){
    repository=NewsRepository(ServiceLocator.newsDataSource);
  }

  List<News> newsList=[];
  bool isLoading=false;
  String?errorMessage;

  Future<void>getNews(String sourceId) async{
    isLoading=true;
    notifyListeners();
    try{
      newsList =await repository.getNews(sourceId);
      
    }catch(error){
      errorMessage=error.toString();
    }
    isLoading=false;
    notifyListeners();
  }
}