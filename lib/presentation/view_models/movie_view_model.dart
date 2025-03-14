import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/domain/usecases/movie_usecase.dart';

import '../../domain/entities/new_movie/movie.dart';

class MovieViewModel extends StateNotifier<AsyncValue<List<Movie>>> {
  final MovieUsecase useCase;

  int _currentPage = 1;
  int _totalPages = 1;
  final List<Movie> _currentMovies = [];
  bool _isLoading = false;

  MovieViewModel(this.useCase)
      : super(const AsyncValue.loading()) {
    loadMovies();
  }

  bool get hashMore => _currentPage <= _totalPages;

  Future<void> loadMovies() async {
   if (!hashMore || _isLoading) return;
  _isLoading = true;
  if (_currentPage == 1) state = const AsyncValue.loading();

    try {
       final result = await useCase.execute(page: _currentPage);
      _totalPages = result.totalPages;
      _currentPage++;
      _currentMovies.addAll(result.movies);
      
      state = AsyncValue.data(List.from(_currentMovies));
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }finally{
      _isLoading = false;
    }
  }
}
