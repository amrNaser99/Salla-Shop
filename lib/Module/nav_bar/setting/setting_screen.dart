import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Module/login/shop_login_cubit/shop_login_states.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/cubit/shop_cubit.dart';
import 'package:shop_app/shared/cubit/shop_states.dart';
import 'package:shop_app/shared/styles/colors.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);

  var UserNameController = TextEditingController();
  var EmailController = TextEditingController();
  var PhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (BuildContext context, state) {
        if (state is ShopLoginSuccessStates)
        {
          // print(state.profileModel.data!.name!);
          // UserNameController.text = ShopCubit.get(context).profileModel!.data!.name!;
        }
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
            controller: UserNameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'UserName : ',
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
            controller: EmailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email ',
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
            controller: PhoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'Phone ',
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
