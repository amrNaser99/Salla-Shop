import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:shop_app/shared/bloc_observer.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import 'package:shop_app/shared/styles/themes.dart';

import 'Module/login/shop_login_screen.dart';
import 'Module/onBoarding/onBoarding.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CacheHelper.init();

  bool? onBoarding = false;
  onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  print('onBoarding $onBoarding');
  print ('token $token');

  BlocOverrides.runZoned(()
  {
      runApp(MyApp(onBoarding));
      },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {


  bool? onBoarding =false;

  MyApp(this.onBoarding) ;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home:  onBoarding ==true ? const ShopLoginScreen() : const OnBoardingScreen(),
      // onBoarding ==true ? const ShopLoginScreen() : const OnBoardingScreen(),
    );
  }
}
