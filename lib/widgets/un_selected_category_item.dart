import 'package:flutter/material.dart';

class UnSelectedCategoryItem extends StatelessWidget {
  const UnSelectedCategoryItem({
    super.key,
    required this.categoryName,
  });

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xffeeeeee),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          "${categoryName.substring(0, 1).toUpperCase()}${categoryName.substring(1)}",
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

