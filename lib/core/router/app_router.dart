import 'package:go_router/go_router.dart';
import 'package:movies_app/presentation/screens/movies/movie_detail_page.dart';
import 'package:movies_app/presentation/screens/movies/new_home_page.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      name: HomePage.name,
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
            path: '/movie/:id',
            name: MovieDetailPage.name,
            builder: (context, state) {
              final movieId = state.pathParameters['id'] ?? 'no-id';
              return MovieDetailPage(movieId: movieId);
            }),
      ])
]);
