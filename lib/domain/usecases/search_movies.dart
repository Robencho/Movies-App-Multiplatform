import '../entities/movie.dart';
import '../repositories/movie_repositorie.dart';

class SearchMoviesUseCase {
  final MovieRepository repository;

  SearchMoviesUseCase(this.repository);

  Future<List<Movie>> execute(String query) async {
    return await repository.searchMovies(query);
  }
}