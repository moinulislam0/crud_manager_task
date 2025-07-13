import 'package:get/get.dart';
import 'package:method_practice/Networkcaller/NetWorkCaller.dart';
import 'package:method_practice/View/Getwidget.dart';

class PostproductsController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Future<bool> postProduct(
      {required String productName, required double unitPrice}) async {
    _isLoading = true;
    update();
    final response = await Networkcaller.postRequest(body: {
      "ProductName": productName,
      "UnitPrice": unitPrice,
    }, url: '/CreateProduct');
    _isLoading = false;
    if (response.isSuccess) {
      update();
      Get.to(() => Getwidget());
      return true;
    } else {
      update();
      return false;
    }
  }
}
