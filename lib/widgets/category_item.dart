import 'package:ag_market/widgets/selected_category_item.dart';
import 'package:ag_market/widgets/un_selected_category_item.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.categoryName ,this.isActive =false});

  final String categoryName;

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return isActive == true
        ? SelectedCategoryItem(categoryName: categoryName)
        : UnSelectedCategoryItem(categoryName: categoryName);
  }
}

