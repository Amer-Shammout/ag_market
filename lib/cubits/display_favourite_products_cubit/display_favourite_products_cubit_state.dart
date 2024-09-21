part of 'display_favourite_products_cubit_cubit.dart';

@immutable
sealed class DisplayFavouriteProductsState {}

final class DisplayFavouriteProductsInitial extends DisplayFavouriteProductsState {}
final class DisplayFavouriteProductsSuccess extends DisplayFavouriteProductsState {}

