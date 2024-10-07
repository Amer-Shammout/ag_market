import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

const kFavouriteProductsBox = "FavoriteProductsBox";
const kPrimaryColor = Color(0xffe65634);
const categories = [
  'all',
  'electronics',
  'jewelery',
  'men\'s clothing',
  'women\'s clothing',
];
const kNavigationBarDestinations = [
  GButton(
    icon: Icons.home_filled,
    text: 'Home',
  ),
  GButton(
    icon: Icons.favorite,
    text: 'Favourite',
  ),
];
