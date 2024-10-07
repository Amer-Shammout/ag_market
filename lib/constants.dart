import 'package:flutter/material.dart';

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
  NavigationDestination(
    icon: Icon(
      Icons.home_filled,
      color: Color(0xffE8EAED),
      size: 30,
    ),
    label: '',
    selectedIcon: Icon(
      Icons.home_filled,
      color: kPrimaryColor,
      size: 30,
    ),
  ),
  NavigationDestination(
    icon: Icon(
      Icons.favorite,
      color: Color(0xffE8EAED),
      size: 30,
    ),
    label: '',
    selectedIcon: Icon(
      Icons.favorite,
      color: kPrimaryColor,
      size: 30,
    ),
  )
];
