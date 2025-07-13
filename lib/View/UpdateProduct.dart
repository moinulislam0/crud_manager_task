import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:method_practice/api_controller/product_getController.dart';
import 'package:method_practice/api_controller/updateProduct.dart';

class Updateproduct extends StatefulWidget {
  String ProductName;
  double price;
  String id;

  Updateproduct(
      {super.key,
      required this.ProductName,
      required this.price,
      required this.id});

  @override
  State<Updateproduct> createState() => _UpdateproductState();
}

class _UpdateproductState extends State<Updateproduct> {
  late TextEditingController productName;
  late TextEditingController price;

  @override
  void initState() {
    super.initState();
    productName = TextEditingController(text: widget.ProductName);
    price = TextEditingController(text: widget.price.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update The Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: productName,
              decoration: InputDecoration(labelText: "Product Name"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: price,
              decoration: InputDecoration(labelText: "Price"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final success = await Get.find<UpdateproductController>()
                          .updateProduct(
                              id: widget.id,
                              productName: productName.text,
                              totalPrice: double.parse(price.text));
                      if (success) {
                        Get.snackbar("success", "Successfully updated");
                      } else {
                        Get.snackbar("Not updated", "not updated product");
                      }
                     
                    },
                    child: Text("Update"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
