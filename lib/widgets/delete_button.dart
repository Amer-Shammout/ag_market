import 'package:ag_market/cubits/display_favourite_products_cubit/display_favourite_products_cubit_cubit.dart';
import 'package:ag_market/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        product.delete();
        BlocProvider.of<DisplayFavouriteProductsCubit>(context)
            .displayFavouriteProducts();
      },
      icon: const Icon(
        Icons.delete,
        size: 26,
        color: Colors.black,
      ),
    );
  }
}
