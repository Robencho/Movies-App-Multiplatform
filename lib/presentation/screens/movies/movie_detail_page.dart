import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies_app/domain/entities/new_movie/movie.dart';
import 'package:movies_app/presentation/providers/new_movie_provider/get_movie_by_id_provider.dart';

import '../../../domain/entities/actor.dart';
import '../../providers/new_movie_provider/movie_credits_provider.dart';

class MovieDetailPage extends ConsumerWidget {
  static const name = "movie-detail-page";
  final String movieId;

  const MovieDetailPage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetailState = ref.watch(theMovieDetailProvider);
    final creditsState =
        ref.watch(movieCreditsProvider(movieId)); // Provider con family

    // Carga inicial
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(theMovieDetailProvider.notifier).loadMovieDetail(movieId);
      if (!creditsState.isLoading && creditsState.value == null) {
        ref.read(movieCreditsProvider(movieId).notifier).loadCast();
      }
    });

    return Scaffold(
      body: movieDetailState.when(
        data: (movie) =>
            _BuildMovieContent(movie: movie, creditsState: creditsState),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Text('Error: $error'),
      ),
    );
  }
}

class _BuildMovieContent extends StatelessWidget {
  final Movie movie;
  final AsyncValue<List<Actor>> creditsState;

  const _BuildMovieContent({required this.movie, required this.creditsState});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: size.height * 0.5,
          flexibleSpace: FlexibleSpaceBar(
            background: CachedNetworkImage(
              imageUrl: movie.posterPath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title, style: textStyle.titleLarge,),
                SizedBox(height: 20,),
                Text(movie.overview)
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: creditsState.when(
            data: (actors) => _ActorListHorizontal(actors: actors),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Text('Error: $error'),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100,
          ),
        )
      ],
    );
  }
}

class _ActorListHorizontal extends StatelessWidget {
  final List<Actor> actors;

  const _ActorListHorizontal({required this.actors});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: actors.length,
        itemBuilder: (context, index) => _ActorCard(actor: actors[index]),
      ),
    );
  }
}

class _ActorCard extends StatelessWidget {
  final Actor actor;
  const _ActorCard({required this.actor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3),
      child: SizedBox(
        width: 120,
        height: 300,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                actor.profilePath,
                width: 100,
              ),
            ),
            Text(actor.name),
            Text(actor.character)
          ],
        ),
      ),
    );
  }
}
