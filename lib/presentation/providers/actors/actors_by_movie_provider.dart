import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/domain/entities/actor.dart';
import 'package:movies_app/presentation/providers/actors/actors_repository_provider.dart';

typedef GetActorCallback = Future<List<Actor>>Function(String movieId);


class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>>{

  final GetActorCallback getActors;

  ActorsByMovieNotifier(
    {
      required this.getActors,
    }
  ): super({});


  Future<void> loadActors(String movieId) async{
    if(state[movieId]!= null) return;
    final List<Actor> actors = await getActors(movieId);

    state = {...state, movieId: actors};
  }
}


final actorByMovieProvider = StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
  (ref){
    final actorsRepository = ref.watch(actorsRepositoryProvider);
     return ActorsByMovieNotifier(getActors: actorsRepository.getActorsByMovie);
  }
);