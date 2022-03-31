import 'package:flutter/material.dart';
import 'package:gtk_flutter/const/text_field.dart';
import 'package:gtk_flutter/theme/colors.dart';

class addProductPage extends StatefulWidget {
  const addProductPage({Key? key}) : super(key: key);

  @override
  State<addProductPage> createState() => _addProductPageState();
}

class _addProductPageState extends State<addProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: idTextField(),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: nameTextField('Product'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: descTextField(),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: priceTextField(),
            ),
            productCategoryDropD(),
            Container(
              decoration: BoxDecoration(
                color: blue,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: addDataBtn('Product'),
            ),
          ],
        ),
      ),
    );
  }
}
