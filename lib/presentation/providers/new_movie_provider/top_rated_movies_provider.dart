import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/di/injection_container.dart';
import 'package:movies_app/domain/usecases/get_top_rated_usecase.dart';

import '../../../domain/entities/new_movie/movie.dart';
import '../../view_models/movie_view_model.dart';

final theTopRatedMoviesProvider = StateNotifierProvider.autoDispose<MovieViewModel, AsyncValue<List<Movie>>>((ref) {
  return MovieViewModel(getIt<GetTopRatedUseCase>());
});