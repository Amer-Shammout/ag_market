import 'package:ag_market/widgets/custom_app_bar.dart';
import 'package:ag_market/widgets/favourite_list_view.dart';
import 'package:flutter/material.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          const CustomAppBar(title: "Favorite"),
          const SizedBox(
              height: 48,
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const FavouriteListView(),),
            const SizedBox(
              height: 32,
            ),
        ],
      ),
    );
  }
}
