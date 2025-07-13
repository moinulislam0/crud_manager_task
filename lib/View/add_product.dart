import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:method_practice/api_controller/postProducts.dart';
import 'package:method_practice/api_controller/product_getController.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController img = TextEditingController();
  TextEditingController productName = TextEditingController();
  TextEditingController totalPrice = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add to cart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // TextField(
            //   controller: img,
            //   decoration: InputDecoration(
            //       hintText: "Image",
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(4),
            //         borderSide: BorderSide(width: 2),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(4),
            //           borderSide: BorderSide(width: 2)),
            //       enabledBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(4),
            //           borderSide: BorderSide(width: 2))),
            // ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: productName,
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: "Product Name",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(width: 2))),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: totalPrice,
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: "TotalPrice",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(width: 2))),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await Get.find<PostproductsController>().postProduct(
                    productName: productName.text,
                    unitPrice: double.parse(totalPrice.text),
                  );
                  Get.snackbar(
                    "Successfully added",
                    "Product added successfully",
                    snackPosition: SnackPosition.BOTTOM,
                  );

                  Get.find<ProductGetcontroller>().getProducts();
                } catch (e) {
                  Get.snackbar(
                    "Error",
                    "Please enter a valid price",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              child: Text("Add to product"),
            )
          ],
        ),
      ),
    );
  }
}
