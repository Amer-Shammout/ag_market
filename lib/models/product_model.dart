import 'package:hive/hive.dart';

part 'product_model.g.dart';


@HiveType(typeId: 0)
class ProductModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String price;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String category;
  @HiveField(5)
  final String image;
  

  ProductModel( {
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
  });

  factory ProductModel.fromJson(jsonData){
    return ProductModel(id: jsonData['id'], price: jsonData['price'].toString(), title: jsonData['title'], description: jsonData['description'], category: jsonData['category'], image: jsonData['image'], );
  }
}

class RatingModel {
  final String rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(jsonData){
    return RatingModel(rate: jsonData['rate'].toString(), count: jsonData['count'],);
  }
}
