import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vitamart/controllers/home/HomeController.dart';
import 'package:vitamart/models/TransactionModel.dart';
import 'package:vitamart/shared/constants/Coolors.dart';
import 'package:vitamart/shared/helpers/extensions/NumberExtension.dart';
import 'package:vitamart/shared/widgets/AppBar.dart';
import 'package:vitamart/shared/widgets/RoundedTextButton.dart';

class OrdersScreen extends GetView<HomeController> {
  OrdersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          VAppBar(title: 'Pesanan', includeBackButton: true),
          _buildNotificationsList(Theme.of(context)),
        ],
      ),
    );
  }

  Widget _buildNotificationsList(theme) {
    return Obx(() {
      final itemsList = controller.newTransactions;
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: itemsList.length,
        itemBuilder: (_, i) {
          final item = itemsList[i];

          return _buildNotification(item, theme);
        },
      );
    });
  }

  Widget _buildNotification(TransactionModel item, theme) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: GestureDetector(
        onTap: () {
          Get.toNamed('/order/${item.id}');
        },
        child: Container(
          height: 120,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.date),
                  Text(item.time),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatus(item.status, theme),
                  Text(item.cart.total.toIDR()),
                ],
              )
            ],
          ),
        ),
      ),
    );
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
      style: theme.textTheme.bodyMedium!.copyWith(color: textColor),
    );
  }
}
