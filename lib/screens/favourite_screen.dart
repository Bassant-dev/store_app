import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/cubit.dart';
import 'package:store_app/cubit/states.dart';

import '../models/product_model.dart';

class favourite_screen extends StatelessWidget
{
  late ProductModel product;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<storecubit,storestates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var cubit=storecubit.get(context);
        return Scaffold(

        );
        },
    );
  }
}


