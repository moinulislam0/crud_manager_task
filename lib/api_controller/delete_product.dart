import 'package:get/get.dart';
import 'package:method_practice/Networkcaller/NetWorkCaller.dart';
import 'package:method_practice/api_controller/product_getController.dart';

class DeleteProductController extends GetxController {
  Future<bool> deleteProduct({required String id}) async {
    final response =
        await Networkcaller.deleteRequest(url: '/DeleteProduct/$id');
    update();
    if (response.isSuccess) {
      Get.find<ProductGetcontroller>().getProducts();
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
