import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/di/injection_container.dart';
import 'package:movies_app/domain/entities/new_movie/movie.dart';
import 'package:movies_app/domain/usecases/get_movie_by_id.dart';
import 'package:movies_app/presentation/view_models/movie_detail_view_model.dart';

final theMovieDetailProvider = StateNotifierProvider.autoDispose<MovieDetailViewModel, AsyncValue<Movie>>((ref) {
  return MovieDetailViewModel(getIt<GetMovieByIdUseCase>());
});