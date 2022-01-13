import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Module/login/shop_login_screen.dart';
import 'package:shop_app/Module/nav_bar/categories/categories_screen.dart';
import 'package:shop_app/Module/nav_bar/favourite/favourite_screen.dart';
import 'package:shop_app/Module/nav_bar/home/products_screen.dart';
import 'package:shop_app/Module/nav_bar/profile/profile_screen.dart';
import 'package:shop_app/model/categories_model.dart';
import 'package:shop_app/model/change_favourite_model.dart';
import 'package:shop_app/model/favourites_model.dart';
import 'package:shop_app/model/home_model.dart';
import 'package:shop_app/model/profile_model.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/cubit/shop_states.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialStateState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    ProductsScreen(),
    CategoryScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];

  void changeNavBarItems(int index) {
    currentIndex = index;
    emit(ShopChangeNavBarState());
  }

  HomeModel? homeModel;

  Map<int, bool> favourite = {};

  void geHomeData() {
    emit(ShopLoadingHomeDataState());
    // print('getData using api....');
    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      // print('in then fun in getHomeData');
      homeModel = HomeModel.fromJson(value.data);
      // print('in then fun in getHomeData after homemodel');

      homeModel?.data?.products?.forEach((element) {
        favourite.addAll({
          element.id: element.inFavourite,
        });
      });
      // print("pruduct id is ");
      // print(homeModel?.data?.products![1].id);
      // print('favourite list is  ${favourite.toString()}');
      emit(ShopHomeDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopHomeDataErrorState(error.toString()));
    });
  }

  CategoriesModel? categoriesModel;

  void getCategoriesData() {
    emit(ShopLoadingCategoriesState());
    // print('getCategoriesData using api....');
    DioHelper.getData(
      url: GET_CATEGORIES,
      token: token,
    ).then((value) {
      // print('in then fun in getCatData');
      print(value.data);
      categoriesModel = CategoriesModel.fromJson(value.data);
      // print('Sending Data in then fun  after CategoriesModel model');
      // print('length of CategoriesModel ${categoriesModel?.data?.data?.length}');

      emit(ShopCategoriesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopCategoriesErrorState(error.toString()));
    });
  }

  ChangeFavouriteModel? changeFavouriteModel;

  void changeFavourites(int productId) {
    if (favourite[productId] == true) {
      favourite[productId] = false;
    } else {
      favourite[productId] = true;
    }

    emit(ShopFavouriteSuccessState());

    DioHelper.postData(
      url: FAVOURITE,
      data: {'product_id': productId},
      token: token,
    ).then((value) {
      print(value.data);
      changeFavouriteModel = ChangeFavouriteModel.fromJson(value.data);

      // print('Product number ${changeFavouriteModel!.data!.product!.id!} changed');

      // print('Product id   is $productId');
      // print('favourite after is ${favourite[productId]}');

      if (!changeFavouriteModel!.status!) {
        if (favourite[productId] == true) {
          favourite[productId] = false;
        } else {
          favourite[productId] = true;
        }
        emit(ShopChangeFavouriteSuccessState(changeFavouriteModel!));
      } else {
        getFavourites();
      }
    }).catchError((error) {
      if (favourite[productId] == true) {
        favourite[productId] = false;
      } else {
        favourite[productId] = true;
      }

      emit(ShopChangeFavouriteErrorState(error));
    });
  }

  FavouriteModel? favouriteModel;

  void getFavourites() {
    emit(ShopLoadingFavouriteState());
    DioHelper.getData(
      url: FAVOURITE,
      token: token,
    ).then((value) {
      // print(
      // 'Get Favourite value.data.......................................................');
      // print(value.data);
      favouriteModel = FavouriteModel.fromJson(value.data);
      // print('Get Favourites ....................................');
      // print(favouriteModel!.data!.data!.length);
      // print(value.data.toString());
      emit(ShopGetFavouritesSuccessState(favouriteModel!));
    }).catchError((error) {
      emit(ShopGetFavouritesErrorState(error));
    });
  }

  ProfileModel? profileModel;

  void getProfile() {
    emit(ShopLoadingUserDataState());
    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      print(
          'Get Profile value.data.......................................................');
      print(value.data);
      profileModel = ProfileModel.fromJson(value.data);
      print('Get ProfileModel ....................................');
      print(profileModel!.data!.email!);
      emit(ShopUserDataSuccessState(profileModel!));
    }).catchError((error) {
      emit(ShopUserDataErrorState(error));
    });
  }

  void signOut(context, key) {
    CacheHelper.removeData(key: key).then((value) {
      NavigateAndFinish(context, const ShopLoginScreen());
    });
  }

  IconData changeIconFav(index){
    if(favourite[favouriteModel!.data!.data![index].id]! == true)
    {
      return Icons.favorite_outlined;
    } else {
      return Icons.favorite_outline;
    }
  }
}
