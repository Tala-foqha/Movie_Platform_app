// features/movies/presentation/view/widget/all_review_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_platform_app/core/utils/app_styles.dart';
import 'package:movie_platform_app/features/movies/presentation/maneger/reviews/reviews_cubit.dart';
import 'package:movie_platform_app/features/movies/presentation/view/widget/review_card.dart';

class AllReviewsView extends StatelessWidget {
  const AllReviewsView({
    super.key,
    required this.movieId,
  });

  final int movieId;

  static const routeName = '/allReviews';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "All Reviews",
          style: AppStyles.semiBold16.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<ReviewsCubit, ReviewsState>(
        builder: (context, state) {
          // =================================================
          // Loading
          // =================================================

          if (state is ReviewsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xffff4538),
              ),
            );
          }

          // =================================================
          // Success
          // =================================================

          if (state is ReviewsSuccess) {
            final reviews = state.reviews;

            if (reviews.isEmpty) {
              return Center(
                child: Text(
                  "No reviews yet.",
                  style: AppStyles.regular14.copyWith(
                    color: Colors.white60,
                  ),
                ),
              );
            }

            return ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: reviews.length,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 12);
              },
              itemBuilder: (context, index) {
                return ReviewCard(
                  review: reviews[index],
                );
              },
            );
          }

          // =================================================
          // Failure
          // =================================================

          if (state is ReviewsFailure) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  state.message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}