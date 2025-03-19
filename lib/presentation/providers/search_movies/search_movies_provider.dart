import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/di/injection_container.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/search_movies.dart';

final searchMoviesProvider = StateNotifierProvider.autoDispose<SearchMoviesNotifier, AsyncValue<List<Movie>>>((ref) {
  return SearchMoviesNotifier(getIt<SearchMoviesUseCase>());
});

class SearchMoviesNotifier extends StateNotifier<AsyncValue<List<Movie>>> {
  final SearchMoviesUseCase searchMovies;
  Timer? _debounceTimer;

  SearchMoviesNotifier(this.searchMovies) : super(const AsyncValue.data([]));

  void search(String query) {
    if (query.length < 3) {
      state = const AsyncValue.data([]);
      return;
    }

    // Debounce para evitar múltiples llamadas
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      state = const AsyncValue.loading();
      try {
        final results = await searchMovies.execute(query);
        state = AsyncValue.data(results);
      } catch (e, st) {
        state = AsyncValue.error(e, st);
      }
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }
}