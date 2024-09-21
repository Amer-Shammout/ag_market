import 'package:ag_market/helper/api.dart';
import 'package:dio/dio.dart';

class GetCategoriesService {

  Future<List<String>> getCategories() async{

    // ignore: missing_required_param
    List<dynamic>jsonData = await Api(Dio()).get(url: "https://fakestoreapi.com/products/categories"); 

    List<String>categories = [];
    categories.add('all');

    for (var i = 0; i < jsonData.length; i++) {
      categories.add(jsonData[i]);
    }

    return categories;

  }

}