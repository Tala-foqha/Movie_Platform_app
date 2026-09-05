// core/widgets/custom_button.dart
import 'package:flutter/material.dart';
import 'package:movie_platform_app/core/utils/app_colors.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.text});
 final void Function()? onTap;
 final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 53,
        
        width: double.infinity,
        child: Center(
          child: Text(text,
          style: AppStyles.semiBold18,
          ),
        ),
      
        decoration: BoxDecoration(
          
          
          color: AppColrs.primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}