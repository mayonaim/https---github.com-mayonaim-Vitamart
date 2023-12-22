import 'package:get/get.dart';
import 'package:vitamart/controllers/products/ProductController.dart';
import 'package:vitamart/resources/CartResource.dart';
import 'package:vitamart/resources/ProductResource.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductResource>(() => ProductResource(Get.find()));
    Get.lazyPut<CartResource>(() => CartResource(Get.find()));

    Get.lazyPut<ProductController>(() => ProductController(
        Get.find<ProductResource>(), Get.find<CartResource>()));
  }
}
