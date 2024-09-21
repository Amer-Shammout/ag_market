import 'package:ag_market/constants.dart';
import 'package:ag_market/widgets/favourite_view_body.dart';
import 'package:ag_market/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class TabsView extends StatefulWidget {
  const TabsView({super.key});

  static String id = "TabsView";

  @override
  State<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  int index = 0;

  final pages = [const HomeViewBody(),const FavouriteViewBody()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        selectedIndex: index,
        indicatorColor: Colors.transparent,
        onDestinationSelected: (index) =>  setState(() => this.index = index),
        backgroundColor: const Color(0xfffdfdfd),
        height: 70,
        destinations: kNavigationBarDestinations,
      ),
      body: pages[index],
    );
  }
}
