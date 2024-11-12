import 'package:flutter/material.dart';
import 'package:news/models/source.dart';
import 'package:news/tabs/sources_tabs.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails(this.categoryId);

  String categoryId;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  List<Source> sources=List.generate(
    10,
    (index)=>Source(
      id: '$index',
      name:'Source $index',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SourcesTabs(sources);
  }
}