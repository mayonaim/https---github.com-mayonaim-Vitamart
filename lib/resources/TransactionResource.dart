import 'package:vitamart/models/TransactionModel.dart';
import 'package:vitamart/services/networking/ApiService.dart';
import 'package:vitamart/shared/typedef.dart';

class TransactionResource {
  final ApiService http;

  TransactionResource(this.http);

  Future<List<TransactionModel>> getTransactions() async {
    try {
      final endpoint = 'transactions/find/7';

      final response = await http.get(endpoint: endpoint);

      final List<dynamic> responseData = response!['data'];

      return responseData
          .map((data) => TransactionModel.fromJson(data))
          .toList();
    } catch (e) {
      print('//// Error fetching transactions: $e');
      throw e;
    }
  }

  Future<List<TransactionModel>> getNewTransactions() async {
    try {
      final endpoint = 'transactions/find/orders';

      final response = await http.get(endpoint: endpoint);

      final List<dynamic> responseData = response!['data'];

      return responseData
          .map((data) => TransactionModel.fromJson(data))
          .toList();
    } catch (e) {
      print('//// Error fetching transactions: $e');
      throw e;
    }
  }

  Future<TransactionModel?> getTransactionById(int id) async {
    try {
      final endpoint = 'transaction/$id';

      final response = await http.get(endpoint: endpoint);
      if (response != null) {
        final responseData = response['data'];
        return TransactionModel.fromJson(responseData);
      } else {
        print('//// Transaction not found');
        return null;
      }
    } catch (e) {
      print('//// Error finding transaction: $e');
      throw e;
    }
  }

  Future<void> storeTransaction(int cartId) async {
    try {
      final JSON body = {'cart_id': cartId};

      final endpoint = 'transaction/store';

      await http.post(endpoint: endpoint, body: body);
    } catch (e) {
      print('//// Error storing transaction: $e');
      throw e;
    }
  }

  Future<void> readyTransaction(int cartId) async {
    try {
      final JSON body = {
        'cart_id': cartId,
        'cashier_id': 4,
      };

      final endpoint = 'transaction/ready';

      await http.put(endpoint: endpoint, body: body);
    } catch (e) {
      print('//// Error updating transaction: $e');
      throw e;
    }
  }

  Future<void> completeTransaction(int cartId) async {
    try {
      final JSON body = {
        'cart_id': cartId,
        'cashier_id': 4,
      };

      final endpoint = 'transaction/complete';

      await http.put(endpoint: endpoint, body: body);
    } catch (e) {
      print('//// Error updating transaction: $e');
      throw e;
    }
  }
}
