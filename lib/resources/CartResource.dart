import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitamart/models/ProductModel.dart';
import 'package:vitamart/services/networking/ApiService.dart';
import 'package:vitamart/models/CartModel.dart';
import 'package:vitamart/models/CartItemModel.dart';
import 'package:vitamart/shared/typedef.dart';

class CartResource {
  final ApiService http;

  CartResource(this.http);

  Future<CartModel> getCart() async {
    try {
      final endpoint = 'cart/find/7';

      var response = await http.get(endpoint: endpoint);
      final responseData = response!['data'];

      return CartModel.fromJson(responseData);
    } catch (e) {
      print('//// Error fetching cart: $e');
      throw e;
    }
  }

  Future<CartItemModel?> getItemByProductId(int productId) async {
    try {
      var cart = await getCart();

      final endpoint = 'cart/${cart.id}/find/$productId';

      var response = await http.get(endpoint: endpoint);

      if (response != null) {
        final responseData = response['data'];

        if (responseData != null) {
          // Handle the case where 'data' is not null
          return CartItemModel.fromJson(responseData);
        } else {
          print('//// Item not found');
          return null;
        }
      } else {
        print('//// Item not found');
        return null;
      }
    } catch (e) {
      print('//// Error finding item: $e');
      throw e;
    }
  }

  Future<void> updateItemQuantity(ProductModel product, int quantity) async {
    try {
      var item = await getItemByProductId(product.id);

      if (quantity > 0) {
        if (item != null) {
          // Item exists, update quantity and subtotal
          item.quantity = quantity;
          item.subtotal = quantity * product.price;
        } else {
          var cart = await getCart();

          item = CartItemModel(
            cartId: cart.id,
            product: product,
            quantity: quantity,
            subtotal: quantity * product.price,
          );
        }

        // Store the CartItem (common for both cases)
        await storeCartItem(item);
      } else if (item != null) {
        // Quantity is 0 and item exists, delete the item
        await deleteCartItem(item);
      }
    } catch (e) {
      print('//// Error updating item quantity: $e');
      throw e;
    }
  }

  Future<void> storeCartItem(CartItemModel item) async {
    try {
      final JSON body = item.toJson();

      final endpoint = 'cart/addItem';

      await http.put(endpoint: endpoint, body: body);

      var cart = await getCart();

      await storeCart(cart.items ?? []);
    } catch (e) {
      print('//// Error storing item: $e');
      throw e;
    }
  }

  Future<void> deleteCartItem(CartItemModel item) async {
    try {
      final endpoint = 'cart/removeItem';

      final JSON body = item.toJson();

      await http.put(endpoint: endpoint, body: body);

      var cart = await getCart();

      await storeCart(cart.items ?? []);
    } catch (e) {
      print('//// Error deleting item: $e');
      throw e;
    }
  }

  Future<void> storeCart(List<CartItemModel> items) async {
    try {
      var cart = await getCart();

      cart.items = items;

      final endpoint = 'cart/${cart.id}/update';

      final JSON body = cart.toJson();

      await http.put(endpoint: endpoint, body: body);
    } catch (e) {
      print('//// Error storing cart: $e');
      throw e;
    }
  }
}
