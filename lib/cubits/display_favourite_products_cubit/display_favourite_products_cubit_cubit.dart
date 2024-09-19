import 'package:ag_market/constants.dart';
import 'package:ag_market/models/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'display_favourite_products_cubit_state.dart';

class DisplayFavouriteProductsCubitCubit extends Cubit<DisplayFavouriteProductsCubitState> {
  DisplayFavouriteProductsCubitCubit() : super(DisplayFavouriteProductsCubitInitial());

  List<ProductModel>products = [];

  displayFavouriteProducts(){
    var notesBox = Hive.box<ProductModel>(kFavouriteProductsBox);
      products = notesBox.values.toList();
      emit(DisplayFavouriteProductsCubitSuccess());
  }
}
