import 'package:ag_market/constants.dart';
import 'package:ag_market/cubits/refresh_product_cubit/refresh_product_cubit.dart';
import 'package:ag_market/helper/format_data.dart';
import 'package:ag_market/helper/get_responsive_font_size.dart';
import 'package:ag_market/widgets/categories_list_view.dart';
import 'package:ag_market/widgets/home_view_custom_app_bar.dart';
import 'package:ag_market/widgets/products_list_view_builder.dart';
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
          const HomeViewCustomAppBar(
            title: "Home View",
          ),
          Expanded(
            child: RefreshIndicator(
              color: kPrimaryColor,
              onRefresh: () async {
                BlocProvider.of<RefreshProductCubit>(context)
                    .refreshProducts(category);
              },
              child: CustomScrollView(
                key: const PageStorageKey<String>('saveScroll'),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                slivers: [
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 18.0,
                      ),
                      child: BlocBuilder<RefreshProductCubit,
                          RefreshProductCubitState>(
                        builder: (context, state) {
                          return Text(
                            formatData(category),
                            style:  TextStyle(
                              fontSize: getResponsiveFontSize(context, baseFontSize: 22),
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
          ),
        ],
      ),
    );
  }
}
