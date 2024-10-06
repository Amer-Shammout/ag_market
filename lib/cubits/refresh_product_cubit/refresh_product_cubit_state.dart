part of 'refresh_product_cubit.dart';

@immutable
sealed class RefreshProductCubitState {}

final class RefreshProductCubitInitial extends RefreshProductCubitState {}
final class RefreshProductCubitSuccess extends RefreshProductCubitState {}
final class RefreshProductCubitLoading extends RefreshProductCubitState {}
final class RefreshProductCubitFailure extends RefreshProductCubitState {
  final String errMessage;

  RefreshProductCubitFailure({required this.errMessage});
}
