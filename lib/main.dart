// main.dart
import 'package:flutter/material.dart';
import 'package:movie_platform_app/core/service/get_it_services.dart';
import 'package:movie_platform_app/core/helper_function/on_generate_route.dart';
import 'package:movie_platform_app/features/auth/presentetion/view/signin/signin_view.dart';
import 'package:movie_platform_app/features/home/home_view.dart';

void main() {
   setupServiceLocator();
  runApp(const MoviePlatfoem());
}

class MoviePlatfoem extends StatelessWidget {
  const MoviePlatfoem({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
     onGenerateRoute: onGenerateRoute,
     initialRoute: HomeView.routeName,
    );
  }
}