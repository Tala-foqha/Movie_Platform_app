// core/widgets/custom_text_form_field.dart

import 'package:flutter/material.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hinttext,
    this.suffixIcon,
    this.prefixIcon,
    required this.validator,
    this.obscureText,
    this.controller,
    this.fillColor,
    this.borderRadius,
    this.hasBorder = true, this.onChanged,
  });

  final String hinttext;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?) validator;
  final bool? obscureText;
  final Color? fillColor;
  final bool hasBorder;
  final BorderRadius? borderRadius;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.circular(16);

    return TextFormField(
      
      style: AppStyles.regular14.copyWith(
        color: Colors.white,
      ),
      obscureText: obscureText ?? false,
      controller: controller,
      validator: validator,
      cursorColor: Colors.white,
      onChanged:onChanged ,
      decoration: InputDecoration(
        constraints: BoxConstraints(
          minHeight: 50
        ),
        
        hintText: hinttext,
        hintStyle: AppStyles.regular14,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
    
        filled: true,
        fillColor: fillColor ?? Colors.black,
    
        // Normal
        border: OutlineInputBorder(
          borderRadius: radius,
          borderSide: hasBorder
              ? const BorderSide(color: Color(0xff575757))
              : BorderSide.none,
        ),
    
        // Before focus
        enabledBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: hasBorder
              ? const BorderSide(color: Color(0xff575757))
              : BorderSide.none,
        ),
    
        // When focused
        focusedBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: hasBorder
              ? const BorderSide(color: Colors.white, width: 1)
              : BorderSide.none,
        ),
    
        // Error
        errorBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: hasBorder
              ? const BorderSide(color: Colors.red, width: 1)
              : BorderSide.none,
        ),
    
        // Focus + Error
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: hasBorder
              ? const BorderSide(color: Colors.red, width: 1)
              : BorderSide.none,
        ),
      ),
    );
  }
}