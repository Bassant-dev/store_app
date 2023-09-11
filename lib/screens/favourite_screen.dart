import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../widget/custom_card.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, storestates>(
      builder: (context, state) {
        if (state is FavoritesState) {
          final favoriteProductIds = state.favoriteProductIds;
          final cubit = StoreCubit.get(context);

          final favoriteProducts = cubit.products
              .where((product) => favoriteProductIds.contains(product.id))
              .toList();

          if (favoriteProducts.isEmpty) {

            return Center(
              child: Text('No favorite products.'),
            );
          }

          return ListView.builder(
            itemCount: favoriteProducts.length,
            itemBuilder: (context, index) {
              final product = favoriteProducts[index];
              return CustomCard(product: product);
            },
          );
        } else {

          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
