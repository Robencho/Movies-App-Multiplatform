import 'package:movies_app/domain/usecases/movie_usecase.dart';

import '../entities/new_movie/movie.dart';
import '../repositories/new_repositorie/movie_repositorie.dart';

class GetPopularMoviesUseCase implements MovieUsecase {
  final MovieRepository repository;

  GetPopularMoviesUseCase(this.repository);

  @override
  Future<List<Movie>> execute({int page = 1}) async {
    return await repository.getPopularMovies(page: page);
  }
}