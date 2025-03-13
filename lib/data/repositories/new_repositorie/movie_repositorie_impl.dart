import 'package:movies_app/data/datasources/movie_remote_data_source.dart';
import 'package:movies_app/domain/repositories/new_repositorie/movie_repositorie.dart';

import '../../../domain/entities/new_movie/movie.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Movie>> getPopularMovies() async {
    final movies = await remoteDataSource.getPopularMovies();
    return movies.map((model) => model.toEntity()).toList();
  }
}