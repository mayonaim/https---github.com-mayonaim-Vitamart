import 'package:vitamart/models/CartItemModel.dart';

class CartModel {
  final int id;
  final int userId;
  List<CartItemModel>? items;
  int total;

  CartModel({
    required this.id,
    required this.userId,
    this.items,
    required this.total,
  });

  int calculateTotal(List<CartItemModel>? items) {
    final itemsList = items ?? [];
    return itemsList.fold(
        0, (sum, item) => sum + (item.quantity) * item.product.price);
  }

  factory CartModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> itemsJson = json['items'];
    final List<CartItemModel> cartItems = itemsJson
        .map((itemJson) => CartItemModel.fromJson(itemJson ?? {}))
        .toList();
    return CartModel(
      id: json['id'],
      userId: json['user'],
      items: cartItems,
      total: json['total'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'total': calculateTotal(items),
    };
  }
}
