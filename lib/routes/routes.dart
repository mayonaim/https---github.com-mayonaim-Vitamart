import 'package:get/get.dart';
import 'package:vitamart/controllers/cart/CartBinding.dart';
import 'package:vitamart/controllers/home/HomeBinding.dart';
import 'package:vitamart/controllers/products/ProductBinding.dart';
import 'package:vitamart/controllers/transactions/TransactionBinding.dart';
import 'package:vitamart/screens/cart/CartScreen.dart';
import 'package:vitamart/screens/home/HomeScreen.dart';
import 'package:vitamart/screens/products/ProductScreen.dart';
import 'package:vitamart/screens/transactions/TransactionScreen.dart';
import 'package:vitamart/screens/cashier/NotificationCashierTab.dart';
import 'package:vitamart/screens/cashier/TransactionCashierScreen.dart';

class Routes {
  static const initial = '/home';

  static final routes = [
    // GetPage(
    //   name: '/splash',
    //   page: () => SplashPage(),
    // ),
    // GetPage(
    //   name: '/login',
    //   page: () => LoginPage(),
    // ),
    GetPage(
      name: '/home',
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: '/cart',
      page: () => CartScreen(),
      binding: CartBinding(),
    ),

    GetPage(
      name: '/product/:id',
      page: () => ProductScreen(),
      binding: ProductBinding(),
    ),

    GetPage(
      name: '/transaction/:id',
      page: () => TransactionScreen(),
      binding: TransactionBinding(),
    ),

    GetPage(
      name: '/orders',
      page: () => OrdersScreen(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: '/order/:id',
      page: () => OrderScreen(),
      binding: TransactionBinding(),
    )
  ];
}
