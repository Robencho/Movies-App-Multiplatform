import 'package:movies_app/domain/entities/new_movie/movie.dart';

abstract class MovieRepository {
  //Future<List<Movie>> getNowPlaying();
  Future<List<Movie>> getPopularMovies({int page = 1});
  Future<List<Movie>> getTopRated({int page = 1});
  Future<List<Movie>> getUpComing({int page = 1});
  Future<Movie> getmoviebyId(String id);
  /*Future<List<Movie>> getTopRated();
  Future<List<Movie>> getmovieById();
  Future<List<Movie>> searchmovies();*/
}