import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:store_app/cubit/cubit.dart';
import 'package:store_app/cubit/states.dart';
import 'package:store_app/screens/category_screen.dart';
import 'package:store_app/screens/electornics.dart';
import 'package:store_app/screens/home.dart';
import 'package:store_app/screens/jewlery.dart';
import 'package:store_app/screens/mens_clothes.dart';
import 'package:store_app/screens/on_boarding.dart';

import 'package:store_app/screens/start.dart';
import 'package:store_app/screens/womens_clothes.dart';

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
          create: (BuildContext context) =>StoreCubit(),

        ),
      ],
     child: MaterialApp(
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
           floatingActionButtonTheme: FloatingActionButtonThemeData(
             backgroundColor:HexColor('#FF850409'),
           ),
           bottomNavigationBarTheme:  BottomNavigationBarThemeData(
             type: BottomNavigationBarType.fixed,
             selectedItemColor: HexColor('#FF850409'),
             unselectedItemColor: Colors.grey,
             elevation: 20.0,
             backgroundColor: Colors.white,
           ),

         ),

         debugShowCheckedModeBanner: false,
         routes: {
           start.id: (context) => start(),
           HomePage.id: (context) => HomePage(),
           WomenPage.id: (context) => WomenPage(),
           MenPage.id: (context) => MenPage(),
           jeweleryPage.id: (context) => jeweleryPage(),
           electronicsPage.id: (context) => electronicsPage(),
           CategoryScreen.id: (context) => CategoryScreen(),
           OnboardingScreen.id: (context) => OnboardingScreen(),

         },
         initialRoute: OnboardingScreen.id
     ),
    );

  }
}
