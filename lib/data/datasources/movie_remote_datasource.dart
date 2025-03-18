import 'package:movies_app/data/models/actor_model.dart';

import '../models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<({List<MovieModel>movies, int totalPages})> getPopularMovies({int page = 1});
  Future<({List<MovieModel>movies, int totalPages})> getTopRated({int page = 1});
  Future<({List<MovieModel>movies, int totalPages})> getUpComing({int page = 1});
  Future<MovieModel> getmoviebyId(String id);
  Future<List<ActorModel>> getMovieCast(String movieId);
}