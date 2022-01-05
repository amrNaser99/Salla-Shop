import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Module/nav_bar/categories/categories_screen.dart';
import 'package:shop_app/Module/nav_bar/favourite/favourite_screen.dart';
import 'package:shop_app/Module/nav_bar/home/products_screen.dart';
import 'package:shop_app/Module/nav_bar/setting/setting_screen.dart';
import 'package:shop_app/model/home_model.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/cubit/shop_states.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialStateState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    ProductsScreen(),
    CategoryScreen(),
    FavouriteScreen(),
    SettingScreen(),
  ];

  void changeNavBarItems(int index) {
    currentIndex = index;
    emit(ShopChangeNavBarState());
  }

  late HomeModel homeModel;

  void geHomeData() {
    emit(ShopLoadingHomeDataState());
    print('getData using api....');
    DioHelper.getData(
      url: HOME,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel.data?.banners[0].image);
      printFullText(homeModel.toString());
      emit(ShopHomeDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopHomeDataErrorState(error.toString()));
    });
  }
}