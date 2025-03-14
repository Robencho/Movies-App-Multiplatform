import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/domain/entities/new_movie/movie.dart';
import 'package:movies_app/presentation/providers/new_movie_provider/get_movie_by_id_provider.dart';

class MovieDetailPage extends ConsumerWidget {
  static const name = "movie-detail-page";
  final String movieId;

  const MovieDetailPage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetailState = ref.watch(theMovieDetailProvider);

    // Carga los datos al iniciar
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(theMovieDetailProvider.notifier).loadMovieDetail(movieId);
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Movie Detail')),
      body: movieDetailState.when(
        data: (movie) => _buildMovieDetail(movie, context),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Text('Error: $error'),
      ),
    );
  }

  Widget _buildMovieDetail(Movie movie, BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.network(movie.backdropPath),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(movie.title, style: textStyles.headlineMedium),
                Text('Duración: ${movie.runtimeType} minutos'),
                Text('Géneros: ${movie.genreIds.join(', ')}'),
                Text(movie.overview),
              ],
            ),
          )
        ],
      ),
    );
  }
}
