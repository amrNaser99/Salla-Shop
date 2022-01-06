import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/Module/login/shop_login_cubit/shop_login_cubit.dart';
import 'package:shop_app/Module/login/shop_login_cubit/shop_login_states.dart';
import 'package:shop_app/Module/register/register_screen.dart';
import 'package:shop_app/layout/shop_layout.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/styles/colors.dart';

class ShopLoginScreen extends StatefulWidget {
  const ShopLoginScreen({Key? key}) : super(key: key);

  @override
  State<ShopLoginScreen> createState() => _ShopLoginScreenState();
}

class _ShopLoginScreenState extends State<ShopLoginScreen> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isPassword = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
          listener: (BuildContext context, state) {
            if(state is ShopLoginSuccessStates)
            {
              if(state.userModel.status){
                print(state.userModel.message);
                print(state.userModel.data.token);
                CacheHelper.saveData(key: 'token', value: state.userModel.data.token).then((value) {
                  showToast(message: state.userModel.message);
                  NavigateAndFinish(context, const ShopLayout());
                });
              }else
                {
                  print(state.userModel.message);

                  Fluttertoast.showToast(
                      msg: state.userModel.message,
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }
            }
          },
          builder: (BuildContext context, state) {
            return Scaffold(
                appBar: AppBar(),
                body: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'LOGIN',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor),
                            ),
                            Text(
                              'Login Now To Browse Our Offers',
                              style:
                                  Theme.of(context).textTheme.bodyText1?.copyWith(
                                        color: colorGrey,
                                      ),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            defaultTextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              labelText: 'Email',
                              hintText: 'Email Address',
                              prefixIcon: Icons.email_outlined,
                              validate: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Your Email Address';
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            defaultTextFormField(
                                controller: passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                labelText: 'Password',
                                prefixIcon: Icons.lock_outline,
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password Must\'t Be Empty';
                                  }
                                },
                                isPassword: isPassword,
                                suffixIcon: isPassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                suffixPressed: () {
                                  setState(() {
                                    isPassword = !isPassword;
                                  });
                                }),
                            const SizedBox(
                              height: 30.0,
                            ),
                            ConditionalBuilder(
                              condition: state is! ShopLoginLoadingStates,
                              builder: (context) => defaultButton(
                                color: primaryColor,
                                text: 'Login',
                                function: () {
                                  if(formKey.currentState!.validate()){
                                    ShopLoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                isUpperCase: true,
                              ),
                              fallback: (context) => const Center(
                                  child: CircularProgressIndicator()),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Don\'t Have Account?'),
                                defaultTextButton(
                                  onPressed: () {
                                    NavigateAndFinish(
                                        context,  const ShopRegisterScreen());
                                  },
                                  text: 'Register',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
          }),
    );
  }
}
