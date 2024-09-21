import 'package:ag_market/cubits/display_favourite_products_cubit/display_favourite_products_cubit_cubit.dart';
import 'package:ag_market/models/product_model.dart';
import 'package:ag_market/widgets/custom_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteListView extends StatefulWidget {
  const FavouriteListView({super.key});

  @override
  State<FavouriteListView> createState() => _FavouriteListViewState();
}

class _FavouriteListViewState extends State<FavouriteListView> {

  late List<ProductModel> products;

@override
  void initState() {
    BlocProvider.of<DisplayFavouriteProductsCubit>(context).displayFavouriteProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    
    
    return BlocBuilder<DisplayFavouriteProductsCubit,
        DisplayFavouriteProductsState>(
      builder: (context, state) {
        products =
        BlocProvider.of<DisplayFavouriteProductsCubit>(context).products ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            clipBehavior: Clip.none,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 56,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return CustomProductCard(product: products[index]);
            },
          ),
        );
      },
    );
  }
}
