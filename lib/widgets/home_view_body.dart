import 'package:ag_market/cubits/refresh_product_cubit/refresh_product_cubit.dart';
import 'package:ag_market/widgets/categories_list_view.dart';
import 'package:ag_market/widgets/categories_list_view_builder.dart';
import 'package:ag_market/widgets/custom_app_bar.dart';
import 'package:ag_market/widgets/products_list_view_builder.dart';
import 'package:ag_market/widgets/selected_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  static String id = "HomeView";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomAppBar(title: "Home View"),
          Expanded(
            child: CustomScrollView(
              key:  const PageStorageKey<String>('saveScroll'),
              physics: const BouncingScrollPhysics() ,
              scrollDirection: Axis.vertical,
              slivers: [
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 24,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(left: 18.0),
                    child: Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: CategoriesListViewBuilder(),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 28,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: BlocBuilder<RefreshProductCubit,RefreshProductCubitState>(
                      builder: (context, state) {
                        return Text(
                          formatData(category),
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 44,
                  ),
                ),
                const ProductsListViewBuilder(),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 32,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
