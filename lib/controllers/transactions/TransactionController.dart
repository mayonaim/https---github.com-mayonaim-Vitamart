import 'package:get/get.dart';
import 'package:vitamart/models/CartModel.dart';
import 'package:vitamart/models/TransactionModel.dart';
import 'package:vitamart/resources/TransactionResource.dart';

class TransactionController extends GetxController {
  final TransactionResource transactionResource;

  TransactionController(this.transactionResource);

  var isLoading = true.obs;

  final id = int.parse(Get.parameters['id'] ?? '0');

  var status = 'Sedang Loading'.obs();

  var transaction = TransactionModel(
    id: 0,
    cart: CartModel(id: 0, items: [], userId: 0, total: 0),
    status: '',
  ).obs;

  @override
  void onInit() {
    fetchTransaction();

    update();

    super.onInit();
  }

  void fetchTransaction() {
    transactionResource.getTransactionById(id).then((result) {
      if (result != null) {
        transaction.value = result;
        isLoading.value = false;
      }
    });
  }

  void readyTransaction() {
    transactionResource.readyTransaction(1);
  }

  void completeTransaction() {
    transactionResource.completeTransaction(1);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
