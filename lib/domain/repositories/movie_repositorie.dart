
import 'package:movies_app/domain/entities/actor.dart';
import 'package:movies_app/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<({List<Movie>movies, int totalPages})> getPopularMovies({int page = 1});
  Future<({List<Movie>movies, int totalPages})> getTopRated({int page = 1});
  Future<({List<Movie>movies, int totalPages})> getUpComing({int page = 1});

  // get movie detail
  Future<Movie> getmoviebyId(String id);

  // Get Movie Actors
  Future<List<Actor>> getMovieCast(String movieId);

  // Search movies
  Future<List<Movie>> searchMovies(String query);
}