import 'package:ag_market/constants.dart';
import 'package:ag_market/cubits/add_product_to_favourite_cubit/add_product_to_favourite_cubit.dart';
import 'package:ag_market/cubits/display_favourite_products_cubit/display_favourite_products_cubit_cubit.dart';
import 'package:ag_market/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteButton extends StatefulWidget {
  const FavouriteButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () async {
              widget.product.delete();
              BlocProvider.of<DisplayFavouriteProductsCubit>(context)
                  .displayFavouriteProducts();
              isActive = false;
              setState(() {});
            },
            icon: const Icon(
              Icons.favorite,
              size: 26,
              color: kPrimaryColor,
            ),
          )
        : IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () async {
              await BlocProvider.of<AddProductToFavouriteCubit>(context)
                  .addProduct(widget.product);
              setState(() {});
              BlocProvider.of<DisplayFavouriteProductsCubit>(context)
                  .displayFavouriteProducts();
              isActive = true;
              setState(() {});
            },
            icon: const Icon(
              Icons.favorite,
              size: 26,
              color: Color(0xffE8EAED),
            ),
          );
  }
}
