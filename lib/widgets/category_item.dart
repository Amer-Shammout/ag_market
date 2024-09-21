import 'package:ag_market/constants.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.categoryName ,this.isActive =false});

  final String categoryName;

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return isActive == true
        ? Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              height: 35,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  "${categoryName.substring(0, 1).toUpperCase()}${categoryName.substring(1)}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
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
            ),
          );
  }
}
