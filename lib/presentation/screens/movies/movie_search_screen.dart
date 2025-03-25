import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/search_movies/search_movies_provider.dart';
import '../../widgets/movie_search_item.dart';

class MovieSearchScreen extends ConsumerWidget {
  static const name = "movie-search-screen";

  const MovieSearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(searchMoviesProvider);
    final notifier = ref.read(searchMoviesProvider.notifier);
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor:colors.surface ,
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Buscar películas...',
            border: InputBorder.none,
          ),
          onChanged: notifier.search,
        ),
      ),
      body: searchState.when(
        data: (movies) => ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) => MovieSearchItem(
            movie: movies[index],
            onTap: () => context.push('/movie/${movies[index].id}'),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Text('Error: $error'),
      ),
    );
  }
}
