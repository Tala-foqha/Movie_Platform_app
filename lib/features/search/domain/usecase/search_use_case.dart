// features/search/domain/usecase/search_use_case.dart
import 'package:dart_either/dart_either.dart';
import 'package:movie_platform_app/core/networking/failure.dart';
import 'package:movie_platform_app/features/movies/data/models/movie_model.dart';
import 'package:movie_platform_app/features/search/domain/repo/search_repo.dart';

class SearchUseCase extends UseCase <List<MovieModel>, String> {
 final  SearchRepo searchRepo;

  SearchUseCase({required this.searchRepo});
  @override
  Future<Either<Failure, List<MovieModel>>> call(param) {
    return searchRepo.serchMovie(param);
  }
  

}



abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call(Param param);
}

class NoParam {}