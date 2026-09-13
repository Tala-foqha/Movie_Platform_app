// features/search/presentation/manger/search/search_state.dart
part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}
class SearchLoading extends SearchState {}
class SearchFailure extends SearchState {
 final String message;

  SearchFailure({required this.message});


}
class SearchSuccess extends SearchState {
  final List<MovieModel>movies;

  SearchSuccess({required this.movies});

}





