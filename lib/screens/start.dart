import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/cubit.dart';

import 'package:store_app/cubit/states.dart';

class start extends StatelessWidget {
  static String id = 'start';

  @override

  Widget build(BuildContext context) {
    return BlocConsumer<storecubit,storestates>(
      listener: (context,state){},

      builder:(context,state){
        var cubit =storecubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple[300],
            title: const Text(
                'Store App',
              style: TextStyle(color: Colors.black),
            ),

            // actions: [
            //
            //   IconButton(
            //     icon:Icon(Icons.brightness_4_outlined),
            //     onPressed:(){
            //      // CubitDark.get(context).changeAppMode();
            //     },
            //   )
            // ],


          ),

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
            cubit.changeBottomNavBar(index);
            },
            items:cubit.bottomItems ,
          ),
          body: cubit.screens[
          cubit.currentIndex
          ],
        );
      },
    );
  }
}