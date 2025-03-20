import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/repositories/movie_repositorie.dart';
import 'package:movies_app/domain/usecases/get_popular_movies.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late GetPopularMoviesUseCase useCase;
  late MockMovieRepository mockRepository;

  setUp(() {
    mockRepository = MockMovieRepository();
    useCase = GetPopularMoviesUseCase(mockRepository);
  });

  test('Debería retornar lista de películas desde el repositorio', () async {
    // Arrange
    final movies = [
      Movie(
          adult: false,
          backdropPath: 'backdropPath',
          genreIds: [],
          id: 1,
          originalLanguage: 'en',
          originalTitle: 'originalTitle',
          overview: 'overview',
          popularity: 2.4,
          posterPath: 'posterPath',
          releaseDate: 'releaseDate',
          title: 'title',
          video: true,
          voteAverage: 4.6,
          voteCount: 8,
          totalPages: 25)
    ];
    const totalPages = 5;

    when(() => mockRepository.getPopularMovies()).thenAnswer((_) async =>
        (movies: movies, totalPages: totalPages)); // 👈 Retorna el record

    // Act
    final result = await useCase.execute(); // 👈 result ahora es un record

    // Assert
    expect(result.movies, equals(movies)); // 👈 Accede a la propiedad movies
    expect(result.totalPages, equals(totalPages));
    verify(() => mockRepository.getPopularMovies()).called(1);
  });
}
