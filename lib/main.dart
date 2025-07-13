import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:method_practice/View/LoginScreen.dart';
import 'package:method_practice/View/UpdateProduct.dart';
import 'package:method_practice/View/add_product.dart';
import 'package:method_practice/View/singUp.dart';
import 'package:method_practice/View/splashScreen.dart';
import 'package:method_practice/api_controller/delete_product.dart';
import 'package:method_practice/api_controller/postProducts.dart';
import 'package:method_practice/api_controller/product_getController.dart';
import 'package:method_practice/api_controller/updateProduct.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyApp_State();
}

class MyApp_State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GetxBindings(),
      debugShowCheckedModeBanner: false,
      title: "Curd",
      home: Splashscreen(),
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/singup', page: () => Singup()),
        GetPage(name: '/getProduct', page: () => AddProduct()),
      ],
    );
  }
}

class GetxBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ProductGetcontroller());
    Get.put(PostproductsController());
    Get.put(UpdateproductController());
    Get.put(DeleteProductController());
  }
}
