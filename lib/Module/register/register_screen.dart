import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/Module/login/shop_login_screen.dart';
import 'package:shop_app/Module/register/register_cubit/register_cubit.dart';
import 'package:shop_app/Module/register/register_cubit/register_states.dart';
import 'package:shop_app/layout/shop_layout.dart';
import 'package:shop_app/model/login_model.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/styles/colors.dart';

class ShopRegisterScreen extends StatefulWidget {
  const ShopRegisterScreen({Key? key}) : super(key: key);

  @override
  State<ShopRegisterScreen> createState() => _ShopRegisterScreenState();
}

class _ShopRegisterScreenState extends State<ShopRegisterScreen> {
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  TextEditingController? phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var verifyPasswordController = TextEditingController();
  var isPassword = true;
  var isVerifyPassword = true;
  var formKey = GlobalKey<FormState>();
  ShopLoginModel? loginModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state)
        {
          if(state is ShopRegisterSuccessStates)
          {
            if(state.registerModel.status){
              print(state.registerModel.message);
              print(state.registerModel.data.token);
              CacheHelper.saveData(key: 'token', value: state.registerModel.data.token).then((value) {
                showToast(message: state.registerModel.message);
                NavigateAndFinish(context, const ShopLayout());
              });
            }else
            {
              print(state.registerModel.message);

              Fluttertoast.showToast(
                  msg: state.registerModel.message,
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
        builder: (context, state) {
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
                            'SIGN UP',
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor),
                          ),
                          Text(
                            'Register Now To Have an Account',
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: colorGrey,
                                    ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          defaultTextFormField(
                            controller: userNameController,
                            keyboardType: TextInputType.text,
                            labelText: 'UserName',
                            prefixIcon: Icons.alternate_email_outlined,
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
                            controller: phoneController!,
                            keyboardType: TextInputType.phone,
                            labelText: 'Phone',
                            hintText: '+20*********',
                            prefixIcon: Icons.local_phone_outlined,
                            // validate: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Please Enter Your Email Address';
                            //   }
                            // }
                            // ,
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
                            height: 10.0,
                          ),
                          defaultTextFormField(
                              controller: verifyPasswordController,
                              keyboardType: TextInputType.visiblePassword,
                              labelText: 'Verify Password',
                              prefixIcon: Icons.lock_outline,
                              validate: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password Must\'t Be Empty';
                                }
                                if (value != passwordController.text) {
                                  return 'Re-Enter The Password';
                                }
                              },
                              isPassword: isVerifyPassword,
                              suffixIcon: isVerifyPassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              suffixPressed: () {
                                setState(() {
                                  isVerifyPassword = !isVerifyPassword;
                                });
                              }),
                          const SizedBox(
                            height: 30.0,
                          ),
                          ConditionalBuilder(
                            condition: state is! ShopRegisterLoadingStates,
                            builder: (context) => defaultButton(
                              color: primaryColor,
                              text: 'Register',
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  //TODO link to api and register

                                  RegisterCubit.get(context).userRegister(
                                    userName: userNameController.text,
                                    email: emailController.text,
                                    phone: phoneController?.text,
                                    password: passwordController.text,
                                    vPassword: verifyPasswordController.text,
                                  );
                                }
                              },
                              isUpperCase: true,
                            ),
                            fallback: (context) =>
                                const Center(child: CircularProgressIndicator()),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Already Have Account?'),
                              defaultTextButton(
                                onPressed: () {
                                  NavigateAndFinish(
                                      context, const ShopLoginScreen());
                                },
                                text: 'Login',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
