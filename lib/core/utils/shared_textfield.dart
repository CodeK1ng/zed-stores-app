import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zed_stores/core/constants/constants.dart';

class InputTextWidget extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final TextInputType? textInputType;
  final TextEditingController controller;
  final String? Function(String?)? myValidator;

  const InputTextWidget(
      {super.key,
      this.textInputType,
      required this.hintText,
      required this.iconData,
      required this.controller,
      this.myValidator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      // style: const TextStyle(
      //     // color: Colors.black,
      //     ),
      keyboardType: textInputType,
      obscureText: hintText == 'Password' ? true : false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        hintText: hintText,
        hintStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            // color: kButtonColor,
            borderRadius: BorderRadius.circular(8.0),
            child: Icon(
              iconData,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
        filled: true,
        // fillColor: kFormColor,
        focusedBorder: kOutlineInputBorder,
        enabledBorder: kOutlineInputBorder,
      ),
      validator: myValidator,
    );
  }
}
