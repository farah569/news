import 'package:flutter/material.dart';
import 'package:news/news/news_item.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_,index)=>NewsItem(),
      itemCount: 10,
    
    );
  }
}