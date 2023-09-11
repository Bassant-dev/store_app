import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/models/product_model.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    required this.product,
    Key? key,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreCubit, storestates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = StoreCubit.get(context);

        final isFavorite = cubit.isProductFavorite(product.id);

        return GestureDetector(
          onTap: () {
            // Handle the tap event if needed
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    blurRadius: 50,
                    color: Colors.grey.withOpacity(.1),
                    spreadRadius: 20,
                    offset: Offset(10, 10),
                  ),
                ]),
                child: Card(
                  color: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title.substring(0, 6),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              r'$' '${product.price.toString()}',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            IconButton(
                              onPressed: () {

                                cubit.toggleProductFavorite(product.id);
                                cubit.products.add(product);
                                cubit.favoriteProductIds.add(product.id);

                                // Print the updated list of product IDs
                                print('Product IDs: ${cubit.products.map((product) => product.id).toList()}');
                              },
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite ? Colors.red : null,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 32,
                top: -60,
                child: Image.network(
                  product.image,
                  height: 90,
                  width: 90,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
