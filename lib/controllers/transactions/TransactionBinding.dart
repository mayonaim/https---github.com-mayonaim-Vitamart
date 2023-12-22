import 'package:get/get.dart';
import 'package:vitamart/controllers/transactions/TransactionController.dart';
import 'package:vitamart/resources/TransactionResource.dart';

class TransactionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionResource>(() => TransactionResource(Get.find()));

    Get.lazyPut<TransactionController>(() => TransactionController(Get.find()));
  }
}
