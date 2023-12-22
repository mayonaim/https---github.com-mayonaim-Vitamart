import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vitamart/controllers/cart/CartController.dart';
import 'package:vitamart/models/CartItemModel.dart';
import 'package:vitamart/shared/constants/Coolors.dart';
import 'package:vitamart/shared/helpers/extensions/NumberExtension.dart';
import 'package:vitamart/shared/widgets/AppBar.dart';
import 'package:vitamart/shared/widgets/CircularIconButton.dart';
import 'package:vitamart/shared/widgets/RoundedTextButton.dart';

class CartScreen extends GetView<CartController> {
  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Coolors.grey,
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Coolors.primary),
                ),
                Obx(() {
                  final total = controller.total.value;
                  return Text(
                    total > 0 ? total.toIDR() : 'Rp -',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Coolors.primary),
                  );
                }),
              ],
            ),
            RoundedTextButton(
              onPressed: () {
                controller.createTransaction();
                Get.offAllNamed('/home');
              },
              text: "Pesan Sekarang",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Coolors.grey),
            )
          ],
        ),
      ),
      body: ListView(children: [
        VAppBar(title: 'Keranjang', includeBackButton: true),
        const SizedBox(height: 10),
        _buildItemsList(Theme.of(context)),
      ]),
    );
  }

  Widget _buildItemsList(theme) {
    return Obx(() {
      final itemsList = controller.items;
      if (controller.isLoading.value) {
        return const Expanded(
          child: Center(child: CircularProgressIndicator()),
        );
      } else {
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: itemsList.length,
          itemBuilder: (_, i) {
            final item = itemsList[i];

            return _buildCartItem(item, theme);
          },
        );
      }
    });
  }

  Widget _buildCartItem(CartItemModel item, theme) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        color: Colors.white,
        child: Row(
          children: [
            _buildProductImage(item.product.image),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.product.name,
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: Coolors.secondary),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    item.subtotal.toIDR(),
                    style: theme.textTheme.headlineMedium!
                        .copyWith(color: Coolors.highlight),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    controller.remove(item);

                    Get.offNamed('/cart');
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.trash,
                    color: Coolors.secondary,
                    size: 24,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      item.quantity.toString(),
                      style: theme.textTheme.headlineMedium!
                          .copyWith(color: Coolors.highlight),
                    ),
                    SizedBox(width: 10),
                    CircularIconButton(
                      backgroundColor: Coolors.secondary,
                      onPressed: () {
                        Get.toNamed('/product/${item.product.id}');
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.arrowsRotate,
                        size: 18,
                        color: Coolors.white,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(String imageUrl) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Coolors.grey.withOpacity(0.86),
      ),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
