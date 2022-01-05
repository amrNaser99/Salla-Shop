abstract class ShopStates {}


class ShopInitialStateState extends ShopStates{}

class ShopChangeNavBarState extends ShopStates{}


class ShopLoadingHomeDataState extends ShopStates{}
class ShopHomeDataSuccessState extends ShopStates{}
class ShopHomeDataErrorState extends ShopStates{
  final String error;
  ShopHomeDataErrorState(this.error);

}
