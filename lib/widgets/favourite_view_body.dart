import 'package:ag_market/widgets/custom_app_bar.dart';
import 'package:ag_market/widgets/favourite_list_view.dart';
import 'package:flutter/material.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomAppBar(title: "Favorite"),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: const [
                SizedBox(
                  height: 48,
                ),
                FavouriteListView(),
                SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
