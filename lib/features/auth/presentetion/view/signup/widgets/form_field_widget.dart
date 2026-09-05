// features/auth/presentetion/view/signup/widgets/form_field_widget.dart

// features/auth/presentetion/view/signup/widgets/form_field_widget.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_platform_app/core/helper_function/app_regex.dart';
import 'package:movie_platform_app/core/widgets/custom_text_form_field.dart';
import 'package:movie_platform_app/features/auth/presentetion/manager/signup/signup_cubit.dart';
import 'package:movie_platform_app/features/auth/presentetion/view/signin/widgets/password_validator.dart';

class FormFieldWidget extends StatefulWidget {
  const FormFieldWidget({super.key});

  @override
  State<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  bool obscureText = true;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasNumber = false;
  bool hasSpecialcharacters = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();

    passwordController =context.read<SignupCubit>().passwordController;
    setupPasswordControllerListner();
  }

  void setupPasswordControllerListner() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase =
            AppRegex.hasLowerCase(passwordController.text);

        hasUpperCase =
            AppRegex.hasUpperCase(passwordController.text);

        hasSpecialcharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);

        hasNumber =
            AppRegex.hasNumber(passwordController.text);

        hasMinLength =
            AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: context.read<SignupCubit>().emailController,
            hinttext: 'E-mail',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),

          const SizedBox(height: 14),

          CustomTextFormField(
            controller: context.read<SignupCubit>().passwordController,
            hinttext: 'Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter a valid password';
              }
              return null;
            },
            obscureText: obscureText,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              icon: Icon(
                obscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Colors.grey,
              ),
            ),
          ),

          const SizedBox(height: 16),

          PasswordValidator(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacters: hasSpecialcharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),

          const SizedBox(height: 14),

          CustomTextFormField(
            controller: context.read<SignupCubit>().FullNameController,
            hinttext: 'Full Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
          ),

          const SizedBox(height: 14),

          CustomTextFormField(
            controller: context.read<SignupCubit>().phoneController,
            hinttext: 'Phone Number',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter your phone number';
              }
              return null;
            },
          ),

          const SizedBox(height: 14),

          CustomTextFormField(
            controller: context.read<SignupCubit>().nameController,
            hinttext: 'Username',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

