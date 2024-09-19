import 'package:hive/hive.dart';

part 'product_model.g.dart';


@HiveType(typeId: 0)
class ProductModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final double price;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String category;
  @HiveField(5)
  final String image;
  @HiveField(6)
  final RatingModel rate;

  ProductModel( {
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
    required this.rate
  });

  factory ProductModel.fromJson(jsonData){
    return ProductModel(id: jsonData['id'], price: jsonData['price'], title: jsonData['title'], description: jsonData['description'], category: jsonData['category'], image: jsonData['image'], rate: RatingModel.fromJson(jsonData['rating']));
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(jsonData){
    return RatingModel(rate: jsonData['rate'], count: jsonData['count'],);
  }
}
