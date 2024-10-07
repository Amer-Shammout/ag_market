import 'package:ag_market/constants.dart';
import 'package:ag_market/helper/format_data.dart';
import 'package:ag_market/models/product_model.dart';
import 'package:ag_market/widgets/delete_button.dart';
import 'package:ag_market/widgets/favorite_button.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class CustomProductCard extends StatefulWidget {
  const CustomProductCard({super.key, required this.product, this.id = 0});

  final ProductModel product;
  final int id;

  @override
  State<CustomProductCard> createState() => _CustomProductCardState();
}

class _CustomProductCardState extends State<CustomProductCard> {
  Color color = const Color(0xfffdfdfd);
  double blurRadius = 3;
  double y = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        color = Colors.grey.shade300;
        setState(() {});
      },
      onTapUp: (details) {
        color = const Color(0xfffdfdfd);
        setState(() {});
      },
      onLongPressUp: () {
        color = const Color(0xfffdfdfd);
        setState(() {});
      },
      onLongPressDown: (details) {
        color = Colors.grey.shade200;
        setState(() {});
      },
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: color,
                boxShadow: [
                  BoxShadow(
                    blurRadius: blurRadius,
                    offset: Offset(0, y),
                    color: Colors.black.withOpacity(.25),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: widget.id == 1
                ? FavouriteButton(
                    product: widget.product,
                  )
                : DeleteButton(
                    product: widget.product,
                  ),
          ),
          Positioned(
            left: 10,
            bottom: 100,
            child: FancyShimmerImage(
              imageUrl: widget.product.image,
              height: 85,
              width: 70,
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formatData(
                    widget.product.category,
                  ),
                  style: const TextStyle(
                    fontSize: 11,
                    color: kPrimaryColor,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "${widget.product.title.substring(0, 6)}...",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  r'$' + widget.product.price.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            right: 10,
            bottom: 10,
            child: CircleAvatar(
              minRadius: 20,
              backgroundColor: kPrimaryColor,
              foregroundColor: Colors.white,
              child: Icon(
                Icons.shopping_bag,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
