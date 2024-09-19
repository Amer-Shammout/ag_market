import 'package:ag_market/helper/api.dart';
import 'package:ag_market/models/product_model.dart';
import 'package:dio/dio.dart';

class GetCategoryService {

  Future<List<ProductModel>> getCategory({required String categoryName}) async {
    
    List<dynamic> jsonData =
        // ignore: missing_required_param
        await Api(Dio()).get(url: "https://fakestoreapi.com/products/category/$categoryName");
        
    List<ProductModel> products = [];

    for (int i = 0; i < jsonData.length; i++) {
      products.add(
        ProductModel.fromJson(jsonData[i]),
      );
    }

    return products;
  }

}