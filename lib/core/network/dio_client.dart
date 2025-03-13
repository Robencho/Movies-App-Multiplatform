import 'package:dio/dio.dart';
import 'package:movies_app/core/constants/environment.dart';

class DiosClient{
  final Dio dio;

  DiosClient(): dio = Dio(){
    // base setup
    dio.options.baseUrl = Environment.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);

    // Interceptors
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.queryParameters['api_key'] = Environment.theMovieDbKey;
        return handler.next(options);
      },
      onError: (DioException e, handler){
        return handler.next(e);
      },
    ));
  }
}