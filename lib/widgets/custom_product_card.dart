import 'package:ag_market/constants.dart';
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
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 38,
          height: 170,
          decoration: BoxDecoration(
            color: const Color(0xfffdfdfd),
            boxShadow: [
              BoxShadow(blurRadius: 3, color: Colors.black.withOpacity(.25))
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 38,
          height: 90,
          color: Colors.white,
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
                "${widget.product.category.substring(0, 1).toUpperCase()}${widget.product.category.substring(1)}",
                style: const TextStyle(
                  fontSize: 11,
                  color: kPrimaryColor,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                widget.product.title.substring(0, 6),
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                r'$' + widget.product.price.toString(),
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
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
    );
  }
}


