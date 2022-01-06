import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/shared/styles/colors.dart';

Widget defaultButton({
  double width = double.infinity,
  required Color color,
  required String text,
  required void Function() function,
  bool isUpperCase = true,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: function,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
    );

void NavigateTo(context, Widget) =>
    Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Widget,
    ),
  );


void NavigateAndFinish(context, Widget) =>
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => Widget),
            (route) => false);

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  required String labelText,
  String? hintText,
  required IconData prefixIcon,
  FormFieldValidator<String>? validate,
  IconData? suffixIcon,
  void Function(String)? onSubmitted,
  void Function(String)? onChanged,
  void Function()? onTap,
  void Function()? suffixPressed,
  bool isPassword = false,
  double radius = 10.0,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
        prefixIcon: Icon(prefixIcon),
        hintText: hintText,
        suffixIcon: suffixIcon != null ? IconButton(
          icon: Icon(suffixIcon),
          onPressed: suffixPressed,) : null,
      ),
      onChanged: onChanged,

      onTap: onTap,
      validator: validate,
      onFieldSubmitted: onSubmitted,
    );

Widget defaultTextButton({
  required Function()? onPressed,
  required String text ,
}) => TextButton(

  onPressed: onPressed,
  child: Text(
    text.toUpperCase(),
    style: TextStyle(
        color: primaryColor, fontWeight: FontWeight.bold),
  ),
);

void showToast({required String message,}){

  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0
  );
}