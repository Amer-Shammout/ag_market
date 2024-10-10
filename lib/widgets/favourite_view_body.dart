import 'package:ag_market/widgets/custom_app_bar.dart';
import 'package:ag_market/widgets/favourite_list_view.dart';
import 'package:flutter/material.dart';

final ScrollController scrollController = ScrollController();


class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [
          const GeneralCustomAppBar(
            title: "Favorite",
          ),
          Expanded(
            child: CustomScrollView(
              controller: scrollController ,
              key: const PageStorageKey<String>('saveScroll'),
              physics: const BouncingScrollPhysics(),
              slivers: const [
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
