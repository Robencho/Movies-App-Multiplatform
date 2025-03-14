import 'package:movies_app/domain/repositories/new_repositorie/movie_repositorie.dart';

import '../../../domain/entities/new_movie/movie.dart';
import '../../datasources/movie_remote_datasource.dart';

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
}
