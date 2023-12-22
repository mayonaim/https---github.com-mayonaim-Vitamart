import 'package:get/get.dart';
import 'package:vitamart/controllers/home/HomeController.dart';
import 'package:vitamart/resources/ProductResource.dart';
import 'package:vitamart/resources/TransactionResource.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductResource>(() => ProductResource(Get.find()));
    Get.lazyPut<TransactionResource>(() => TransactionResource(Get.find()));

    Get.lazyPut<HomeController>(() => HomeController(
        Get.find<ProductResource>(), Get.find<TransactionResource>()));
  }
}
