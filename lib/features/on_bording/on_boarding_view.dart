// features/on_bording/on_boarding_view.dart
import 'package:flutter/material.dart';
import 'package:movie_platform_app/features/on_bording/widgets/page_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body:PageViewBody(
      ),
    );
  }
}