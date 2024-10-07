import 'package:ag_market/constants.dart';
import 'package:ag_market/widgets/favourite_view_body.dart';
import 'package:ag_market/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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

  void onPageChanged(int index) {
    setState(() {
      this.index = index;
    });
  }

  void onItemTapped(int i) {
    pageController.jumpToPage(i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      bottomNavigationBar: GNav(
        hoverColor: Colors.grey[700]!, // tab button hover color
        tabBorderRadius: 12,
        tabActiveBorder: Border.all(
            color: Colors.black.withOpacity(.7), width: 1), // tab button border
        tabBorder:
            Border.all(color: Colors.black, width: 1), // tab button border
        curve: Curves.easeOutExpo, // tab animation curves
        duration: const Duration(milliseconds: 900), // tab animation duration
        gap: 8, // the tab button gap between icon and text
        color: Colors.grey[800], // unselected icon color
        activeColor: kPrimaryColor, // selected icon and text color
        iconSize: 24, // tab button icon size
        tabBackgroundColor: Colors.transparent, // selected tab background color
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tabMargin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        selectedIndex: index,
        onTabChange: onItemTapped,
        backgroundColor: const Color(
          0xfffdfdfd,
        ),
        style: GnavStyle.google,
        haptic: true,
        tabs: kNavigationBarDestinations,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: pages,
      ),
    );
  }
}
