import 'package:ag_market/constants.dart';
import 'package:ag_market/helper/format_data.dart';
import 'package:ag_market/helper/get_responsive_font_size.dart';
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
      onLongPressCancel: () {
        color = const Color(0xfffdfdfd);
        setState(() {});
      },
      onTapCancel: () {
        color = const Color(0xfffdfdfd);
        setState(() {});
      },
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
            top: -30,
            child: FancyShimmerImage(
              imageUrl: widget.product.image,
              height: getImageHeight(context),
              width: getImageWidth(context),
            ),
          ),
          Positioned(
            left: 10,
            bottom: getBottomHeight(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formatData(
                    widget.product.category,
                  ),
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(context, baseFontSize: 11),
                    color: kPrimaryColor,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "${widget.product.title.substring(0, 6)}...",
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(context, baseFontSize: 16),
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  r'$' + widget.product.price.toString(),
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(context, baseFontSize: 18),
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

double getBottomHeight(context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < 326) {
    return 2;
  } else if (width < 340) {
    return 5;
  } else {
    return 10;
  }
}

double getImageWidth(context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width > 480) {
    return 100;
  } else if (width > 400) {
    return 85;
  } else {
    return 70;
  }
}

double getImageHeight(context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width > 480) {
    return 120;
  } else if (width > 400) {
    return 100;
  } else {
    return 85;
  }
}
