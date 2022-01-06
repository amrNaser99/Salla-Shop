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
