import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/categories/categories_grid.dart';
import 'package:news/categories/category_details.dart';
import 'package:news/drawer/home_drawer.dart';
import 'package:news/models/category_model.dart';
import 'package:news/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home ';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerItem SelectedDrawerItem = DrawerItem.categories;
  CategoryModel? selectedCategory;
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
          title: Text(
            selectedCategory!=null
            ?selectedCategory!.name
            :SelectedDrawerItem == DrawerItem.categories
            ?'News App'
            :'Settings',
            ),
        ),
        drawer: HomeDrawer(
          onItemSelected: onDrawerItemSelected,
        ),
        body: selectedCategory!=null
        ? CategoryDetails(selectedCategory!.id)
        :
        SelectedDrawerItem==DrawerItem.categories
        ? CategoriesGrid(onCategorySelected: onCategorySelected)
        :SettingsTab(),
      ),
      );
  }

  void onDrawerItemSelected(DrawerItem item){
    SelectedDrawerItem= item;
    selectedCategory=null;
    setState(() {});
    Navigator.of(context).pop();
  }

  void onCategorySelected (CategoryModel Category){
    selectedCategory = Category;
    setState(() {
      
    });

  }
}