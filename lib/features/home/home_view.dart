// features/home/home_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_platform_app/core/service/get_it_services.dart';
import 'package:movie_platform_app/core/widgets/bottom_navigation_bar.dart';
import 'package:movie_platform_app/features/cart/domain/usecase/cart_use_case.dart';
import 'package:movie_platform_app/features/cart/presentation/manager/cart/cart_cubit.dart';
import 'package:movie_platform_app/features/cart/presentation/view/cart_view.dart';
import 'package:movie_platform_app/features/checkout/domain/usecase/checkout_usecase.dart';
import 'package:movie_platform_app/features/checkout/presentation/manager/checkout/checkout_cubit.dart';
import 'package:movie_platform_app/features/favorite/domain/usecase/favorite_use_case.dart';
import 'package:movie_platform_app/features/favorite/presentation/maneger/favorite/favorite_cubit.dart';
import 'package:movie_platform_app/features/favorite/presentation/view/favorite_view.dart';
import 'package:movie_platform_app/features/movies/domain/use_case/movie_use_case.dart';
import 'package:movie_platform_app/features/movies/presentation/maneger/movie_cubit.dart';
import 'package:movie_platform_app/features/movies/presentation/view/movies_view.dart';

class HomeView extends StatefulWidget {
  final List<String> selectedCategoryNames;

  const HomeView({
    super.key,
    this.selectedCategoryNames = const [],
  });

  static const String routeName = "home";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();

    pages = [
      BlocProvider(
        create: (context) =>
            MovieCubit(
              movieUseCase: getIt.get<MovieUseCase>(),
            )..getMovies(),
        child: MoviesView(
          selectedCategoryNames: widget.selectedCategoryNames,
        ),
      ),

      BlocProvider(
        create: (context) =>
            FavoriteCubit(
              getIt.get<FavoriteUseCase>(),
            )..getUserFav(),
        child: FavoritesView(),
      ),

      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                CartCubit(
                  getIt.get<CartUseCase>(),
                )..getCartMovie(),
          ),
          BlocProvider(
            create: (context) =>
                CheckoutCubit(
                  getIt.get<CheckoutUsecase>(),
                ),
          ),
        ],
        child: CartView(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      backgroundColor: Colors.black,
      bottomNavigationBar: currentIndex == 2
          ? null
          : CustomBottomNavBar(
              currentIndex: currentIndex,
              onTap: (int value) {
                setState(() {
                  currentIndex = value;
                });
              },
            ),
    );
  }
}