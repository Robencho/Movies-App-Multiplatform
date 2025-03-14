import '../models/new_movie/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getPopularMovies({int page = 1});
  Future<List<MovieModel>> getTopRated({int page = 1});
  Future<List<MovieModel>> getUpComing({int page = 1});
  Future<MovieModel> getmoviebyId(String id);
}