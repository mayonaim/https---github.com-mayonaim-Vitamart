import 'package:vitamart/services/networking/ApiConstants.dart';

class ProductModel {
  final int id;
  final String name;
  final String description;
  final String category;
  final int price;
  final int stock;
  final String image;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.stock,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      stock: json['stock'],
      image: ApiConstants.imageUrl + json['image'],
    );
  }
}
