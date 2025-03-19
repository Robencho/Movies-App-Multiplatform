import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/presentation/providers/new_movie_provider/top_rated_movies_provider.dart';
import 'package:movies_app/presentation/providers/new_movie_provider/up_coming_movies_provider.dart';

import '../../providers/new_movie_provider/popular_movies_provider.dart';
import '../../view_models/movie_view_model.dart';

class HomePage extends ConsumerWidget {
  static const name = "new-home-screen";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return Scaffold(
      appBar: AppBar(title: const Text('Poncho Movie DB'),
      actions: [
        IconButton(
          onPressed: ()=> context.push('/search'), 
          icon: const Icon(Icons.search)),
      ],),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Categoría 1: Populares
            _buildCategorySection(
              context: context,
              title: 'Populares',
              provider: thePopularMoviesProvider,
            ),
            
            // Categoría 2: Mejor Valoradas
            _buildCategorySection(
              context: context,
              title: 'Mejor Valoradas',
              provider: theTopRatedMoviesProvider,
            ),
            
            // Categoría 3: Próximos Estrenos
            _buildCategorySection(
              context: context,
              title: 'Próximos Estrenos',
              provider: theUpcomingMoviesProvider,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection({
    required BuildContext context,
    required String title,
    required AutoDisposeStateNotifierProvider<MovieViewModel, AsyncValue<List<Movie>>> provider,
  }) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(title, style: Theme.of(context).textTheme.headlineSmall),
        ),
        SizedBox(
          width: double.infinity,
          height: size.height * 0.25,
          child: MoviesHorizontalList(provider: provider),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class MoviesHorizontalList extends ConsumerWidget {
  final AutoDisposeStateNotifierProvider<MovieViewModel, AsyncValue<List<Movie>>> provider;

  const MoviesHorizontalList({super.key, required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesState = ref.watch(provider);
    final viewModel = ref.read(provider.notifier);

    return NotificationListener<ScrollEndNotification>(
      onNotification: (notification) {
        final metrics = notification.metrics;
        if (metrics.extentAfter < 500) {
          viewModel.loadMovies();
        }
        return true;
      },
      child: moviesState.when(
        data: (movies) => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length + (viewModel.hashMore ? 1 : 0),
          itemBuilder: (ctx, i) {
            if (i < movies.length) {
              return _MovieCard(movie: movies[i]);
            } else {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(child: CircularProgressIndicator()),
              );
            }
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Text('Error: $error'),
      ),
    );
  }
}

class _MovieCard extends StatelessWidget {
  final Movie movie;
  const _MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(3),
      child: SizedBox(
        width: size.width * 0.28,
        child: GestureDetector(
          onTap: () {
            context.push('/movie/${movie.id}');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.posterPath,
                  width: size.width * 0.26,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star_half_outlined),
                  Text(movie.voteAverage.toString(), style: textStyles.labelMedium,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}