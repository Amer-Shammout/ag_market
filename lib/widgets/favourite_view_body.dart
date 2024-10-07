import 'package:ag_market/widgets/custom_app_bar.dart';
import 'package:ag_market/widgets/favourite_list_view.dart';
import 'package:flutter/material.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          GeneralCustomAppBar(
            title: "Favorite",
          ),
          Expanded(
            child: CustomScrollView(
              key: PageStorageKey<String>('saveScroll'),
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 48,
                  ),
                ),
                FavouriteListView(),
                SliverToBoxAdapter(
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
