// features/on_bording/widgets/page_view_items.dart

import 'package:flutter/material.dart';
import 'package:movie_platform_app/features/on_bording/widgets/container_widget.dart';
import 'package:movie_platform_app/features/on_bording/widgets/first_on_boarding_view.dart';
import 'package:movie_platform_app/features/on_bording/widgets/second_page_view_item.dart';

class PageViewItems extends StatefulWidget {
  const PageViewItems({super.key});

  @override
  State<PageViewItems> createState() => _PageViewItemsState();
}

class _PageViewItemsState extends State<PageViewItems> {
  final PageController pageController = PageController();

  int currentPage = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // =========================
        // PAGE VIEW
        // =========================

        Expanded(
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: [
              FirstOnBoardingView(pageController: pageController,),
              const SecondPageViewItem(),
            ],
          ),
        ),

        const SizedBox(height: 10),

        // =========================
        // PAGE INDICATORS
        // =========================

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContainerWidget(
              isActive: currentPage == 0,
            ),

            const SizedBox(width: 5),

            ContainerWidget(
              isActive: currentPage == 1,
            ),
          ],
        ),
      ],
    );
  }
}