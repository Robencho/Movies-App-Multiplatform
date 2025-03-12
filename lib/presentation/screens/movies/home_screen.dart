import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/presentation/providers/movies/initial_loading_movies_provider.dart';
import 'package:movies_app/presentation/providers/movies/movies_providers.dart';
import 'package:movies_app/presentation/providers/movies/movies_slideshow_provider.dart';
import 'package:movies_app/presentation/widgets/shared/full_screen_loader.dart';

import '../../widgets/shared/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = "home-screen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _HomeView(),
      ),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final initLoading = ref.watch(initialLoadingProvider);
    if(initLoading) return const FullScreenloader();


    final moviesSlide = ref.watch(moviesSlideShowProvider);
    final nowPlayingmovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upComingMovies = ref.watch(upcomingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: CustomAppbar(),
            ),
        ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(children: [
          // CustomAppbar(),
          MoviesSlideshow(movies: moviesSlide),
          MovieHorizontalListview(
            movies: nowPlayingmovies,
            title: 'En cines',
            subTitle: 'Lunes 20',
            loadNextPage: () =>
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),
          MovieHorizontalListview(
            movies: popularMovies,
            title: 'Proximamente',
            subTitle: 'Este mes',
            loadNextPage: () =>
                ref.read(popularMoviesProvider.notifier).loadNextPage(),
          ),
          MovieHorizontalListview(
            movies: upComingMovies,
            title: 'Up-Coming',
            subTitle: 'Ya casi...',
            loadNextPage: () =>
                ref.read(upcomingMoviesProvider.notifier).loadNextPage(),
          ),
          MovieHorizontalListview(
            movies: topRatedMovies,
            title: 'Top-Rated',
            subTitle: 'Más top',
            loadNextPage: () =>
                ref.read(topRatedMoviesProvider.notifier).loadNextPage(),
          ),
          const SizedBox(
            height: 10,
          )
        ]);
      }, childCount: 1)),
    ]);
  }
}
