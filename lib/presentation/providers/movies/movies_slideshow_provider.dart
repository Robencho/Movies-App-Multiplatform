import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/presentation/providers/providers.dart';

final moviesSlideShowProvider = Provider<List<Movie>>((ref) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    if(nowPlayingMovies.isEmpty){
      return [];
    }else{
      return nowPlayingMovies.sublist(0,3);
    }
});