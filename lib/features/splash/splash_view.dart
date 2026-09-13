// features/splash/splash_view.dart
import 'package:flutter/material.dart';

import 'package:movie_platform_app/features/on_bording/on_boarding_view.dart';
import 'package:movie_platform_app/features/splash/widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
 static const  String routeName = '/splash';


  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    executeNavigation();
  }

 Future<void> executeNavigation() async {
  await Future.delayed(
    const Duration(seconds: 3),
  );

  if (!mounted) return;

  Navigator.pushReplacementNamed(
    context,
    OnBoardingView.onBording,
  );
}
  // bool isOnBordingViewSeen =
  //     SharedPrefHelper.getBool(
  //       SharedPrefKeys.isOnBoardingViewSeen,
  //     );

  // await Future.delayed(
  //   const Duration(seconds: 3),
  // );

  // if (!mounted) return;

  // if (!isOnBordingViewSeen) {
  //   Navigator.pushReplacementNamed(
  //     context,
  //     OnBoardingView.onBording,
  //   );
  //   return;
  // }

  // final accessToken = SharedPrefHelper.getString(
  //   SharedPrefKeys.userTokens,
  // );

  // if (accessToken.isNotEmpty) {
  //   Navigator.pushReplacementNamed(
  //     context,
  //     OnBoardingView.onBording,
  //   );
  // } else {
  //   Navigator.pushReplacementNamed(
  //     context,
  //     SigninView.routeName,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEB2F3D),
     body:SplashViewBody(
      ),
    );
  }

}
