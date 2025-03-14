import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/domain/usecases/movie_usecase.dart';

import '../../domain/entities/new_movie/movie.dart';

class MovieViewModel extends StateNotifier<AsyncValue<List<Movie>>> {
 // final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final MovieUsecase useCase;

  int _currentPage = 1;
  bool _hashmorePages = true;

  MovieViewModel(this.useCase)
      : super(const AsyncValue.loading()) {
    loadMovies();
  }

  Future<void> loadMovies() async {
    if (!_hashmorePages) return;
    state = const AsyncValue.loading();
    try {
      final newMovies =
          await useCase.execute(page: _currentPage);
      _hashmorePages = newMovies.isNotEmpty;
      _currentPage++;
      state = AsyncValue.data([...state.value ?? [], ...newMovies]);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
