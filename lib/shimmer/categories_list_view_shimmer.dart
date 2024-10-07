import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesListViewShimmer extends StatelessWidget {
  const CategoriesListViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SizedBox(
        height: 35,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Shimmer.fromColors(
                direction: ShimmerDirection.ltr,
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
