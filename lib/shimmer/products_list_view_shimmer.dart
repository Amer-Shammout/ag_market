import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductsListViewShimmer extends StatelessWidget {
  const ProductsListViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      sliver: SliverGrid.builder(
        itemCount: 8,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 20,
          mainAxisSpacing: 56,
        ),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            direction: ShimmerDirection.ltr,
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: MediaQuery.of(context).size.width - 38,
              height: 170,
              decoration: BoxDecoration(
                color: const Color(0xfffdfdfd),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: Colors.black.withOpacity(.25),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
