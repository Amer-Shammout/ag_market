import 'package:ag_market/models/product_model.dart';
import 'package:ag_market/services/get_all_products_service.dart';
import 'package:ag_market/services/get_category_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'refresh_product_cubit_state.dart';

class RefreshProductCubit extends Cubit<RefreshProductCubitState> {
  RefreshProductCubit() : super(RefreshProductCubitInitial());

  List<ProductModel> products = [];

   refreshProducts(String categoryName) async {
    emit(RefreshProductCubitLoading());
    try {
      if (categoryName == 'all') {
        products = await GetAllProductsService().getAllProducts();
      } else {
        products =
            await GetCategoryService().getCategory(categoryName: categoryName);
      }
      emit(RefreshProductCubitSuccess());
    } catch (e) {
      emit(RefreshProductCubitFailure(errMessage: "e.toString()"));
    }
  }
}
