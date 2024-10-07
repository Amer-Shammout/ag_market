import 'package:ag_market/helper/format_data.dart';
import 'package:flutter/material.dart';

class UnSelectedCategoryItem extends StatelessWidget {
  const UnSelectedCategoryItem({
    super.key,
    required this.categoryName,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 35, 
      splashColor: Colors.black12,
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: const Color(0xffeeeeee),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          formatData(categoryName),
          style: TextStyle(
            color: Colors.black.withOpacity(.3),
            fontSize: 14,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
