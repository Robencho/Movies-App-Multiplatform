import 'package:dio/dio.dart';
import '../models/actor_model.dart';
import '../models/movie_model.dart';
import 'movie_remote_datasource.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio;

  MovieRemoteDataSourceImpl({required this.dio});

  @override
  Future<({List<MovieModel> movies, int totalPages})> getPopularMovies(
      {int page = 1}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {'page': page});
    final data = response.data['results'] as List;
    final dataFilter = data
        .where((movie) =>
            movie['poster_path'] != null && movie['overview'].isNotEmpty)
        .map((json) => MovieModel.fromJson(json))
        .toList();

    final totalPages = response.data['total_pages'] as int;
    return (
      movies: dataFilter,
      totalPages: totalPages,
    );
  }

  @override
  Future<({List<MovieModel> movies, int totalPages})> getTopRated(
      {int page = 1}) async {
    final response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});
    final data = response.data['results'] as List;
    final dataFilter = data
        .where((movie) =>
            movie['poster_path'] != null && movie['overview'].isNotEmpty)
        .map((json) => MovieModel.fromJson(json))
        .toList();
    final totalPages = response.data['total_pages'] as int;
    return (
      movies: dataFilter,
      totalPages: totalPages,
    );
  }

  @override
  Future<({List<MovieModel> movies, int totalPages})> getUpComing(
      {int page = 1}) async {
    final response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});
    final data = response.data['results'] as List;
    final dataFilter = data
        .where((movie) =>
            movie['poster_path'] != null && movie['overview'].isNotEmpty)
        .map((json) => MovieModel.fromJson(json))
        .toList();

    final totalPages = response.data['total_pages'] as int;
    return (
      movies: dataFilter,
      totalPages: totalPages,
    );
  }

  @override
  Future<MovieModel> getmoviebyId(String id) async {
    final response = await dio.get('/movie/$id');

    if (response.statusCode != 200) {
      throw Exception('Movie por id: $id not found.');
    }
    return MovieModel.fromJson(response.data);
  }

  @override
  Future<List<ActorModel>> getMovieCast(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    final cast = response.data['cast'] as List;
    return cast
        .where(
            (json) => json['profile_path'] != null) // Filtrar actores sin foto
        .map((json) => ActorModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await dio.get(
      '/search/movie',
      queryParameters: {'query': query},
    );

    final data = response.data['results'] as List;
    final dataFilter = data
        .where((movie) =>
            movie['poster_path'] != null && movie['overview'].isNotEmpty)
        .map((json) => MovieModel.fromJson(json));

    return dataFilter.toList();
  }
}
