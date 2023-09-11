abstract class storestates {}
class NewsInitialStates extends storestates{}
class NewsBottomNavState extends storestates{}
class FavoritesInitialState extends storestates{}
class FavoritesSuccessfully extends storestates{}
class RemovedSuccessfully extends storestates{}
class FavoritesState extends storestates {
  final List<int> favoriteProductIds;

  FavoritesState(this.favoriteProductIds);
}