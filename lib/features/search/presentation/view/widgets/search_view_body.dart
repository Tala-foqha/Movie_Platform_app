// features/search/presentation/view/widgets/search_view_body.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';
import 'package:movie_platform_app/features/search/presentation/manger/search/search_cubit.dart';
import 'package:movie_platform_app/features/search/presentation/view/widgets/movie_search_item_grid_view.dart';
import 'package:movie_platform_app/features/search/presentation/view/widgets/recent_movie_grid_view.dart';
import 'package:movie_platform_app/features/search/presentation/view/widgets/search_header_widget.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchCubit>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchHeaderWidget(),

            const SizedBox(height: 20),

            ValueListenableBuilder<TextEditingValue>(
              valueListenable: searchCubit.searchController,
              builder: (context, value, child) {
                final isSearching = value.text.trim().isNotEmpty;

                return Text(
                  isSearching
                      ? "Search Results"
                      : "Recent Searches",
                  style: AppStyles.semiBold16,
                );
              },
            ),

            const SizedBox(height: 15),

            Expanded(
              child: BlocConsumer<SearchCubit, SearchState>(
                listener: (context, state) {
                  if (state is SearchFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  final isSearching = searchCubit
                      .searchController
                      .text
                      .trim()
                      .isNotEmpty;

                  // البحث فاضي → عرض Recent Searches
                  if (!isSearching) {
                    return RecentMoviesGridView(
                      movies: searchCubit.recentMovies,
                    );
                  }

                  // أثناء البحث
                  if (state is SearchLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  // نتائج البحث
                  if (state is SearchSuccess) {
                    return MovieSearchItemsGridView(
                      movie: state.movies,
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}