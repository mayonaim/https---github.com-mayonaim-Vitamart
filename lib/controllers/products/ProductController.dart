import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vitamart/models/ProductModel.dart';
import 'package:vitamart/resources/CartResource.dart';
import 'package:vitamart/resources/ProductResource.dart';

class ProductController extends GetxController {
  final ProductResource productResource;
  final CartResource cartResource;

  ProductController(this.productResource, this.cartResource);

  var isLoading = true.obs;
  final TextEditingController quantityController = TextEditingController();
  var count = 0.obs;

  final id = int.parse(Get.parameters['id'] ?? '0');

  var product = ProductModel(
          id: 0,
          name: "Missing product",
          description: "",
          category: "",
          price: 0,
          stock: 0,
          image: "")
      .obs;

  @override
  void onInit() {
    fetchProduct();

    getItemCount();

    update();

    super.onInit();
  }

  void fetchProduct() {
    productResource.getProductById(id).then((result) {
      product.value = result ?? product.value;
      isLoading.value = false;
    });
  }

  void getItemCount() {
    cartResource.getItemByProductId(id).then((result) {
      if (result != null) {
        count.value = result.quantity;
        quantityController.text = count.value.toString();
      }
    });
  }

  void increment() {
    count.value++;

    quantityController.text = count.value.toString();
  }

  void decrement() {
    count.value--;

    quantityController.text = count.value.toString();
  }

  void updateItemQuantity() {
    cartResource.updateItemQuantity(product.value, count.value);
  }

  @override
  void dispose() {
    count.value;
    super.dispose();
  }
}
