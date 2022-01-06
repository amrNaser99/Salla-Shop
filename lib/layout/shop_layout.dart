import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Module/search/search_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/cubit/shop_cubit.dart';
import 'package:shop_app/shared/cubit/shop_states.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopCubit()..geHomeData(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Salla',style:TextStyle( fontSize: 20.0),),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    NavigateTo(
                      context,
                      SearchScreen(),
                    );
                  },
                ),
              ],
            ),
            body: ShopCubit.get(context)
                .screens[ShopCubit.get(context).currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.apps),
                  label: 'Categories',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outlined),
                  label: 'Favourite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Setting',
                ),
              ],
              currentIndex: ShopCubit.get(context).currentIndex,
              onTap: (index) {
                ShopCubit.get(context).changeNavBarItems(index);
              },
            ),
          );
        },
      ),
    );
  }
}
