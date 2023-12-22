import 'package:vitamart/models/ProductModel.dart';

class CartItemModel {
  final int cartId;
  final ProductModel product;
  int quantity;
  int subtotal;

  CartItemModel({
    required this.cartId,
    required this.product,
    required this.quantity,
    required this.subtotal,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      cartId: json['cart_id'] ?? 0,
      product: ProductModel.fromJson(json['product'] ?? {}),
      quantity: json['quantity'] ?? 0,
      subtotal: json['subtotal'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cart_id': cartId,
      'product_id': product.id,
      'quantity': quantity,
      'subtotal': subtotal,
    };
  }
}
