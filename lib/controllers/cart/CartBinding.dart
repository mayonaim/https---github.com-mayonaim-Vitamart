import 'package:get/get.dart';
import 'package:vitamart/controllers/cart/CartController.dart';
import 'package:vitamart/resources/CartResource.dart';
import 'package:vitamart/resources/TransactionResource.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartResource>(() => CartResource(Get.find()));
    Get.lazyPut<TransactionResource>(() => TransactionResource(Get.find()));

    Get.lazyPut<CartController>(() => CartController(
        Get.find<CartResource>(), Get.find<TransactionResource>()));
  }
}
