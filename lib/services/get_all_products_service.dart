import 'package:ag_market/helper/api.dart';
import 'package:ag_market/models/product_model.dart';
import 'package:dio/dio.dart';

class GetAllProductsService {

  Future<List<ProductModel>> getAllProducts() async {
    
    // ignore: missing_required_param
    List<dynamic> jsonData = await Api(Dio()).get(url: "https://fakestoreapi.com/products");

    List<ProductModel> products = [];

    for (int i = 0; i < jsonData.length; i++) {
      products.add(
        ProductModel.fromJson(jsonData[i]),
      );
    }

    return products;
  }
}
