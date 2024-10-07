import 'package:ag_market/constants.dart';
import 'package:ag_market/widgets/favourite_view_body.dart';
import 'package:ag_market/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey();

class TabsView extends StatefulWidget {
  const TabsView({super.key});

  static String id = "TabsView";

  @override
  State<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {

  PageController pageController = PageController();
  int index = 0;

  final pages = [
    const HomeViewBody(),
    const FavouriteViewBody(),
  ];

  void onPageChanged(int index){
    setState(() {
      this.index = index;
    });
  }

  void onItemTapped(int i){
    pageController.jumpToPage(i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      bottomNavigationBar: NavigationBar(

        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        selectedIndex: index,
        indicatorColor: Colors.transparent,
        onDestinationSelected: onItemTapped,
        backgroundColor: const Color(
          0xfffdfdfd,
        ),
        height: 70,
        destinations: kNavigationBarDestinations,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: pages,
        ),
    );
  }
}
