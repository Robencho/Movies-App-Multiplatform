// presentation/view_models/movie_view_model.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/di/injection_container.dart';
import 'package:movies_app/domain/usecases/get_popular_movies.dart';

import '../../domain/entities/new_movie/movie.dart';

class MovieViewModel extends StateNotifier<AsyncValue<List<Movie>>> {
  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  MovieViewModel(this.getPopularMoviesUseCase) : super(const AsyncValue.loading()) {
    loadMovies();
  }

  Future<void> loadMovies() async {
    state = const AsyncValue.loading();
    try {
      final movies = await getPopularMoviesUseCase.execute();
      state = AsyncValue.data(movies);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

// Provider asociado
final movieViewModelProvider = StateNotifierProvider<MovieViewModel, AsyncValue<List<Movie>>>((ref) {
  return MovieViewModel(getIt<GetPopularMoviesUseCase>());
});