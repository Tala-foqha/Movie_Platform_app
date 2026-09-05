// features/home/home_view.dart
import 'package:flutter/material.dart';
import 'package:movie_platform_app/core/widgets/bottom_navigation_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
static const String routeName="home";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: CustomBottomNavBar(currentIndex:currentIndex

       , onTap: (int value) { 
        setState(() {
          currentIndex=value;
        });

        },),
    );
  }
}