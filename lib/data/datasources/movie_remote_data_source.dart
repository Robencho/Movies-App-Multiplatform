
import 'package:dio/dio.dart';
import '../models/new_movie/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getPopularMovies();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  
  final Dio dio;

  MovieRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    // Llamada a la API de The Movie DB
    final response = await dio.get('/movie/popular');
    final data = response.data['results'] as List;

    return data.map((json)=> MovieModel.fromJson(json)).toList();
  }
}