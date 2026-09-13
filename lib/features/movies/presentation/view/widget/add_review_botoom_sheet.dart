// features/movies/presentation/view/widget/add_review_botoom_sheet.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_platform_app/core/utils/app_styles.dart';
import 'package:movie_platform_app/features/movies/data/models/review_request.dart';
import 'package:movie_platform_app/features/movies/presentation/maneger/reviews/reviews_cubit.dart';

class AddReviewBottomSheet extends StatefulWidget {
  const AddReviewBottomSheet({
    super.key,
    required this.movieId,
  });

  final int movieId;

  @override
  State<AddReviewBottomSheet> createState() =>
      _AddReviewBottomSheetState();
}

class _AddReviewBottomSheetState
    extends State<AddReviewBottomSheet> {
  final TextEditingController commentController =
      TextEditingController();

  int selectedRating = 0;

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(
          24,
          20,
          24,
          24,
        ),
        decoration: const BoxDecoration(
          color: Color(0xff1A1A1A),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =================================================
            // Handle
            // =================================================

            Center(
              child: Container(
                height: 4,
                width: 45,
                decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 22),

            // =================================================
            // Title
            // =================================================

            Text(
              "Add Review",
              style: AppStyles.semiBold16.copyWith(
                color: Colors.white,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              "Share your opinion about this movie",
              style: AppStyles.regular14.copyWith(
                color: Colors.white60,
              ),
            ),

            const SizedBox(height: 20),

            // =================================================
            // Rating
            // =================================================

            Text(
              "Your Rating",
              style: AppStyles.semiBold16.copyWith(
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: List.generate(
                5,
                (index) {
                  final starNumber = index + 1;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedRating = starNumber;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 8,
                      ),
                      child: Icon(
                        starNumber <= selectedRating
                            ? Icons.star
                            : Icons.star_border,
                        color: const Color(0xffffc107),
                        size: 30,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // =================================================
            // Comment
            // =================================================

            Text(
              "Your Review",
              style: AppStyles.semiBold16.copyWith(
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: commentController,
              maxLines: 4,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                hintText: "Write your review...",
                hintStyle: const TextStyle(
                  color: Colors.white38,
                ),
                filled: true,
                fillColor: Colors.black,
                contentPadding: const EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // =================================================
            // Buttons
            // =================================================

            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(
                          color: Colors.white24,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text(
                        "Cancel",
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _submitReview,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xffff4538),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text(
                        "Submit",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // =================================================
  // Submit
  // =================================================

  void _submitReview() {
    final comment = commentController.text.trim();

    if (selectedRating == 0) {
      _showMessage(
        "Please select a rating.",
      );
      return;
    }

    if (comment.isEmpty) {
      _showMessage(
        "Please write your review.",
      );
      return;
    }

    final request = ReviewRequest(
      movieId: widget.movieId,
      comment: comment,
     
    );

    context.read<ReviewsCubit>().addReview(
          request,
          widget.movieId,
        );

    Navigator.pop(context);
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xff1A1A1A),
      ),
    );
  }
}