import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../widget/custom_card.dart';
import 'custom_fav.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, storestates>(
      builder: (context, state) {
        final cubit = StoreCubit.get(context);
          return ListView.builder(
            itemCount: cubit.favoriteProductIds.length,
            itemBuilder: (context, index) {
              final product = cubit.favoriteProductIds[index];
              return Customfav(product: product);
            },
          );



      },
    );
  }
}
