import 'package:movies_app/domain/entities/actor.dart';

abstract class ActorsUsecases{
  Future<List<Actor>> getActorByMovie(String movieId);
  
}