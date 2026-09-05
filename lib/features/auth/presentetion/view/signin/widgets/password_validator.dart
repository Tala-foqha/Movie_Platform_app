// features/auth/presentetion/view/signin/widgets/password_validator.dart
import 'package:flutter/material.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';

class PasswordValidator extends StatelessWidget {
  const PasswordValidator({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowerCase letter', hasLowerCase),
        SizedBox(height: 2),
        buildValidationRow('At least 1 upperCase letter', hasUpperCase),
        SizedBox(height: 2),
        buildValidationRow(
          'At least 1 SpecialCharacters .03',
          hasSpecialCharacters,
        ),
        SizedBox(height: 2),
        buildValidationRow('At least 1 Number ', hasNumber),
        SizedBox(height: 2),
        buildValidationRow('At least 1 MinLength ', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(radius: 2.5, backgroundColor: Colors.grey),
        SizedBox(width: 6),
        Text(
          text,
          style: AppStyles.regular13.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? Colors.grey : Colors.white,
          ),
        ),
      ],
    );
  }
}