import 'package:flutter/material.dart';

import '../../model/constants.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText,
  });

  final String hintText;
  final TextEditingController controller;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16,
          fontFamily: 'Poppins',
          color: AppColor.kTextColor.withOpacity(0.5),
        ),
        //border around the textfield
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.kTextColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.kButtonColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
