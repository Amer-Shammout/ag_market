import 'package:ag_market/cubits/add_product_to_favourite_cubit/add_product_to_favourite_cubit.dart';
import 'package:ag_market/cubits/display_favourite_products_cubit/display_favourite_products_cubit_cubit.dart';
import 'package:ag_market/helper/show_snack_bar.dart';
import 'package:ag_market/models/product_model.dart';
import 'package:ag_market/views/tabs_view.dart';
import 'package:ag_market/widgets/custom_product_card.dart';
import 'package:ag_market/widgets/favourite_list_view.dart';
import 'package:ag_market/widgets/favourite_view_body.dart';
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
        animatedKey.currentState!.removeItem(index,
            (context, animation) {
          return ScaleTransition(
            scale: animation,
            child: CustomProductCard(
              product: product,
            ),
          );
        });
        showSnackBar("Product has deleted\n successfully!", () async {
          await undoAction(index);
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

  Future<void> undoAction(int index) async {
      await BlocProvider.of<AddProductToFavouriteCubit>(
            scaffoldKey.currentContext!)
        .addProduct(product);
        List<ProductModel>products = BlocProvider.of<DisplayFavouriteProductsCubit>(
            scaffoldKey.currentContext!).products ?? [];
    animatedKey.currentState!.insertItem(products.length);
    scrollController.animateTo(scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
    BlocProvider.of<DisplayFavouriteProductsCubit>(
            scaffoldKey.currentContext!)
        .displayFavouriteProducts();
  }
}
