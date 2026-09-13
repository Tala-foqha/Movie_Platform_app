// features/on_bording/widgets/first_on_boarding_view.dart

import 'package:flutter/material.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';
import 'package:movie_platform_app/core/widgets/custom_button.dart';
import 'package:movie_platform_app/features/on_bording/widgets/second_page_view_item.dart';

class FirstOnBoardingView extends StatelessWidget {
  FirstOnBoardingView({super.key, required this.pageController});
  final PageController pageController;

  final List<String> firstImages = [
    "assets/images/Rectangle 66 (1).png",
    "assets/images/Rectangle 67.png",
    "assets/images/Rectangle 68.png",
    "assets/images/Rectangle 69.png",
  ];

  final List<String> secondImages = [
     "assets/images/Rectangle 70.png",
    "assets/images/Rectangle 71.png",
    "assets/images/Rectangle 72.png",
    "assets/images/Rectangle 73.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // =========================
          // SKIP
          // =========================
      
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Skip",
                  style: AppStyles.medium15,
                ),
              ],
            ),
          ),
      
          const SizedBox(height: 41),
      
          // =========================
          // MOVIE IMAGES
          // =========================
      
          SizedBox(
            width: double.infinity,
            height: 375,
            child: ClipRect(
              child: Stack(
                children: [
                  // -------------------------
                  // FIRST ROW
                  // -------------------------
      
                  Positioned(
                    left: -50,
                    top: 0,
                    child: _movieImage(
                      firstImages[0],
                    ),
                  ),
      
                  Positioned(
                    left: 88,
                    top: 0,
                    child: _movieImage(
                      firstImages[1],
                    ),
                  ),
      
                  Positioned(
                    left: 231,
                    top: 0,
                    child: _movieImage(
                      firstImages[2],
                    ),
                  ),
      
                  // آخر صورة
                  // يظهر منها جزء فقط من الطرف
                  Positioned(
                    left: 400,
                    top: 0,
                    child: _movieImage(
                      firstImages[3],
                    ),
                  ),
      
                  // -------------------------
                  // SECOND ROW
                  // -------------------------
      
                  Positioned(
                    left: -90,
                    top: 193,
                    child: _movieImage(
                      secondImages[0],
                    ),
                  ),
      
                  Positioned(
                    left: 53,
                    top: 193,
                    child: _movieImage(
                      secondImages[1],
                    ),
                  ),
      
                  Positioned(
                    left: 196,
                    top: 193,
                    child: _movieImage(
                      secondImages[2],
                    ),
                  ),
      
                  Positioned(
                    left: 339,
                    top: 193,
                    child: _movieImage(
                      secondImages[3],
                    ),
                  ),
                ],
              ),
            ),
          ),
      
          // =========================
          // SPACE
          // =========================
      
          const SizedBox(height: 98),
      
          // =========================
          // TEXT
          // =========================
      
          Text(
            "Tell us about your\nfavorite movie genres",
            textAlign: TextAlign.center,
            style: AppStyles.medium22.copyWith(
              color: Colors.white,
            ),
          ),
      
          // =========================
          // SPACE
          // =========================
      
          const SizedBox(height: 144),
      
          // =========================
          // NEXT BUTTON
          // =========================
      
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: CustomButton(
              text: "Next",
              onTap: () {
              pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
              },
            ),
          ),
          SizedBox(height: 21,),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     ContainerWidget(),
          //     SizedBox(width: 5,),
          //                   ContainerWidget(),


          //   ],
          // )
        ],
      ),
    );
  }

  // =========================
  // MOVIE IMAGE
  // =========================

  Widget _movieImage(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: Image.asset(
        image,
        width: 133,
        height: 182,
        fit: BoxFit.cover,
      ),
    );
  }
}