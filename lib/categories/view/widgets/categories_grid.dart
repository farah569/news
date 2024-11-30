import 'package:flutter/material.dart';
import 'package:news/shared/widgets/app_theme.dart';
import 'package:news/categories/view/widgets/category_item.dart';
import 'package:news/categories/data/models/category_model.dart';

class CategoriesGrid extends StatelessWidget {
  CategoriesGrid({
    super.key,
    required this.onCategorySelected,
  });

  void Function(CategoryModel) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
        id: 'sports',
        name: 'Sports',
        imageName: 'Sports',
        color: AppTheme.red,
      ),
      CategoryModel(
        id: 'business',
        name: 'Business',
        imageName: 'Business',
        //color: AppTheme.red,  
        color: Color(0xFFCF7E48),
      ),
      CategoryModel(
        id: 'Health',
        name: 'Health',
        imageName: 'Health',
        color: Colors.pink,
      ),
      CategoryModel(
        id: 'Politics',
        name: 'Politics',
        imageName: 'Politics',
        color: Color(0xFF003E90),
      ),
      CategoryModel(
        id: 'Enviroment',
        name: 'Enviroment',
        imageName: 'Enviroment',
        color: Color(0xFF4882CF),

      ),
      CategoryModel(
        id: 'Science',
        name: 'Science',
        imageName: 'Science',
        color: Color(0xFFF2D352),

      ),
    ];
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
                    ?.copyWith(color: AppTheme.navy)),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
              ),
              itemBuilder: (_, index) {
                CategoryModel category = categories[index];
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
