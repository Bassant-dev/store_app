import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:store_app/cubit/cubit.dart';
import 'package:store_app/cubit/states.dart';

class start extends StatelessWidget {
  static String id = 'start';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreCubit, storestates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = StoreCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: HexColor('#FF850409'),
            title: const Text(
              'Store App',
              style: TextStyle(color: Colors.black),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            items: cubit.bottomItems,
          ),
          body: cubit.getCurrentScreen(), // Use getCurrentScreen() from StoreCubit
        );
      },
    );
  }
}
