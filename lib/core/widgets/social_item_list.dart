// core/widgets/social_item_list.dart
import 'package:flutter/material.dart';
import 'package:movie_platform_app/core/widgets/social_item.dart';

class SocialItemList extends StatelessWidget {
  const SocialItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialItem(iconPath: "assets/SVG/facebook.svg"),
                SizedBox(width: 13,),
        SocialItem(iconPath: "assets/SVG/google.svg"),
        SizedBox(width: 13,),
       SocialItem(iconPath: "assets/SVG/apple icon.svg"),
      ],
    );
  }
}