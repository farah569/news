import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/categories/categories_grid.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home ';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
           ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('News App'),
        ),
        body: CategoriesGrid(),
      ),
      );
  }
}