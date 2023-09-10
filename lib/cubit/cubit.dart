import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:store_app/cubit/states.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/home.dart';
import 'package:store_app/screens/favourite_screen.dart';
class storecubit extends Cubit<storestates> {
  storecubit() : super(NewsInitialStates());


  static storecubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 0) {
      HomePage();
    }
    if (index == 1) {
      favourite_screen();
    }
    emit(NewsBottomNavState());
  }

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        label: 'Home'
    ),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite,
        ),
        label: 'Favourite'
    ),

  ];
  List<Widget> screens = [

    HomePage(),
    favourite_screen(),

  ];



}