// core/widgets/bottom_navigation_bar.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_platform_app/core/utils/app_colors.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff333333),
        borderRadius: BorderRadius.circular(38),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildItem(
            index: 0,
            image: "assets/SVG/movie.svg",
            title: 'Movies',
          ),
          _buildItem(
            index: 1,
            image: 'assets/SVG/wishes.svg',
            title: 'wish',
          ),
          _buildItem(
            index: 2,
            image: 'assets/SVG/cart.svg',
            title: 'Cart',
          ),
          _buildItem(
            index: 3,
            image: 'assets/SVG/more_vert.svg',
            title: 'More',
          ),
        ],
      ),
    );
  }

  Widget _buildItem({
    required int index,
    required String title,
    required String image,
  }) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,

        // Selected = 113 x 58
        // Unselected = 58 x 58
        width: isSelected ? 113 : 58,
        height: 58,

        // padding: const EdgeInsets.symmetric(
        //   horizontal: 15,
        // ),

        decoration: BoxDecoration(
          color: isSelected
              ? AppColrs.primaryColor
              : const Color(0xff5A5A5A),
          borderRadius: BorderRadius.circular(51),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              image,
              
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),

            if (isSelected && title.isNotEmpty) ...[
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.medium15.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}