import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/di/injection_container.dart';
import 'package:movies_app/domain/entities/actor.dart';
import 'package:movies_app/domain/usecases/get_movie_cast.dart';

final movieCreditsProvider = StateNotifierProvider.autoDispose.family<
  MovieCreditsNotifier, 
  AsyncValue<List<Actor>>, 
  String
>((ref, movieId) {
  return MovieCreditsNotifier(getIt<GetMovieCastUseCase>(), movieId);
});

class MovieCreditsNotifier extends StateNotifier<AsyncValue<List<Actor>>> {
  final GetMovieCastUseCase getMovieCast;
  final String movieId;
  bool _isLoading = false; // Nueva bandera

  MovieCreditsNotifier(this.getMovieCast, this.movieId) 
    : super(const AsyncValue.loading()) {
    loadCast(); // Solo se llama una vez
  }

  Future<void> loadCast() async {
    if (_isLoading) return; // Evita llamadas duplicadas
    
    _isLoading = true;
    state = const AsyncValue.loading();
    
    try {
      final cast = await getMovieCast.execute(movieId);
      state = AsyncValue.data(cast);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    } finally {
      _isLoading = false; // Restablece el estado
    }
  }
}