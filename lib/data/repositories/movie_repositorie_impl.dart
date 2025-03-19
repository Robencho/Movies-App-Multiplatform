import 'package:movies_app/domain/entities/actor.dart';
import 'package:movies_app/domain/repositories/movie_repositorie.dart';

import '../../domain/entities/movie.dart';
import '../datasources/movie_remote_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<({List<Movie>movies, int totalPages})> getPopularMovies({int page = 1}) async {
    final result = await remoteDataSource.getPopularMovies(page: page);
    return (
      movies: result.movies.map((model) => model.toEntity()).toList(),
      totalPages: result.totalPages
    );
  }

  @override
  Future<({List<Movie>movies, int totalPages})> getTopRated({int page = 1}) async {
    final result = await remoteDataSource.getTopRated(page: page);
    return (
      movies: result.movies.map((model) => model.toEntity()).toList(),
      totalPages: result.totalPages
    );
  }

  @override
  Future<({List<Movie>movies, int totalPages})> getUpComing({int page = 1}) async {
    final result = await remoteDataSource.getUpComing(page: page);
    return (
      movies:result.movies.map((model) => model.toEntity()).toList(),
      totalPages: result.totalPages
    );
  }
  
  @override
  Future<Movie> getmoviebyId(String id)async {
    final moviedetail = await remoteDataSource.getmoviebyId(id);
    return moviedetail.toEntity();
  }

  @override
  Future<List<Actor>> getMovieCast(String movieId) async {
    final actors = await remoteDataSource.getMovieCast(movieId);
    return actors.map((model) => model.toEntity()).toList();
  }
  
  @override
  Future<List<Movie>> searchMovies(String query)async {
      final models = await remoteDataSource.searchMovies(query);
      return models.map((model)=> model.toEntity()).toList();
  }
}
