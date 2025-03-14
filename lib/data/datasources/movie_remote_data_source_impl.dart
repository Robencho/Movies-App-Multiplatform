
import 'package:dio/dio.dart';
import '../models/new_movie/movie_model.dart';
import 'movie_remote_datasource.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  
  final Dio dio;

  MovieRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<MovieModel>> getPopularMovies({int page = 1}) async {
    // Llamada a la API de The Movie DB
    final response = await dio.get('/movie/popular', queryParameters: {'page': page});
    final data = response.data['results'] as List;
    return data.map((json)=> MovieModel.fromJson(json)).toList();
  }
  
  @override
  Future<List<MovieModel>> getTopRated({int page = 1}) async {
    final response = await dio.get('/movie/top_rated', queryParameters: {'page': page});
    final data = response.data['results'] as List;
    return data.map((json)=> MovieModel.fromJson(json)).toList();
  }
  
  @override
  Future<List<MovieModel>> getUpComing({int page = 1}) async {
    final response = await dio.get('/movie/upcoming', queryParameters: {'page': page});
    final data = response.data['results'] as List;
    return data.map((json)=> MovieModel.fromJson(json)).toList();
  }
  
  @override
  Future<MovieModel> getmoviebyId(String id) async {
    final response = await dio.get('/movie/$id');

    if(response.statusCode != 200) throw Exception('Movie por id: $id not found.');
    return MovieModel.fromJson(response.data);
  }
}