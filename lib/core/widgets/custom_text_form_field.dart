// core/widgets/custom_text_form_field.dart
import 'package:flutter/material.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hinttext, this.suffixIcon, this.prefixIcon, required this.validator, this.obscureText, this.controller});
  final String hinttext;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?) validator;
  final bool? obscureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextFormField(
        style: AppStyles.regular14.copyWith(
          color: Colors.white,
        ),
        obscureText: obscureText ?? false,
        controller: controller,
        validator: validator,
        decoration:  InputDecoration(
          hintText: hinttext,
          hintStyle: AppStyles.regular14,
          suffixIcon: suffixIcon,
         
          filled: true,
            fillColor: Colors.black,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff575757)),
              borderRadius: BorderRadius.circular(16),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff575757)),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.white, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
        ),
      ),
    );
  }
}