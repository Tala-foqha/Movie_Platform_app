// features/search/presentation/view/search_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_platform_app/core/service/get_it_services.dart';
import 'package:movie_platform_app/features/search/domain/usecase/search_use_case.dart';
import 'package:movie_platform_app/features/search/presentation/manger/search/search_cubit.dart';
import 'package:movie_platform_app/features/search/presentation/view/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static const String routName = "\search-view";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<SearchUseCase>()),
      child: Scaffold(backgroundColor: Colors.black, body: SearchViewBody()),
    );
  }
}
