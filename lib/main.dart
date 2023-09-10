import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/cubit.dart';
import 'package:store_app/cubit/states.dart';
import 'package:store_app/screens/home.dart';
import 'package:store_app/screens/update_product.dart';
import 'package:store_app/screens/start.dart';

import 'cubit/bloc_observer.dart';
void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const StoreApp());
}


class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (BuildContext context) =>storecubit(),

        ),
      ],
     child: BlocConsumer<storecubit, storestates>(

        listener: (context,state){},
      builder: (context,state){
          return MaterialApp(
              theme: ThemeData(
                primarySwatch: Colors.grey,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  titleSpacing: 20.0,

                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                ),
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.purple,
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.purple,
                  unselectedItemColor: Colors.grey,
                  elevation: 20.0,
                  backgroundColor: Colors.white,
                ),

              ),

              debugShowCheckedModeBanner: false,
              routes: {
                start.id:(context) =>start(),
                HomePage.id:(context) =>HomePage(),
                UpdateProductPage.id : (context) =>UpdateProductPage()
              },
              initialRoute:start.id
          );
      },
    ),
    );

  }
}
