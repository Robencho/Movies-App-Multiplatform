import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/presentation/providers/movies/movie_repository_provider.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>(
  (ref){
    final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
    return MoviesNotifier(
      fetchMoreMovies: fetchMoreMovies
    );
  }
);

final popularMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>(
  (ref){
    final fetchMoreMovies = ref.watch(movieRepositoryProvider).getPopular;
    return MoviesNotifier(
      fetchMoreMovies: fetchMoreMovies
    );
  }
);

final upcomingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>(
  (ref){
    final fetchMoreMovies = ref.watch(movieRepositoryProvider).getUpComing;
    return MoviesNotifier(
      fetchMoreMovies: fetchMoreMovies
    );
  }
);

final topRatedMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>(
  (ref){
    final fetchTopRatedMovies = ref.watch(movieRepositoryProvider).getTopRated;
    return MoviesNotifier(fetchMoreMovies: fetchTopRatedMovies);
  }
);

typedef MovieCallBack = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>>{
  int currentPage = 0;
  bool isloading = false;

  MovieCallBack fetchMoreMovies;


  MoviesNotifier(
    {
      required this.fetchMoreMovies,
    }
  ): super([]);

  // isloading controlla que se llame simultaneamente el paginador, solo hace llamado pagina por pagina.

  Future<void> loadNextPage() async{
    if(isloading) return;
    isloading = true;
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 300));
    isloading = false;
  }

}