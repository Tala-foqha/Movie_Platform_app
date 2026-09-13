// features/movies/presentation/view/widget/search_and_profile_widget.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchAndProfileWidget extends StatelessWidget {
  const SearchAndProfileWidget({
    super.key, required this.imagePath,
  });
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Color(0xff303030)
      ),
      child: Center(child: SvgPicture.asset(imagePath)),
    );
  }
}