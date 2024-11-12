import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/categories/category_item.dart';
import 'package:news/models/category_model.dart';

class CategoriesGrid extends StatelessWidget {
   CategoriesGrid({
    super.key,
    required this.onCategorySelected,
  });

  void Function(CategoryModel) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = List.generate(
      6,
      (index)=>CategoryModel(
        id: '$index',
         name: 'Sports',
         imageName: 'Sports', 
         color: AppTheme.red,
         ),
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text('Pick your category of interest',
              style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: AppTheme.navy)
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 24,
                  ),
                 itemBuilder:(_, index){
                  CategoryModel category =categories[index];
                  return GestureDetector(
                  onTap: () {
                    onCategorySelected(category);
                  },
                   child: CategoryItem(
                    category: category,
                    index: index,
                   ),
                 );
                 },
                 itemCount: categories.length,
                 ),
            )
          ],
        ),
      
    );
  }
}