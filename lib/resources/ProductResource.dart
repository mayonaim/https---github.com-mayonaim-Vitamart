import 'package:vitamart/models/ProductModel.dart';
import 'package:vitamart/services/networking/ApiService.dart';

class ProductResource {
  final ApiService http;

  ProductResource(this.http);

  Future<List<ProductModel>> getProducts() async {
    try {
      final endpoint = 'products';

      final response = await http.get(endpoint: endpoint);

      final List<dynamic> responseData = response!['data'];

      return responseData.map((data) => ProductModel.fromJson(data)).toList();
    } catch (e) {
      print('//// Error fetching products: $e');
      throw e;
    }
  }

  Future<ProductModel?> getProductById(int id) async {
    try {
      final endpoint = 'products/$id';

      final response = await http.get(endpoint: endpoint);
      if (response != null) {
        final responseData = response['data'];
        return ProductModel.fromJson(responseData);
      } else {
        print('//// Product not found');
        return null;
      }
    } catch (e) {
      print('//// Error finding product: $e');
      throw e;
    }
  }
}
