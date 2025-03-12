import 'package:movies_app/domain/entities/actor.dart';
import 'package:movies_app/data/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
      id: cast.id,
      name: cast.name,
      profilePath: cast.profilePath!= null
      ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
      : 'https://cdn-icons-png.flaticon.com/512/4923/4923785.png',
      character: cast.character);
}
