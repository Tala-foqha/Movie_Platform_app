// features/on_bording/widgets/second_page_view_item.dart

import 'package:flutter/material.dart';
import 'package:movie_platform_app/core/helper_function/constants.dart';
import 'package:movie_platform_app/core/helper_function/shared_pref_helper.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';
import 'package:movie_platform_app/core/widgets/custom_button.dart';
import 'package:movie_platform_app/features/auth/presentetion/view/signin/signin_view.dart';
import 'package:movie_platform_app/features/home/home_view.dart';
import 'package:movie_platform_app/features/movies/presentation/view/movies_view.dart';

class SecondPageViewItem extends StatefulWidget {
  const SecondPageViewItem({super.key});

  @override
  State<SecondPageViewItem> createState() => _SecondPageViewItemState();
}

class _SecondPageViewItemState extends State<SecondPageViewItem> {
  final List<Map<String, dynamic>> categories = [
    {
      'id': 1,
      'name': 'Action',
    },
    {
      'id': 2,
      'name': 'Adventure',
    },
    {
      'id': 3,
      'name': 'Drama',
    },
    {
      'id': 4,
      'name': 'Comedy',
    },
    {
      'id': 5,
      'name': 'Crime',
    },
    {
      'id': 6,
      'name': 'Documentary',
    },
    {
      'id': 7,
      'name': 'Sports',
    },
    {
      'id': 8,
      'name': 'Fantasy',
    },
    {
      'id': 9,
      'name': 'Horror',
    },
    {
      'id': 10,
      'name': 'Music',
    },
    {
      'id': 11,
      'name': 'Western',
    },
    {
      'id': 12,
      'name': 'Thriller',
    },
    {
      'id': 13,
      'name': 'Sci-Fi',
    },
  ];


  // الـ IDs اللي اختارها المستخدم
  final Set<String> selectedCategoryName = {};

  void _selectCategory(String categoryName) {
    setState(() {
      if (selectedCategoryName.contains(categoryName)) {
        selectedCategoryName.remove(categoryName);
      } else {
        selectedCategoryName.add(categoryName);
      }
    });
  }

  void _goToHome() {
    Navigator.pushReplacementNamed(
      context,
      HomeView.routeName,
      arguments: selectedCategoryName.toList(),
    );
  }
  void _goToNext() async{
 await SharedPrefHelper.setData(
    SharedPrefKeys.isOnBoardingViewSeen,
    true,
  );

  Navigator.pushReplacementNamed(
    context,
    SigninView.routeName,
    arguments: selectedCategoryName.toList(),
  );
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            // =========================
            // SKIP
            // =========================

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    // فاضية = اعرض كل الأفلام
                    Navigator.pushReplacementNamed(
                      context,
                      HomeView.routeName,
                      arguments:<String> [],
                    );
                  },
                  child: Text(
                    "Skip",
                    style: AppStyles.medium15,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 164),

            // =========================
            // GENRES
            // =========================

            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: categories.map((category) {
                // final int categoryId = category['id'];
                final String categoryName = category['name'];

                final bool isSelected =
                    selectedCategoryName.contains(categoryName);

                return GestureDetector(
                  onTap: () {
                    _selectCategory(categoryName);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 9,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xffFF3B30)
                          : const Color(0xff454545),
                      borderRadius: BorderRadius.circular(6),
                      border: isSelected
                          ? Border.all(
                              color: const Color(0xffff5a50),
                              width: 1,
                            )
                          : null,
                    ),
                    child: Text(
                      categoryName,
                      style: AppStyles.medium15.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            // =========================
            // TEXT
            // =========================

            const SizedBox(height: 260),

            Text(
              "Select the genres you\nlike to watch",
              textAlign: TextAlign.center,
              style: AppStyles.medium22.copyWith(
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 50),

            // =========================
            // NEXT
            // =========================

            CustomButton(
              text: "Next",
              onTap: _goToNext,
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}