// features/movies/presentation/view/widget/review_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_platform_app/core/utils/app_styles.dart';

import 'package:movie_platform_app/features/movies/data/models/review_request.dart';

import 'package:movie_platform_app/features/movies/presentation/maneger/reviews/reviews_cubit.dart';
import 'package:movie_platform_app/features/movies/presentation/view/widget/add_review_botoom_sheet.dart';
import 'package:movie_platform_app/features/movies/presentation/view/widget/all_review_view.dart';
import 'package:movie_platform_app/features/movies/presentation/view/widget/review_card.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocConsumer<ReviewsCubit, ReviewsState>(
        listener: (context, state) {
          // =================================================
          // Add Review Success
          // =================================================

          if (state is AddReviewSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Review added successfully!"),
                backgroundColor: Color(0xff1A1A1A),
              ),
            );

            // Refresh reviews after adding
            context.read<ReviewsCubit>().getMovieReviews(movieId);
          }

          // =================================================
          // Add Review Failure
          // =================================================

          if (state is AddReviewFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: const Color(0xff1A1A1A),
              ),
            );
          }
        },
        builder: (context, state) {
          // =================================================
          // Loading
          // =================================================

          if (state is ReviewsLoading) {
            return _buildLoadingContainer();
          }

          // =================================================
          // Success
          // =================================================

          if (state is ReviewsSuccess) {
            return _buildReviewsContainer(context, state);
          }

          // =================================================
          // Failure
          // =================================================

          if (state is ReviewsFailure) {
            return _buildFailureContainer(state.message);
          }

          return const SizedBox();
        },
      ),
    );
  }

  // =================================================
  // Reviews Container
  // =================================================

  Widget _buildReviewsContainer(BuildContext context, ReviewsSuccess state) {
    final reviews = state.reviews;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xff1A1A1A),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // =================================================
          // Header
          // =================================================
          Row(
            children: [
              Text(
                "Reviews",
                style: AppStyles.semiBold16.copyWith(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),

              const SizedBox(width: 8),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "${reviews.length}",
                  style: AppStyles.regular14.copyWith(color: Colors.white70),
                ),
              ),

              const Spacer(),

              // =================================================
              // Add Review Button
              // =================================================
              GestureDetector(
                onTap: () {
                  _onAddReviewPressed(context, state);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffff4538).withOpacity(0.12),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.rate_review_outlined,
                        color: Color(0xffff4538),
                        size: 16,
                      ),

                      const SizedBox(width: 5),

                      Text(
                        "Add Review",
                        style: AppStyles.regular14.copyWith(
                          color: const Color(0xffff4538),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // =================================================
          // Empty
          // =================================================
          if (reviews.isEmpty) _buildEmptyReviews(),

          // =================================================
          // Reviews
          // =================================================
          if (reviews.isNotEmpty)
            ...reviews.take(2).map((review) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ReviewCard(review: review),
              );
            }),

          // =================================================
          // See All Reviews
          // =================================================
          if (reviews.length > 2)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return BlocProvider.value(
                            value: context.read<ReviewsCubit>(),
                            child: AllReviewsView(movieId: movieId),
                          );
                        },
                      ),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "See All Reviews",
                        style: AppStyles.regular14.copyWith(
                          color: const Color(0xffff4538),
                        ),
                      ),

                      const SizedBox(width: 5),

                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xffff4538),
                        size: 13,
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // =================================================
  // Empty Reviews
  // =================================================

  Widget _buildEmptyReviews() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.rate_review_outlined,
                color: Colors.white38,
                size: 24,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "No reviews yet",
              style: AppStyles.regular14.copyWith(color: Colors.white60),
            ),

            const SizedBox(height: 4),

            Text(
              "Be the first one to review this movie",
              textAlign: TextAlign.center,
              style: AppStyles.regular14.copyWith(color: Colors.white38),
            ),
          ],
        ),
      ),
    );
  }

  // =================================================
  // Loading
  // =================================================

  Widget _buildLoadingContainer() {
    return Container(
      height: 180,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xff1A1A1A),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _loadingBox(width: 120, height: 20),

          const SizedBox(height: 20),

          _loadingBox(width: double.infinity, height: 55),

          const SizedBox(height: 10),

          _loadingBox(width: double.infinity, height: 55),
        ],
      ),
    );
  }

  Widget _loadingBox({required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.25),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  // =================================================
  // Failure
  // =================================================

  Widget _buildFailureContainer(String message) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xff1A1A1A),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Text(message, style: const TextStyle(color: Colors.red)),
    );
  }

  // =================================================
  // Add Review Logic
  // =================================================
void _onAddReviewPressed(
  BuildContext context,
  ReviewsSuccess state,
) {
  // Already Reviewed
  if (state.hasReviewed == true) {
    _showAlreadyReviewedDialog(context);
    return;
  }

  // Not Watched
  if (state.canReview != true) {
    _showWatchMovieDialog(context);
    return;
  }

  // خذي الـ Cubit من الـ context الصحيح
  final reviewsCubit = context.read<ReviewsCubit>();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return BlocProvider.value(
        value: reviewsCubit,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: AddReviewBottomSheet(
            movieId: movieId,
          ),
        ),
      );
    },
  );
}

  // =================================================
  // Already Reviewed Dialog
  // =================================================

  void _showAlreadyReviewedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xff1A1A1A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          icon: const Icon(
            Icons.check_circle_outline,
            color: Color(0xffff4538),
            size: 40,
          ),
          title: Text(
            "Already Reviewed",
            style: AppStyles.semiBold16.copyWith(color: Colors.white),
          ),
          content: Text(
            "You have already reviewed this movie. You can only add one review.",
            textAlign: TextAlign.center,
            style: AppStyles.regular14.copyWith(
              color: Colors.white60,
              height: 1.5,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "OK",
                style: TextStyle(color: Color(0xffff4538)),
              ),
            ),
          ],
        );
      },
    );
  }

  // =================================================
  // Watch Movie Dialog
  // =================================================

  void _showWatchMovieDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: const Color(0xff1A1A1A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          icon: const Icon(
            Icons.movie_outlined,
            color: Color(0xffff4538),
            size: 40,
          ),
          title: Text(
            "Watch the Movie First",
            textAlign: TextAlign.center,
            style: AppStyles.semiBold16.copyWith(color: Colors.white),
          ),
          content: Text(
            "You need to watch this movie before you can write a review.",
            textAlign: TextAlign.center,
            style: AppStyles.regular14.copyWith(
              color: Colors.white60,
              height: 1.5,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.white60),
              ),
            ),
          ],
        );
      },
    );
  }
}
