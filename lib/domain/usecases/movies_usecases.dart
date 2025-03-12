import 'package:movies_app/domain/entities/movie.dart';

abstract class MoviesUseCases{
  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> getPopular({int page = 1});
  Future<List<Movie>> getUpComing({int page = 1});
  Future<List<Movie>> getTopRtaed({int page = 1});
  Future<Movie> getmoviebyId(String id);
  Future<List<Movie>> searchMovies(String query);
}