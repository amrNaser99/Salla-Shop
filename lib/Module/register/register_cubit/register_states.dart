import 'package:shop_app/model/login_model.dart';
import 'package:shop_app/model/register_model.dart';
abstract class RegisterStates {}

class ShopRegisterInitialStates extends RegisterStates {}

class ShopRegisterLoadingStates extends RegisterStates {}

class ShopRegisterSuccessStates extends RegisterStates {
  final RegisterModel registerModel;

  ShopRegisterSuccessStates(this.registerModel);

}

class ShopRegisterErrorStates extends RegisterStates {
  final String error;

  ShopRegisterErrorStates(this.error);

}
