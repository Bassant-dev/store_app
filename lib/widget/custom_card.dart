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
       // final isFavorite = cubit.isProductFavorite(product);

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
                   // blurRadius: 50,
                    color: Colors.white,
                    spreadRadius: 20,
                    offset: const Offset(10, 10),
                  ),
                ]),
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),

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
                                cubit.isProductFavorite(product);
                                 print(cubit.favoriteProductIds.length);
                              },
                              icon: Icon(
                                product.fav
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: product.fav ? Colors.red : null,
                              ),
                            ),

                          ],

                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 33,
                top: 15,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white70,
                  child: Image.network(

                    product.image,
                    height: 90,
                    width: 90,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
