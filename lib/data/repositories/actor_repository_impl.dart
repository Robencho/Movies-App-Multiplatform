import 'package:movies_app/domain/usecases/actors_usecases.dart';
import 'package:movies_app/domain/entities/actor.dart';
import 'package:movies_app/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository{

  final ActorsUsecases actorsUsecases;

  ActorRepositoryImpl(this.actorsUsecases);


  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return actorsUsecases.getActorByMovie(movieId);
  }

}