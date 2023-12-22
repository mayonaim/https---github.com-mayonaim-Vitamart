import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vitamart/models/TransactionModel.dart';
import 'package:vitamart/resources/ProductResource.dart';
import 'package:vitamart/models/ProductModel.dart';
import 'package:vitamart/resources/TransactionResource.dart';
import 'package:vitamart/screens/home/tabs/ExploreTab.dart';
import 'package:vitamart/screens/home/tabs/NotificationTab.dart';

class HomeController extends GetxController {
  final ProductResource productResource;
  final TransactionResource transactionResource;

  HomeController(this.productResource, this.transactionResource);

  late PageController pageController;

  var currentPage = 0.obs;
  var categories = ["Semua", "Makanan", "Minuman"];
  var selectedCategory = "Semua".obs;

  var products = <ProductModel>[].obs;

  var transactions = <TransactionModel>[].obs;

  var newTransactions = <TransactionModel>[].obs;

  RxList<ProductModel> get filteredProducts => selectedCategory.value == "Semua"
      ? products
      : products
          .where((product) => product.category == selectedCategory.value)
          .toList()
          .obs;

  List<Widget> pages = [
    ExploreTab(),
    NotificationTab(),
    // ProfileTab(),
  ];

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);

    fetchProducts();

    fetchTransactions();

    fetchNewTransactions();

    super.onInit();
  }

  void fetchProducts() {
    productResource.getProducts().then((result) => products.value = result);
  }

  void fetchTransactions() {
    transactionResource
        .getTransactions()
        .then((result) => transactions.value = result);
  }

  void fetchNewTransactions() {
    transactionResource
        .getNewTransactions()
        .then((result) => newTransactions.value = result);
  }

  void changeCategory(String category) {
    selectedCategory.value = category;
    print('//// Selected category: ${selectedCategory.value}');
  }

  void goToTab(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }
}
