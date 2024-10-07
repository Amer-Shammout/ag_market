import 'package:ag_market/constants.dart';
import 'package:ag_market/helper/format_data.dart';
import 'package:flutter/material.dart';

class SelectedCategoryItem extends StatelessWidget {
  const SelectedCategoryItem({
    super.key,
    required this.categoryName,
  });

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          formatData(categoryName),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}


