// main.dart
import 'package:flutter/material.dart';
import 'package:movie_platform_app/core/helper_function/shared_pref_helper.dart';
import 'package:movie_platform_app/core/service/get_it_services.dart';
import 'package:movie_platform_app/core/helper_function/on_generate_route.dart';
import 'package:movie_platform_app/core/deep_link/deep_link_handler.dart';
import 'package:movie_platform_app/features/home/home_view.dart';
import 'package:movie_platform_app/features/splash/splash_view.dart';

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefHelper.init();
  setupServiceLocator();

  runApp(const MoviePlatfoem());
}

class MoviePlatfoem extends StatelessWidget {
  const MoviePlatfoem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      navigatorKey: navigatorKey,

      onGenerateRoute: onGenerateRoute,

      initialRoute: SplashView.routeName,

      builder: (context, child) {
        return DeepLinkHandler(
          child: child ?? const SizedBox(),
        );
      },
    );
  }
}