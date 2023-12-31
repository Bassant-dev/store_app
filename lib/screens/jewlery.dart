import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product_services.dart';
import 'package:store_app/widget/custom_card.dart';

import '../services/categories_services.dart';

class jeweleryPage extends StatelessWidget {
  const jeweleryPage({Key? key}) : super(key: key);
  static String id = 'jeweleryPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  HexColor('#FF850409'),
        title:Text('jewelery'),
      ),
//CategoriesService().getCategoriesProducts(categoryName:"jewelery")
      body:
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
        child: FutureBuilder<List<ProductModel>>(
          future: CategoriesService().getCategoriesProducts(categoryName:"jewelery"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(color: HexColor('#FF850409'),),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data == null) {
              return Center(
                child: Text('No data available'),
              );
            } else {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 50,
                ),
                itemBuilder: (context, index) {
                  return CustomCard(product: products[index],);
                },
              );
            }
          },
        ),
      ),
    );
  }
}

