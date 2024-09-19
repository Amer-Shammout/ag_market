import 'package:ag_market/constants.dart';
import 'package:ag_market/models/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'add_product_to_favourite_state.dart';

class AddProductToFavouriteCubit extends Cubit<AddProductToFavouriteState> {
  AddProductToFavouriteCubit() : super(AddProductToFavouriteInitial());


  addProduct(ProductModel product) async{
    emit(AddProductToFavouriteLoading());
    try {
      var notesBox = Hive.box<ProductModel>(kFavouriteProductsBox);
      await notesBox.add(product);
      emit(AddProductToFavouriteSuccess());
    } catch (e) {
      emit(AddProductToFavouriteFailure(errMessage: e.toString()));
    }
  }
}
