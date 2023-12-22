import 'package:get/get_connect.dart';
import 'package:vitamart/services/networking/ApiConstants.dart';
import 'package:vitamart/services/networking/interceptors/RequestInterceptor.dart';
import 'package:vitamart/services/networking/interceptors/ResponseInterceptor.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = ApiConstants.baseUrl;
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
  }
}
