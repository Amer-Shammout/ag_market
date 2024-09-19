part of 'add_product_to_favourite_cubit.dart';

@immutable
sealed class AddProductToFavouriteState {}

final class AddProductToFavouriteInitial extends AddProductToFavouriteState {}
final class AddProductToFavouriteLoading extends AddProductToFavouriteState {}
final class AddProductToFavouriteFailure extends AddProductToFavouriteState {
  final String errMessage;

  AddProductToFavouriteFailure({required this.errMessage});
}
final class AddProductToFavouriteSuccess extends AddProductToFavouriteState {}

