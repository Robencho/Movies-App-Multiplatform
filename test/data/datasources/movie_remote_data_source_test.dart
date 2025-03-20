// tests/data/datasources/movie_remote_data_source_test.dart
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:movies_app/data/datasources/movie_remote_data_source_impl.dart';
import 'package:movies_app/data/datasources/movie_remote_datasource.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late MovieRemoteDataSource dataSource;

  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
    dataSource = MovieRemoteDataSourceImpl(dio: dio);
  });

  test('Debería retornar modelos de películas al buscar', () async {
    // Arrange
    const query = 'Avengers';
    final responseData = {
      'results': [
        {
          'id': 1,
          'adult': false,
          'title': 'Avengers',
          'poster_path': '/path.jpg',
          'overview': 'Película de superhéroes', // 👈 Campo requerido
          'release_date': '2024-01-01', // 👈 Si tu modelo lo requiere
          'vote_average': 8.5,
          'genre_ids': [28, 12],
          'runtime': 120,
          'total_pages': 5,
          'original_language':'en',
          'original_title':'Avengers',
          'video':true,
          'vote_count': 3,
          'backdrop_path': '/path.jpg',
          'popularity': 4.5
        }
      ]
    };

    dioAdapter.onGet(
      '/search/movie',
      (request) => request.reply(200, responseData),
      queryParameters: {'query': query},
    );

    // Act
    final result = await dataSource.searchMovies(query);

    // Assert
    expect(result.length, 1);
    expect(result[0].title, 'Avengers');
  });
}
