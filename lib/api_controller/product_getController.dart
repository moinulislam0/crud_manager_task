import 'package:get/get.dart';
import 'package:method_practice/Networkcaller/NetWorkCaller.dart';
import 'package:method_practice/model/ProductGetModel.dart';

class ProductGetcontroller extends GetxController {
  ProductsModel _productsModel = ProductsModel();
  ProductsModel get productsModel => _productsModel;
  Future<bool> getProducts() async {
    update();
    final response = await Networkcaller.getRequest(url: '/ReadProduct');
    if (response.isSuccess) {
      _productsModel = ProductsModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
