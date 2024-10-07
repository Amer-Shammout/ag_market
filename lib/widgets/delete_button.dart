import 'package:ag_market/cubits/display_favourite_products_cubit/display_favourite_products_cubit_cubit.dart';
import 'package:ag_market/models/product_model.dart';
import 'package:ag_market/widgets/custom_product_card.dart';
import 'package:ag_market/widgets/favourite_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        List<ProductModel> products =
            BlocProvider.of<DisplayFavouriteProductsCubit>(context).products!;
        int index = products.indexOf(product);
        product.delete();
        animatedController.currentState!.removeItem(index,
            (context, animation) {
          return ScaleTransition(
            scale: animation,
            child: CustomProductCard(
              product: product,
            ),
          );
        });
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
