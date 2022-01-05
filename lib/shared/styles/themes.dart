import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/shared/styles/colors.dart';
ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: Colors.deepPurple,
  appBarTheme: const AppBarTheme(
    centerTitle: false,
    titleSpacing: 20.0,
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600

    ),
    iconTheme: IconThemeData(color: Colors.black),
    elevation: 0.0,
    systemOverlayStyle:  SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    unselectedItemColor: Colors.grey,
    selectedItemColor: primaryColor,
    elevation: 50.0,
  ),
  backgroundColor: Colors.white,
  fontFamily: 'janna',
);
ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: Colors.deepPurple,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    elevation: 0.0,
    systemOverlayStyle:  SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    unselectedItemColor: Colors.grey,
    selectedItemColor: primaryColor,
  ),
  backgroundColor: Colors.white,
  fontFamily: 'janna',

);
