// features/auth/presentetion/view/signup/widgets/signup_view_body.dart

// features/auth/presentetion/view/signup/widgets/signup_view_body.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';
import 'package:movie_platform_app/core/widgets/custom_button.dart';
import 'package:movie_platform_app/core/widgets/or_widgt.dart';
import 'package:movie_platform_app/core/widgets/social_item_list.dart';
import 'package:movie_platform_app/features/auth/data/models/signup_request_body.dart';
import 'package:movie_platform_app/features/auth/presentetion/manager/signup/signup_cubit.dart';
import 'package:movie_platform_app/features/auth/presentetion/view/signup/widgets/form_field_widget.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),

            // Skip
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Skip',
                  style: AppStyles.medium15,
                ),
              ],
            ),

            const SizedBox(height: 69),

            // Title
            Text(
              'Sign Up',
              style: AppStyles.medium22,
            ),

            const SizedBox(height: 14),

            // Form
            const FormFieldWidget(),

            const SizedBox(height: 28),

            // Sign Up Button
            CustomButton(
              text: 'Sign Up',
              onTap:() {
               if (context
    .read<SignupCubit>()
    .formKey
    .currentState!
    .validate()) {
  
  context
      .read<SignupCubit>()
      .formKey
      .currentState!
      .save();
    
  context.read<SignupCubit>().signup(
    SignupRequestBody(
      PhoneNumber: context.read<SignupCubit>().phoneController.text,
      Email: context.read<SignupCubit>().emailController.text,
      Password: context.read<SignupCubit>().passwordController.text,
       FullName: context.read<SignupCubit>().FullNameController.text,
       UserName: context.read<SignupCubit>().nameController.text,
    )
               );
               } else {
  context.read<SignupCubit>().autovalidateMode =
      AutovalidateMode.always;

  setState(() {});
}}
            ),        
            const SizedBox(height: 12),

            // Privacy Policy
            Text(
                'By clicking the “Sign Up” button, '
                'you accept the terms of the Privacy Policy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff979797),
                ),
              ),
            

            const SizedBox(height: 28),

            // OR
            OrWidgt(),

            const SizedBox(height: 28),

            // Social Login
            SocialItemList(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

