import 'package:get/get.dart';
import 'package:vitamart/models/CartItemModel.dart';
import 'package:vitamart/resources/CartResource.dart';
import 'package:vitamart/resources/TransactionResource.dart';

class CartController extends GetxController {
  final CartResource cartResource;
  final TransactionResource transactionResource;

  CartController(this.cartResource, this.transactionResource);

  var isLoading = true.obs;

  var items = <CartItemModel>[].obs;

  var total = 0.obs;

  @override
  void onInit() {
    fetchCart();

    super.onInit();
  }

  Future<void> fetchCart() async {
    cartResource.getCart().then((result) {
      items.value = result.items ?? [];
      print('//// Items fetched: ${items.length}');
      total.value = result.total;
      isLoading.value = false;
      refresh();
    });
  }

  void remove(CartItemModel item) {
    cartResource.updateItemQuantity(item.product, 0);
    refresh();
  }

  void createTransaction() {
    transactionResource.storeTransaction(1);

    @override
    void dispose() {
      super.dispose();
    }
  }
}
