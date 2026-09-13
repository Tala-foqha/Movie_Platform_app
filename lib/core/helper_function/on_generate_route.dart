// core/helper_function/on_generate_route.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_platform_app/features/auth/presentetion/manager/forgetpassword/forgetpassword_cubit.dart';
import 'package:movie_platform_app/features/auth/presentetion/view/codeview/code_view.dart';
import 'package:movie_platform_app/features/auth/presentetion/view/resetPassword/request_to_rest_password_view.dart';
import 'package:movie_platform_app/features/auth/presentetion/view/signin/signin_view.dart';
import 'package:movie_platform_app/features/auth/presentetion/view/signup/signup_view.dart';
import 'package:movie_platform_app/features/cart/presentation/view/cart_view.dart';
import 'package:movie_platform_app/features/home/home_view.dart';
import 'package:movie_platform_app/features/movies/data/models/movie_model.dart';
import 'package:movie_platform_app/features/movies/presentation/view/details_view.dart';
import 'package:movie_platform_app/features/movies/presentation/view/movies_view.dart';
import 'package:movie_platform_app/features/on_bording/on_boarding_view.dart';
import 'package:movie_platform_app/features/search/presentation/view/search_view.dart';
import 'package:movie_platform_app/features/splash/splash_view.dart';

Route<dynamic>onGenerateRoute(RouteSettings settings){
  switch(settings.name){
    case SplashView.routeName:
 return MaterialPageRoute(builder: (context)=>SplashView());
  case SigninView.routeName:
 return MaterialPageRoute(settings: settings,builder: (context)=>SigninView());
  case SignupView.routeName: 
 return MaterialPageRoute(builder: (context)=>SignupView());
 case RequestToRestPasswordView.routeName:
 return MaterialPageRoute(builder: (context)=>RequestToRestPasswordView());
 case CodeView.routeName:
 final email=settings.arguments as String;
 return MaterialPageRoute(builder: (context)=>CodeView(email: email));
 
 case HomeView.routeName:
  final selectedCategoryNames =
      settings.arguments as List<String>? ?? [];

  return MaterialPageRoute(
    builder: (context) => HomeView(
      selectedCategoryNames: selectedCategoryNames,
    ),
  );

 case DetailsView.routeName:
 final movie=settings.arguments as MovieModel;
 
 return MaterialPageRoute(builder: (context)=>DetailsView(movies: movie,));

 case CartView.routName:
 return MaterialPageRoute(builder: (context)=>CartView());

 
 case SearchView.routName:
 return MaterialPageRoute(builder: (context)=>SearchView());


 case OnBoardingView.onBording:
 return MaterialPageRoute(builder: (context)=>OnBoardingView());
 
 case MoviesView.routeName:
 return MaterialPageRoute(builder: (context)=>MoviesView());
  default: 
   return MaterialPageRoute(builder: (context)=>Scaffold());
  }}