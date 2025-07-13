import 'package:get/get.dart';
import 'package:method_practice/Networkcaller/NetWorkCaller.dart';
import 'package:method_practice/View/Getwidget.dart';
import 'package:method_practice/api_controller/product_getController.dart';

class UpdateproductController extends GetxController {
  Future<bool> updateProduct(
      {required String id,
      required String productName,
      required double totalPrice}) async {
    update();
    final response = await Networkcaller.updateResquest(body: {
      "ProductName": productName,
      "UnitPrice": totalPrice,
    }, url: '/UpdateProduct/$id');
    update();
    if (response.isSuccess) {
      update();
      await Get.find<ProductGetcontroller>().getProducts();
      Get.off(() => Getwidget());
      return true;
    } else {
      update();
      return false;
    }
  }
}
