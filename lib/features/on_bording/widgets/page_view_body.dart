// features/on_bording/widgets/page_view_body.dart
import 'package:flutter/material.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';

class PageViewBody extends StatelessWidget {
  const PageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
     Row(
      children: [
        Text("Skip",style:AppStyles.medium15)
      ],
     )
      ]
    );
  }
}