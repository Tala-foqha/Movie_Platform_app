// core/widgets/social_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialItem extends StatelessWidget {
  const SocialItem({super.key, required this.iconPath});
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width:105,
      // margin: EdgeInsets.symmetric(horizontal: 42,vertical: 16),
    
      decoration: BoxDecoration(
        color: Color(0xff1E1E1E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xff575757)),
      ),
      child: Center(
        child: SvgPicture.asset(iconPath),
      ),
    
    )
    ;
  }
}