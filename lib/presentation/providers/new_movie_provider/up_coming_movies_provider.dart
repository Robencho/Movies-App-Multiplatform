import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/di/injection_container.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/usecases/get_upcoming_movies_usecase.dart';
import 'package:movies_app/presentation/view_models/movie_view_model.dart';

final theUpcomingMoviesProvider = StateNotifierProvider.autoDispose<MovieViewModel, AsyncValue<List<Movie>>>((ref) {
  return MovieViewModel(getIt<GetUpcomingMoviesUsecase>());
});