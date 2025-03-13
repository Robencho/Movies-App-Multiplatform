import 'package:movies_app/domain/entities/new_movie/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getPopularMovies();
}