import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Module/login/shop_login_cubit/shop_login_states.dart';
import 'package:shop_app/model/login_model.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialStates());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  late ShopLoginModel loginModel ;

  void userLogin({
  required String email,
  required String password,
}) {
    emit(ShopLoginLoadingStates());
    print('in userLogin - next DioPostData ');
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email':email,
        'password':password,
      },
    ).then((value) {
      print(value.data);
      loginModel =  ShopLoginModel.fromJson(value.data);
        emit(ShopLoginSuccessStates(loginModel));
    }).catchError((error){
      emit(ShopLoginErrorStates(error.toString()));
    });
  }
}
