import 'package:vitamart/services/networking/ApiService.dart';
import 'package:vitamart/services/networking/BaseProvider.dart';
import 'package:get/instance_manager.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BaseProvider(), permanent: true);
    Get.put(ApiService(Get.find()), permanent: true);
  }
}
