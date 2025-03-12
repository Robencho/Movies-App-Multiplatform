import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/data/datasources/actor_moviedb_datasource.dart';
import 'package:movies_app/data/repositories/actor_repository_impl.dart';

final actorsRepositoryProvider = Provider((ref){
  return ActorRepositoryImpl(ActorMovieDbDatasource());
});