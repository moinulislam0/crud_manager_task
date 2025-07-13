import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:method_practice/View/UpdateProduct.dart';
import 'package:method_practice/View/add_product.dart';
import 'package:method_practice/api_controller/delete_product.dart';
import 'package:method_practice/api_controller/product_getController.dart';

class Getwidget extends StatefulWidget {
  const Getwidget({super.key});

  @override
  State<Getwidget> createState() => _GetwidgetState();
}

class _GetwidgetState extends State<Getwidget> {
  @override
  void initState() {
    super.initState();
    Get.find<ProductGetcontroller>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Get Request"),
        ),
        body: GetBuilder<ProductGetcontroller>(
          builder: (controller) {
            final productList = controller.productsModel.Products ?? [];
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      final item = productList[index];
                      return ListTile(
                          title: Text(item.productName ?? "No name"),
                          subtitle: Text("Price: ${item.unitPrice ?? "N/A"}"),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Get.to(() => Updateproduct(
                                            id: item.sId.toString(),
                                            ProductName: item.productName ?? '',
                                            price: double.tryParse(
                                                    item.unitPrice ?? "0") ??
                                                0.0,
                                          ));
                                    },
                                    icon: Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () async {
                                      final delete = await Get.find<
                                              DeleteProductController>()
                                          .deleteProduct(id: item.sId ?? '');
                                      if (delete) {
                                        
                                        Get.snackbar(
                                            "deleted", "Delete SuccessFully");
                                      } else {
                                        Get.snackbar("Not Delete ",
                                            "please again delete");
                                      }
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ))
                              ],
                            ),
                          ));
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => AddProduct());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text("Add Product"),
                  )
                ],
              ),
            );
          },
        ));
  }
}
