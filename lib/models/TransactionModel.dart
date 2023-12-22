import 'package:vitamart/models/CartModel.dart';

class TransactionModel {
  final int id;
  // final int cashier_id;
  CartModel cart;
  String status;
  var time;
  var date;

  TransactionModel({
    required this.id,
    // required this.cashier_id,
    required this.cart,
    required this.status,
    this.time,
    this.date,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    String dateTimeString = json['time'];

    // Parse the string into a DateTime object
    DateTime dateTime = DateTime.parse(dateTimeString);

    // Extract date and time components
    String date = "${dateTime.day}-${dateTime.month}-${dateTime.year}";
    String time = "${dateTime.hour}:${dateTime.minute}";

    return TransactionModel(
      id: json['id'],
      cart: CartModel.fromJson(json['cart'] ?? {}),
      status: json['status'],
      time: time,
      date: date,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cart_id': cart.id,
    };
  }
}
