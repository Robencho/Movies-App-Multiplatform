import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/presentation/view_models/movie_view_model.dart';

class HomePage extends ConsumerWidget {
  static const name = "new-home-screen";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //Puedes usar este en lugar del view model final moviesAsync = ref.watch(popularMoviesProvider);
    final moviesViewModelAsync = ref.watch(movieViewModelProvider);

    return Scaffold(
      body: moviesViewModelAsync.when(
        data: (movies) => ListView.builder(
          itemCount: movies.length,
          itemBuilder: (ctx, i) => Text(movies[i].title),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Text('Error: $error'),
      ),
    );
  }
}
