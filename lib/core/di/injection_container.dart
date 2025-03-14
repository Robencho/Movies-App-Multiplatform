import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/core/network/dio_client.dart';
import 'package:movies_app/data/datasources/movie_remote_data_source_impl.dart';
import 'package:movies_app/data/repositories/new_repositorie/movie_repositorie_impl.dart';
import 'package:movies_app/domain/usecases/get_movie_by_id.dart';
import 'package:movies_app/domain/usecases/get_popular_movies.dart';
import 'package:movies_app/domain/usecases/get_top_rated_usecase.dart';
import 'package:movies_app/domain/usecases/get_upcoming_movies_usecase.dart';

import '../../data/datasources/movie_remote_datasource.dart';
import '../../domain/repositories/new_repositorie/movie_repositorie.dart';

final getIt = GetIt.instance;

void setupDependencies(){
  // Client HTTP
  getIt.registerLazySingleton<http.Client>(()=> http.Client());

  // Client Dio
  getIt.registerLazySingleton<Dio>(()=> DiosClient().dio);

  // Repositories
   getIt.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(remoteDataSource: getIt()),
  );

  // DataSources
  getIt.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(dio: getIt()),
  );

  // Casos de Uso
  getIt.registerLazySingleton(() => GetPopularMoviesUseCase(getIt()));
  getIt.registerLazySingleton(()=> GetTopRatedUseCase(getIt()));
  getIt.registerLazySingleton(()=> GetUpcomingMoviesUsecase(getIt()));
  getIt.registerLazySingleton(()=> GetMovieByIdUseCase(getIt()));
}