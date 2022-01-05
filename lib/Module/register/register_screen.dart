import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/Module/login/shop_login_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/styles/colors.dart';

class ShopRegisterScreen extends StatefulWidget {
  const ShopRegisterScreen({Key? key}) : super(key: key);

  @override
  State<ShopRegisterScreen> createState() => _ShopRegisterScreenState();
}

class _ShopRegisterScreenState extends State<ShopRegisterScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var userNameController = TextEditingController();

  var verifyPasswordController = TextEditingController();

  var isPassword = true;
  var isVerifyPassword = true;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                      condition: true,//state is! ShopLoginLoadingStates,
                      builder: (context) => defaultButton(
                        color: primaryColor,
                        text: 'Register',
                        function: () {
                          if(formKey.currentState!.validate()){

                           //TODO link to api and register

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
                        const Text('Already Have Account?'),
                        defaultTextButton(
                          onPressed: () {
                            NavigateAndFinish(
                                context,  const ShopLoginScreen());
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
  }
}
