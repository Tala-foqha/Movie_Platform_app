// features/auth/presentetion/view/codeview/widget/resend_row_code.dart
import 'package:flutter/material.dart';
import 'package:movie_platform_app/core/utils/app_colors.dart';

class ResendRowCode extends StatelessWidget {

  const ResendRowCode({

    required this.secondsLeft,

    required this.onResend,

  });

  final int secondsLeft;

  final VoidCallback onResend;

  @override

  Widget build(BuildContext context) {

    if (secondsLeft > 0) {

      final mm = secondsLeft ~/ 60;

      final ss = (secondsLeft % 60).toString().padLeft(2, '0');

      return Text(

        'Resend code in $mm:$ss',

        style: const TextStyle(

          fontFamily: 'Inter',

          fontSize: 13,

          color: Colors.white,

        ),

      );

    }

    return GestureDetector(

      behavior: HitTestBehavior.opaque,

      onTap: onResend,

      child: const Text(

        'Resend code',

        style: TextStyle(

          fontFamily: 'Inter',

          fontSize: 13,

          fontWeight: FontWeight.w600,

          color: AppColrs.primaryColor,

        ),

      ),

    );

  }

}