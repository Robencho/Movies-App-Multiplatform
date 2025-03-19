import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/di/injection_container.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/usecases/get_popular_movies.dart';

import '../../view_models/movie_view_model.dart';

final thePopularMoviesProvider = StateNotifierProvider.autoDispose<MovieViewModel, AsyncValue<List<Movie>>>((ref) {
  return MovieViewModel(getIt<GetPopularMoviesUseCase>()); // Inyecta el caso de uso
});