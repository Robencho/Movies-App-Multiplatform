import '../entities/new_movie/movie.dart';
import '../repositories/new_repositorie/movie_repositorie.dart';

class GetPopularMoviesUseCase {
  final MovieRepository repository;

  GetPopularMoviesUseCase(this.repository);

  Future<List<Movie>> execute() async {
    return await repository.getPopularMovies();
  }
}