// features/on_bording/on_boarding_view.dart
import 'package:flutter/material.dart';
import 'package:movie_platform_app/features/on_bording/widgets/page_view_items.dart' show PageViewItems;

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const String onBording="\on-bording";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body:PageViewItems(
      ),
    );
  }
}