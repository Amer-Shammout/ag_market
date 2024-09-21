
import 'package:ag_market/widgets/categories_list_view_builder.dart';
import 'package:ag_market/widgets/custom_app_bar.dart';
import 'package:ag_market/widgets/products_list_view_builder.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  static String id = "HomeView";

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverToBoxAdapter(child: CustomAppBar(title: "Home View")),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:  EdgeInsets.only(left: 18.0),
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
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 18.0),
              child: CategoriesListViewBuilder(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 28,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:  EdgeInsets.only(left: 18.0),
              child: Text(
                'All',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 44,
            ),
          ),
          ProductsListViewBuilder()
        ],
      ),
    );
  }
}
