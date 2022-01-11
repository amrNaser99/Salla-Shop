import 'package:shop_app/model/change_favourite_model.dart';
import 'package:shop_app/model/favourites_model.dart';
import 'package:shop_app/model/profile_model.dart';

abstract class ShopStates {}


class ShopInitialStateState extends ShopStates{}

class ShopChangeNavBarState extends ShopStates{}


class ShopLoadingHomeDataState extends ShopStates{}
class ShopHomeDataSuccessState extends ShopStates{}
class ShopHomeDataErrorState extends ShopStates{
  final String error;
  ShopHomeDataErrorState(this.error);
}

class ShopLoadingCategoriesState extends ShopStates{}
class ShopCategoriesSuccessState extends ShopStates{}
class ShopCategoriesErrorState extends ShopStates{
  final String error;
  ShopCategoriesErrorState(this.error);
}
class ShopChangeFavouriteSuccessState extends ShopStates{
  final ChangeFavouriteModel favouriteModel ;

  ShopChangeFavouriteSuccessState(this.favouriteModel);

}
class ShopChangeFavouriteErrorState extends ShopStates{
  final String error;

  ShopChangeFavouriteErrorState(this.error);
}
class ShopLoadingFavouriteState extends ShopStates{}

class ShopFavouriteSuccessState extends ShopStates{
}
class ShopGetFavouritesSuccessState extends ShopStates{
  final FavouriteModel favouriteModel ;

  ShopGetFavouritesSuccessState(this.favouriteModel);
}
class ShopGetFavouritesErrorState extends ShopStates{
  final String error;

  ShopGetFavouritesErrorState(this.error);
}

class ShopLoadingUserDataState extends ShopStates{}

class ShopUserDataSuccessState extends ShopStates{
  final ProfileModel profileModel ;

  ShopUserDataSuccessState(this.profileModel);


}
class ShopUserDataErrorState extends ShopStates{
  final String error;

  ShopUserDataErrorState(this.error);

}

