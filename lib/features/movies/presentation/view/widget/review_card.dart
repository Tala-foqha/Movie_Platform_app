// features/movies/presentation/view/widget/review_card.dart
import 'package:flutter/material.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';
import 'package:movie_platform_app/features/movies/data/models/review_model.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.review,
  });

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.25),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // =================================================
          // User + Rating
          // =================================================

          Row(
            children: [
              Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  color: const Color(0xffff4538),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 22,
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Text(
                  review.userName ?? "User",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.semiBold16.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(width: 8),

              _ratingStars(
               5 ?? 0,
              ),
            ],
          ),

          const SizedBox(height: 12),

          // =================================================
          // Comment
          // =================================================

          Text(
            review.comment ?? "",
            style: AppStyles.regular14.copyWith(
              color: Colors.white70,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  // =================================================
  // Rating Stars
  // =================================================

  Widget _ratingStars(int rating) {
    final safeRating = rating.clamp(0, 5);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) {
          return Icon(
            index < safeRating
                ? Icons.star
                : Icons.star_border,
            color: const Color(0xffffc107),
            size: 15,
          );
        },
      ),
    );
  }
}