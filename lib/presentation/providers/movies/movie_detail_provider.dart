import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/presentation/providers/providers.dart';

typedef GetMovieCallback = Future<Movie>Function(String movieId);


class MovieMapNotifier extends StateNotifier<Map<String, Movie>>{

  final GetMovieCallback getMovie;

  MovieMapNotifier(
    {
      required this.getMovie,
    }
  ): super({});


  Future<void> loadMovie(String movieId) async{
    if(state[movieId]!= null) return;
    final movie = await getMovie(movieId);

    state = {...state, movieId: movie};
  }
}


final movieDetailProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>(
  (ref){
    final fetchMovieDet = ref.watch(movieRepositoryProvider).getmoviebyId;
    return MovieMapNotifier(
      getMovie: fetchMovieDet
    );
  }
);