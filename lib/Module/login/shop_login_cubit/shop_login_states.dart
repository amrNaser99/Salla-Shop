import 'package:shop_app/model/login_model.dart';

abstract class ShopLoginStates {}

class ShopLoginInitialStates extends ShopLoginStates {}

class ShopLoginLoadingStates extends ShopLoginStates {}

class ShopLoginSuccessStates extends ShopLoginStates {
  final ShopLoginModel userModel;

  ShopLoginSuccessStates(this.userModel);

}

class ShopLoginErrorStates extends ShopLoginStates {
  final String error;

  ShopLoginErrorStates(this.error);
}


class ShopRegisterLoadingStates extends ShopLoginStates {}

class ShopRegisterSuccessStates extends ShopLoginStates {
  final ShopLoginModel registerModel;

  ShopRegisterSuccessStates(this.registerModel);

}

class ShopRegisterErrorStates extends ShopLoginStates {
  final String error;

  ShopRegisterErrorStates(this.error);

}
