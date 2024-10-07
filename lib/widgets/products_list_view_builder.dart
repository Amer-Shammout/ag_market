import 'package:ag_market/cubits/refresh_product_cubit/refresh_product_cubit.dart';
import 'package:ag_market/models/product_model.dart';
import 'package:ag_market/shimmer/products_list_view_shimmer.dart';
import 'package:ag_market/widgets/products_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsListViewBuilder extends StatefulWidget {
  const ProductsListViewBuilder({super.key});

  @override
  State<ProductsListViewBuilder> createState() =>
      _ProductsListViewBuilderState();
}

class _ProductsListViewBuilderState extends State<ProductsListViewBuilder> {
  List<ProductModel> products = [];

  @override
  void initState() {
    if (loadProductsFirstTime) {
      BlocProvider.of<RefreshProductCubit>(context).refreshProducts('all');
      loadProductsFirstTime = false;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RefreshProductCubit, RefreshProductCubitState>(
      builder: (context, state) {
        if (state is RefreshProductCubitLoading) {
          return const ProductsListViewShimmer();
        } else if (state is RefreshProductCubitSuccess) {
          products = BlocProvider.of<RefreshProductCubit>(context).products;
          return ProductsListView(products: products);
        } else {
          return const SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "There was an error , try again later",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

bool loadProductsFirstTime = true;
