import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/states.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/home.dart';
import 'package:store_app/screens/favourite_screen.dart';
import 'package:store_app/screens/category_screen.dart';

class StoreCubit extends Cubit<storestates> {
  StoreCubit() : super(NewsInitialStates());

  List<int> favoriteProductIds = [];
  List<ProductModel> products = [];


  void setProducts(List<ProductModel> productList) {
    products = productList;
  }
  void toggleProductFavorite(int productId) {
    if (favoriteProductIds.contains(productId)) {
      favoriteProductIds.remove(productId);
    } else {
      favoriteProductIds.add(productId);
    }
    emit(FavoritesState(favoriteProductIds));
  }
  bool isProductFavorite(int productId) {
    return favoriteProductIds.contains(productId);
  }



  static StoreCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite,
      ),
      label: 'Favourite',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.category,
      ),
      label: 'Category',
    ),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }


  final homeScreen = HomePage();
  final favouriteScreen = FavoriteScreen();
  final categoryScreen = CategoryScreen();


  Widget getCurrentScreen() {
    switch (currentIndex) {
      case 0:
        return homeScreen;
      case 1:
        return favouriteScreen;
      case 2:
        return categoryScreen;
      default:
        return homeScreen;
    }
  }
}