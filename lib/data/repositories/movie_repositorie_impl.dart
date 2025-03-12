import 'package:movies_app/domain/usecases/movies_usecases.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository{

  final MoviesUseCases moviesUseCases;

  MovieRepositoryImpl(this.moviesUseCases);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return moviesUseCases.getNowPlaying(page: page);
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) {
   return moviesUseCases.getPopular(page: page);
  }
  
  @override
  Future<List<Movie>> getUpComing({int page = 1}) {
    return moviesUseCases.getUpComing(page: page);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return moviesUseCases.getTopRtaed(page: page);
  }
  
  @override
  Future<Movie> getmoviebyId(String id) {
    return moviesUseCases.getmoviebyId(id);
  }
  
  @override
  Future<List<Movie>> searchMovies(String query) {
    return moviesUseCases.searchMovies(query);
  }

}