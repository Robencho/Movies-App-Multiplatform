import 'package:dio/dio.dart';
import 'package:movies_app/core/constants/environment.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/data/mappers/movie_maper.dart';
import 'package:movies_app/data/models/moviedb/movie_db_response.dart';
import 'package:movies_app/data/models/moviedb/movie_details.dart';

import '../../domain/usecases/movies_usecases.dart';

class MoviedbDatasource extends MoviesUseCases {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX'
      }));

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieDbResponse = MovieDbResponse.fromJson(json);

    final List<Movie> movies = movieDbResponse.results
        .where((movieDb) => movieDb.posterPath != 'no-poster')
        .map((movieDb) => MovieMapper.movieDBToEntity(movieDb))
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpComing({int page = 1}) async {
    final response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRtaed({int page = 1}) async {
    final response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
  }
  
  @override
  Future<Movie> getmoviebyId(String id)async {
    final response = await dio.get('/movie/$id');

    if(response.statusCode != 200) throw Exception('Movie por id: $id not found.');
    final movieDetails = MovieDetails.fromJson(response.data);

    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);

    return movie;
  }
  
  @override
  Future<List<Movie>> searchMovies(String query) async {
    if(query.isEmpty) return [];
    final response = await dio.get(
      '/search/movie',
      queryParameters: {
        'query':query
      });

      return _jsonToMovies(response.data);
  }
}
