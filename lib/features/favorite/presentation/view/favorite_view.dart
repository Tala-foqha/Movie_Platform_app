// features/favorite/presentation/view/favorite_view.dart
import 'package:flutter/material.dart';
import 'package:movie_platform_app/features/favorite/presentation/view/widgets/favorite_view_body.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  static const routeName = '/favorites';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: const FavoritesViewBody(),
    );
  }
}