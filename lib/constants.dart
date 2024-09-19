import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const kFavouriteProductsBox = "FavouriteProductsBox";
const kPrimaryColor = Color(0xffe65634);
const kNavigationBarDestinations =  [
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