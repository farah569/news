// import 'package:flutter/material.dart';
// import 'package:news/shared/widgets/app_theme.dart';
// import 'package:news/categories/view/widgets/categories_grid.dart';
// import 'package:news/categories/view/widgets/category_details.dart';
// import 'package:news/home/view/widgets/home_drawer.dart';
// import 'package:news/categories/data/models/category_model.dart';
// import 'package:news/settings/view/widgets/settings_tab.dart';

// class HomeScreen extends StatefulWidget {
//   static const String routeName = '/home ';

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   DrawerItem SelectedDrawerItem = DrawerItem.categories;
//   CategoryModel? selectedCategory;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: AppTheme.white,
//         image: DecorationImage(
//           image: AssetImage('assets/images/pattern.png'),
//         ),
//       ),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             selectedCategory != null
//                 ? selectedCategory!.name
//                 : SelectedDrawerItem == DrawerItem.categories
//                     ? 'News App'
//                     : 'Settings',
//           ),
//         ),
//         drawer: HomeDrawer(
//           onItemSelected: onDrawerItemSelected,
//         ),
//         body: selectedCategory != null
//             ? CategoryDetails(selectedCategory!.id)
//             : SelectedDrawerItem == DrawerItem.categories
//                 ? CategoriesGrid(onCategorySelected: onCategorySelected)
//                 : SettingsTab(),
//       ),
//     );
//   }

//   void onDrawerItemSelected(DrawerItem item) {
//     SelectedDrawerItem = item;
//     selectedCategory = null;
//     setState(() {});
//     Navigator.of(context).pop();
//   }

//   void onCategorySelected(CategoryModel Category) {
//     selectedCategory = Category;
//     setState(() {});
//   }
// }

import 'package:flutter/material.dart';
import 'package:news/home/view/widgets/news_search_delegate.dart'; 
import 'package:news/shared/widgets/app_theme.dart';
import 'package:news/categories/view/widgets/categories_grid.dart';
import 'package:news/categories/view/widgets/category_details.dart';
import 'package:news/home/view/widgets/home_drawer.dart';
import 'package:news/categories/data/models/category_model.dart';
import 'package:news/settings/view/widgets/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerItem selectedDrawerItem = DrawerItem.categories;
  CategoryModel? selectedCategory;

  final List<Map<String, String>> allNews = [];

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
          title: GestureDetector(
            onTap: () {
              showSearch(
                context: context,
                delegate: NewsSearchDelegate(allNews: allNews),
              );
            },
            child: Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Text(
                    "Search Article",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: HomeDrawer(
          onItemSelected: onDrawerItemSelected,
        ),
        body: selectedCategory != null
            ? CategoryDetails(selectedCategory!.id)
            : selectedDrawerItem == DrawerItem.categories
                ? CategoriesGrid(onCategorySelected: onCategorySelected)
                : SettingsTab(),
      ),
    );
  }

  void onDrawerItemSelected(DrawerItem item) {
    setState(() {
      selectedDrawerItem = item;
      selectedCategory = null;
    });
    Navigator.of(context).pop();
  }

  void onCategorySelected(CategoryModel category) {
    setState(() {
      selectedCategory = category;
    });
  }
}




