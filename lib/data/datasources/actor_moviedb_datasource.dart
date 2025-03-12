import 'package:dio/dio.dart';
import 'package:movies_app/core/constants/environment.dart';
import 'package:movies_app/domain/usecases/actors_usecases.dart';
import 'package:movies_app/domain/entities/actor.dart';
import 'package:movies_app/data/mappers/actor_mapper.dart';
import 'package:movies_app/data/models/moviedb/credits_response.dart';

class ActorMovieDbDatasource extends ActorsUsecases {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Actor>> getActorByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    final castResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = castResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();
    return actors;
  }
}
