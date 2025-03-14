import 'package:movies_app/domain/repositories/new_repositorie/movie_repositorie.dart';

import '../../../domain/entities/new_movie/movie.dart';
import '../../datasources/movie_remote_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    final movies = await remoteDataSource.getPopularMovies(page: page);
    return movies.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final movies = await remoteDataSource.getTopRated(page: page);
    return movies.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<Movie>> getUpComing({int page = 1}) async {
    final movies = await remoteDataSource.getUpComing(page: page);
    return movies.map((model) => model.toEntity()).toList();
  }
  
  @override
  Future<Movie> getmoviebyId(String id)async {
    final moviedetail = await remoteDataSource.getmoviebyId(id);
    return moviedetail.toEntity();
  }
}
