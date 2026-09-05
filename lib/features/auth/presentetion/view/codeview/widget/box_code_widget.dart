// features/auth/presentetion/view/codeview/widget/box_code_widget.dart
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class BoxCodeWidget extends StatelessWidget {
  const BoxCodeWidget({
    super.key,
    required this.controller,
    required this.isError,
    this.onChanged,
  });

  final TextEditingController controller;
  final bool isError;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 55,
      height: 55,
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: isError ? Colors.red : Colors.white,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: isError ? Colors.red : Colors.white,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: isError ? Colors.red : Colors.white,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    return Pinput(
      controller: controller,
      length: 4,
      keyboardType: TextInputType.number,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      mainAxisAlignment: MainAxisAlignment.center,
      separatorBuilder: (index) => const SizedBox(width: 10),

      onChanged: onChanged,
    );
  }
}