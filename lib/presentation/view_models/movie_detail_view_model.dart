import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/usecases/get_movie_by_id.dart';

class MovieDetailViewModel extends StateNotifier<AsyncValue<Movie>> {
  final GetMovieByIdUseCase getMoviebyIdUseCase;

  MovieDetailViewModel(this.getMoviebyIdUseCase)
      : super(const AsyncValue.loading());

  Future<void> loadMovieDetail(String id) async {
    AsyncValue.loading();
    try {
      final movieDetail = await getMoviebyIdUseCase.execute(id);

      state = AsyncValue.data(movieDetail);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
