import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vitamart/controllers/transactions/TransactionController.dart';
import 'package:vitamart/models/CartItemModel.dart';
import 'package:vitamart/models/TransactionModel.dart';
import 'package:vitamart/shared/constants/Coolors.dart';
import 'package:vitamart/shared/helpers/extensions/NumberExtension.dart';
import 'package:vitamart/shared/widgets/CAppBar.dart';
import 'package:vitamart/shared/widgets/RoundedTextButton.dart';

class OrderScreen extends GetView<TransactionController> {
  OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Coolors.grey,
      bottomNavigationBar:
          Obx(() => _buildButton(controller.transaction.value)),
      body: Column(
        children: [Obx(() => _build(Theme.of(context)))],
      ),
    );
  }

  Widget _buildButton(TransactionModel item) {
    var text;

    if (item.status == 'Sedang diproses') {
      text = 'Siapkan pesanan';
    } else {
      text = 'Selesaikan pesanan';
    }

    return Container(
      padding: EdgeInsets.only(left: 15, bottom: 40, right: 15),
      child: RoundedTextButton(
        onPressed: () {
          if (item.status == 'Sedang diproses') {
            controller.readyTransaction();
          } else {
            controller.completeTransaction();
          }

          Get.offNamed('/orders');
        },
        text: text,
      ),
    );
  }

  Widget _build(theme) {
    final item = controller.transaction.value;
    if (controller.isLoading.value) {
      return const Expanded(
        child: Center(child: CircularProgressIndicator()),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(
          //   width: 100,
          //   height: 100,
          //   child: Image.asset(
          //     'assets/images/logo_inti.png',
          //     fit: BoxFit.contain,
          //   ),
          // ),
          CAppBar(title: 'Transaksi', includeBackButton: true),

          SizedBox(height: 40),

          _buildStatus(item.status, theme),

          SizedBox(height: 20),

          Text('Vitamart',
              style: theme.textTheme.headlineLarge!
                  .copyWith(color: Coolors.primary)),

          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.date,
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: Coolors.secondary)),
                Text(item.time,
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: Coolors.secondary)),
              ],
            ),
          ),

          _buildDetails(item.cart.items!, theme),

          Divider(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total: ',
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: Coolors.secondary)),
                Text(item.cart.total.toIDR(),
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: Coolors.secondary)),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Terimakasih',
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: Coolors.secondary)),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Telah berbelanja dengan kami',
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: Coolors.secondary)),
            ],
          ),
        ],
      );
    }
  }

  Widget _buildStatus(String status, theme) {
    var backgroundColor;
    var textColor;

    if (status == 'Sedang diproses') {
      backgroundColor = Colors.yellow[100];
      textColor = Colors.amber;
    }

    if (status == 'Siap untuk diambil') {
      backgroundColor = Colors.blue[100];
      textColor = Colors.blueAccent;
    }

    if (status == 'Selesai') {
      backgroundColor = Coolors.grey;
      textColor = Colors.black54;
    }

    return RoundedTextButton(
      onPressed: () {},
      backgroundColor: backgroundColor,
      text: status,
      style: theme.textTheme.headlineMedium!.copyWith(color: textColor),
    );
  }

  Widget _buildDetails(List<CartItemModel> items, theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ListView(
        shrinkWrap: true,
        children: List.generate(items.length, (index) {
          var item = items[index];
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 64,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.product.name,
                        style: theme.textTheme.bodyMedium!
                            .copyWith(color: Coolors.secondary)),
                    Row(
                      children: [
                        Text('${item.quantity} x ',
                            style: theme.textTheme.bodyMedium!
                                .copyWith(color: Coolors.secondary)),
                        Text(item.product.price.toIDR(),
                            style: theme.textTheme.bodyMedium!
                                .copyWith(color: Coolors.secondary)),
                      ],
                    ),
                  ],
                ),
              ),
              Text(item.subtotal.toIDR(),
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: Coolors.secondary)),
            ],
          );
        }),
      ),
    );
  }
}
