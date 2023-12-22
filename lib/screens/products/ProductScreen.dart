import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vitamart/controllers/products/ProductController.dart';
import 'package:vitamart/shared/constants/Coolors.dart';
import 'package:vitamart/shared/constants/Shadows.dart';
import 'package:vitamart/shared/helpers/extensions/NumberExtension.dart';
import 'package:vitamart/shared/widgets/Counter.dart';
import 'package:vitamart/shared/widgets/RoundedTextButton.dart';

class ProductScreen extends GetView<ProductController> {
  ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Coolors.grey,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Coolors.primary,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Obx(() => _buildAddToCart(Theme.of(context)))],
          ),
        ),
      ),
      body: Column(
        children: [Obx(() => _build(Theme.of(context)))],
      ),
    );
  }

  Widget _buildAddToCart(theme) {
    var count = controller.count;
    if (count.value != 0) {
      return _buildQuantityController(theme);
    } else {
      return RoundedTextButton(
        onPressed: () {
          controller.increment();
        },
        backgroundColor: Coolors.white,
        text: "Tambahkan",
        style: theme.textTheme.labelMedium!.copyWith(color: Coolors.primary),
      );
    }
  }

  Widget _buildQuantityController(theme) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RoundedTextButton(
            onPressed: () {
              controller.updateItemQuantity();

              Get.offNamed('/cart');
            },
            backgroundColor: Coolors.white,
            px: 35,
            py: 12,
            text: "Keranjang",
            style:
                theme.textTheme.labelMedium!.copyWith(color: Coolors.primary),
          ),
          Counter(
            increment: controller.increment,
            decrement: controller.decrement,
            quantityController: controller.quantityController,
            size: 28,
          )
        ],
      ),
    );
  }

  Widget _build(theme) {
    final product = controller.product.value;
    if (controller.isLoading.value) {
      return const Expanded(
        child: Center(child: CircularProgressIndicator()),
      );
    } else {
      return Column(
        children: [
          _buildProductImage(product.image),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: theme.textTheme.headlineMedium!
                      .copyWith(color: Coolors.primary),
                ),
                Text(
                  product.price.toIDR(),
                  style: theme.textTheme.headlineMedium!
                      .copyWith(color: Coolors.primary),
                ),
                Divider(thickness: 1.4, color: Colors.grey),
                Text(
                  product.description,
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: Coolors.secondary),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }

  Widget _buildProductImage(String image) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          width: double.infinity,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            color: Coolors.grey.withOpacity(0.86),
            boxShadow: [Shadows.elevation1],
          ),
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 40,
          left: 20,
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [Shadows.elevation1],
            ),
            child: IconButton(
              onPressed: () {
                controller.updateItemQuantity();
                Get.back();
              },
              icon: FaIcon(FontAwesomeIcons.x),
            ),
          ),
        )
      ],
    );
  }
}
