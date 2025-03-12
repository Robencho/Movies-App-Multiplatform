import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/data/datasources/moviedb_datasource.dart';
import 'package:movies_app/data/repositories/movie_repositorie_impl.dart';

// This repository is inmutable
final movieRepositoryProvider = Provider(
  (ref){
    return MovieRepositoryImpl(MoviedbDatasource());
  }
);