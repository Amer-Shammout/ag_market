import 'package:ag_market/constants.dart';
import 'package:ag_market/helper/format_data.dart';
import 'package:flutter/material.dart';

class SelectedCategoryItem extends StatelessWidget {
  const SelectedCategoryItem({
    super.key,
    required this.categoryName,
    required this.onPressed,
  });

  final String categoryName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      animationDuration: const Duration(milliseconds: 300),
      height: 35,
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: kPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      onPressed: onPressed,
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
