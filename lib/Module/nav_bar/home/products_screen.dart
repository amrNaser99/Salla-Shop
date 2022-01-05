import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/cubit/shop_cubit.dart';
import 'package:shop_app/shared/cubit/shop_states.dart';

class ProductsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: token != null  ,
          builder:(context) =>  productBuilder(),
          fallback:(context) =>  const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
  Widget productBuilder() => Column(
    children: [
      Center(child: Text('Data Received successfully')),
    ],
  );
}
