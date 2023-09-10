import 'package:flutter/material.dart';

import 'package:store_app/models/product_model.dart';
import 'package:store_app/widget/custom_text_field.dart';
import 'package:store_app/widget/custom_button.dart';

class UpdateProductPage extends StatefulWidget {
  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image;

  String? price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
        'Update Product',
        style: TextStyle(
        color: Colors.black,
    ),
      ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      
    );


  }



  }



