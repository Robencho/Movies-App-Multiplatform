import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/di/injection_container.dart';
import 'package:movies_app/domain/usecases/get_popular_movies.dart';

import '../../../domain/entities/new_movie/movie.dart';

final popularMoviesProvider = FutureProvider.autoDispose<({List<Movie>movies, int totalPages})>((ref) async {
  final useCase = getIt<GetPopularMoviesUseCase>();
  return await useCase.execute();
});