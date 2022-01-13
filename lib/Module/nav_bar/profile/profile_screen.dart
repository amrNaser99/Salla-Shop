
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/cubit/shop_cubit.dart';
import 'package:shop_app/shared/cubit/shop_states.dart';
import 'package:shop_app/shared/styles/colors.dart';

class ProfileScreen extends StatelessWidget {

  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (BuildContext context, state) {
      },
      builder: (BuildContext context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Container(
            width: double.infinity,
            child: const CircleAvatar(
              radius: 50.0,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          TextFormField(
            style: const TextStyle(
              color: Colors.black
            ),
            controller: userNameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'UserName: ${ShopCubit.get(context).profileModel!.data!.name!}',
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              prefixIcon: const Icon(Icons.alternate_email_sharp),
              enabled: false,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email: ${ShopCubit.get(context).profileModel!.data!.email!}',
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              prefixIcon: const Icon(Icons.email_rounded),
              enabled: false,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextFormField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'Phone: ${ShopCubit.get(context).profileModel!.data!.phone!}',
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              prefixIcon: const Icon(Icons.phone_iphone),
              enabled: false,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          defaultButton(
            color: primaryColor,
            text: 'LOG OUT',
            function: () {
              ShopCubit.get(context).signOut(context, token);
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          defaultButton(
            color: primaryColor,
            text: 'UPDATE PROFILE',
            function: () {
              print(ShopCubit.get(context).profileModel!.data!.name!);

            },
          ),
          Spacer(),
          const Text(
            'Developed by Amr Nasser',
            style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
          )
          ],
        ),);
      },
    );
  }
}
