import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/model/favourites_model.dart';
import 'package:shop_app/shared/cubit/shop_cubit.dart';
import 'package:shop_app/shared/cubit/shop_states.dart';
import 'package:shop_app/shared/styles/colors.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! ShopLoadingFavouriteState,
          builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => buildFavItem(
                ShopCubit.get(context).favouriteModel!.data!.data![index],
                context),
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                height: 2,
                color: Colors.grey[300],
              ),
            ),
            itemCount: ShopCubit.get(context).favouriteModel!.data!.data!.length,
          ),
          fallback:(context) =>  const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildFavItem(FavouritesData data, BuildContext context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(data.product!.image!),
                    height: 120.0,
                    width: 120.0,
                  ),
                  if (data.product!.discount! != 0)
                    Container(
                      color: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: const Text(
                        'DISCOUNT',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 9.0),
                      ),
                    ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.product!.name!,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          height: 1.3,
                          fontSize: 18.0,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          end: 5.0,
                          start: 5.0,
                        ),
                        child: Row(
                          children: [
                            Text(
                              '${data.product!.price!.round()} LE',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: primaryColor,
                                height: 1.3,
                                fontSize: 14.0,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            if (data.product!.discount != 0)
                              Text(
                                '${data.product!.oldPrice!.round()} LE',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.grey,
                                    height: 1.3,
                                    fontSize: 10.0,
                                    decoration: TextDecoration.lineThrough),
                              ),
                            const Spacer(),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 15.0,
                              child: IconButton(
                                onPressed: () {
                                  ShopCubit.get(context)
                                      .changeFavourites(data.product!.id!);
                                },
                                icon: Icon(
                                  ShopCubit.get(context)
                                          .favourite[data.product!.id]!
                                      ? Icons.favorite_outlined
                                      : Icons.favorite_outline,
                                  size: 18.0,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
