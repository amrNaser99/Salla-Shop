import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Module/nav_bar/categories/categories_screen.dart';
import 'package:shop_app/Module/nav_bar/favourite/favourite_screen.dart';
import 'package:shop_app/Module/nav_bar/home/products_screen.dart';
import 'package:shop_app/Module/nav_bar/setting/setting_screen.dart';
import 'package:shop_app/model/categories_model.dart';
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
    const ProductsScreen(),
    CategoryScreen(),
    FavouriteScreen(),
    SettingScreen(),
  ];

  void changeNavBarItems(int index) {
    currentIndex = index;
    emit(ShopChangeNavBarState());
  }

  HomeModel? homeModel ;

  void geHomeData() {
    emit(ShopLoadingHomeDataState());
    print('getData using api....');
    DioHelper.getData(
      url: HOME,
      token: token ,
    ).then((value) {
      print('in then fun in getHomeData');
      homeModel = HomeModel.fromJson(value.data);
      print('in then fun in getHomeData after homemodel');

      // print(homeModel?.data?.products?.length);
      // print(homeModel?.data?.products![1].image);
      // print(homeModel.toString());
      emit(ShopHomeDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopHomeDataErrorState(error.toString()));
    });
  }


  CategoriesModel? categoriesModel ;

  void getCategoriesData() {
    emit(ShopLoadingCategoriesState());
    print('getCategoriesData using api....');
    DioHelper.getData(
      url: GET_CATEGORIES,
      token: token ,
    ).then((value) {
      print('in then fun in getCatData');
      print(value.data);
      categoriesModel = CategoriesModel.fromJson(value.data);
      print('Sending Data in then fun  after CategoriesModel model');
      // print(categoriesModel?.data?.data?.length);
      // print(categoriesModel?.data?.data![1].image);
      // print(categoriesModel?.data.toString());
      emit(ShopCategoriesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopCategoriesErrorState(error.toString()));
    });
  }
}
